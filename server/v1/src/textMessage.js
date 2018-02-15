const rp = require('request-promise')
const moment = require('moment')
const _extends = require('./_extends')
const db = require('./db')

let textMessage = exports['default'] = {}

let read = exports.read = function (state) {
    return function (number, message) {
        if (number.indexOf('+639') !== -1 && number.length === 13) {
            if (message[0].indexOf('PANAHON ') !== -1) {
                const address = (message[0].match(/PANAHON (.*)/i)[1])
                return getGeocode(address).then(geocode => {
                    return getHourlyForecast(geocode.latLong).then(results => {
                        // console.warn(JSON.stringify(results))
                        const relativity = moment(results.chanceOfRain.time, 'H:mm A').isBefore(moment()) ? 'Bukas ng' : 'Mamayang'
                        const reply = [`Heto na ang lagay ng panahon para sa "${geocode.formattedAddress}" at mga karatig lugar.`,
                                        ``,
                                       `Sa susunod na 24 oras, magkakaroon tayo ng ${translateToTagalog(results.weather)}. ${relativity} ${results.chanceOfRain.time} naman, asahan ang ${translateToTagalog(results.chanceOfRain.weather)} (${results.chanceOfRain.chance}% tsansa ng pag-ulan).`,
                                        ``,
                                       `Maraming salamat sa pagtext sa PocketFarm!`].join('\r\n')
                        write(state, number, reply)
                        return results
                    }).catch(err => { 
                        write(state, number, `Pasensya na, pero hindi ko mahanap ang iyong lugar. Ibang malapit na lugar kaya? Mag-text ng "PANAHON <iyong lugar o siyudad>" sa 09061255620. Salamat!`)
                     })
                }).catch(err => { 
                    write(state, number, `Pasensya na, pero hindi ko mahanap ang iyong lugar. Ibang malapit na lugar kaya? Mag-text ng "PANAHON <iyong lugar o siyudad>" sa 09061255620. Salamat!`)
                 })
            } else {
                // console.warn(number, message, number.indexOf('+639'), number.length)
                write(state, number, `Pasensya na't hindi ko naintindihan ang iyong text. Para malaman ang lagay ng panahon at tsansa ng ulan, mag-text ng "PANAHON <iyong lugar o siyudad>" sa 09061255620. Salamat!`)
            }
        }
    }
}

let write = exports.write = function (state, number, message) {
    db.saveToOutbox(number, message)

    state.emit('sendLine', `AT+CMGS="${number}"`)
    state.emit('sendLine', message)
    state.emit('sendLine', '\\26')
}

let getGeocode = exports.getGeocode = function (address) {
    const sanitizedAddress = address.toLowerCase().replace(/[^0-9a-z\ -_&]/gi, '')
    const googleWeatherAPIKey = process.env.GOOGLE_WEATHER_KEY
    const addressQueryURL = `https://maps.googleapis.com/maps/api/geocode/json?address=${escapeHTML(address)}&key=${googleWeatherAPIKey}`
    const doesExist = db.searchGeocodes(sanitizedAddress)

    if (!!doesExist) {
        return new Promise((resolve, reject) => {
            resolve({ latLong: `${doesExist.latitude},${doesExist.longitude}`, formattedAddress: doesExist.formattedAddress })
        })
    } else {
        return rp.get(addressQueryURL).then(result => {
            result = JSON.parse(result)
            let latitude = result.results[0].geometry.location.lat
            let longitude = result.results[0].geometry.location.lng
            let formattedAddress = result.results[0].formatted_address
            db.saveGeocode(sanitizedAddress, latitude, longitude, formattedAddress)
            return { latLong: `${latitude},${longitude}`, formattedAddress: formattedAddress }
        })
    }
}

let getHourlyForecast = exports.getHourlyForecast = function (geocode, test) {
    const wundergroundAPIKey = process.env.WUNDERGROUND_KEY
    const addressQueryURL = test ? `http://192.168.1.11:5000/${geocode}.json` : `http://api.wunderground.com/api/${wundergroundAPIKey}/conditions/hourly/q/${geocode}.json`
    return rp.get(addressQueryURL).then(result => {
        result = JSON.parse(result)
        // console.log(result, addressQueryURL)
        let weather = result.current_observation.weather
        let filtered = result.hourly_forecast.map(x => ({ time: x.FCTTIME.civil, weather: x.wx, chance: Number(x.pop) }))
        let countWeather = filtered.reduce((count, forecast) => { return Object.assign(count, { [forecast.weather]: (count[forecast.weather] || 0) + 1 }) }, {})
        let probableWeather = Object.keys(countWeather).reduce((mostLikely, forecast) => { return (countWeather[forecast] > mostLikely.count) ? { name: forecast, count: countWeather[forecast] } : mostLikely }, { name: '', count: 0 })
        let highestChanceOfRain = filtered.reduce((currMax, forecast) => { return (forecast.chance > currMax.chance) ? { time: forecast.time, chance: Number(forecast.chance), weather: forecast.weather } : currMax  }, { time: '', chance: 0, weather: '' })

        // console.log(filtered)
        // console.log(highestChanceOfRain)
        // console.log(probableWeather)
        // console.log(countWeather)
        // let pop = result.hourly_forecast.map(x => ({ time: x })) // ?

        return { weather: probableWeather.name, chanceOfRain: highestChanceOfRain }
    })
}

function translateToTagalog (forecast) {
    switch (forecast) {
        case 'Clear':
            return 'maaliwalas na panahon'
            break
        case 'Partly Cloudy':
            return 'bahagyang maulap na panahon'
            break
        case 'Mostly Cloudy':
            return 'sobrang maulap na panahon'
            break
        case 'Cloudy':
            return 'maulap na panahon'
            break
        case 'Hazy':
            return 'makulimlim na panahon'
            break
        case 'Foggy':
            return 'mahamog na panahon'
            break
        case 'Very Hot':
            return 'mainit na panahon'
            break
        case 'Very Cold':
            return 'malamig na panahon'
            break
        case 'Chance of Showers':
            return 'dagliang pag-ambon'
            break
        case 'Showers':
            return 'pag-ambon'
            break
        case 'Chance of Rain':
            return 'dagliang pag-ulan'
            break
        case 'Rain':
            return 'pag-ulan'
            break
        case 'Chance of a Thunderstorm':
            return 'panakanakang pagkulog at pagkidlat'
            break
        case 'Thunderstorm':
            return 'pagkulog at pagkidlat'
            break
        default:
            return forecast
            break

    }
}
// Heto na ang lagay ng panahon para sa {}.
// Ngayong araw, magkakaroon tayo ng {}.
// Mamayang {} naman, asahan ang {} at {}% tsansa ng pag-ulan.
// Maraming salamat sa pagtext sa PocketFarm!
function escapeHTML(s) {
    return s.replace(/&/g, '&amp;')
            .replace(/"/g, '&quot;')
            .replace(/</g, '&lt;')
            .replace(/>/g, '&gt;')
            .replace(/ /g, '+')
}

module.exports = _extends(exports['default'], exports)