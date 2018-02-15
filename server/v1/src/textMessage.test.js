jest.mock('./state', () => ({ emit: jest.fn() }))
const textMessage = require('./textMessage')
const rp = require('request-promise')
const db = require('./db')
const state = require('./state')

describe('textMessage', () => {
    it('sets up an object, read, write', () => {
        expect(typeof textMessage).toBe('object')
        expect(typeof textMessage.read).toBe('function')
        expect(typeof textMessage.write).toBe('function')
    })

    describe('read', () => {
        const emit = jest.spyOn(state, 'emit')
        // const addQueue = outgoingQueue.addToQueue(state)
        // const responseCommand = outgoingQueue.responseCommand(state)

        beforeEach(() => {
            db.initializeQueue()
            db.initializeStorage()
            // emit.mockClear()
        })

        it('sends a canned response back to incorrect queries', () => {
            textMessage.read(state)('+639062875909', 'Hello!')
            
            expect(db.countOutbox()).toBe(1)
            expect(db.peekOutbox().message).toBe(`Pasensya na't hindi ko naintindihan ang iyong text. Para malaman ang lagay ng panahon at tsansa ng ulan, mag-text ng "PANAHON <iyong lugar o siyudad>" sa 09061255620. Salamat!`)
        })
        
        it('replies only to numbers starting in +639', () => {
            textMessage.read(state)('8080', 'Hello!')
            
            expect(db.countOutbox()).toBe(0)
        })
        
        it('must reply with weather data to correct queries', async () => {
            expect.assertions(1)
            const results = await textMessage.read(state)('+639062875909', ['PANAHON Quezon City'])

            expect(Object.keys(results)).toEqual(['weather', 'chanceOfRain'])
        })
    })

    describe('write', () => {
        const emit = jest.spyOn(state, 'emit')
        // const addQueue = outgoingQueue.addToQueue(state)
        // const responseCommand = outgoingQueue.responseCommand(state)

        beforeEach(() => {
            db.initializeQueue()
            db.initializeStorage()
            emit.mockClear()
        })

        it('saves the message to outbox', () => {
            textMessage.write(state, '+639062875909', `Pasensya na't hindi ko naintindihan ang iyong text. Para malaman ang lagay ng panahon at tsansa ng ulan, mag-text ng "PANAHON <iyong lugar o siyudad>" sa 09061255620. Salamat!`)
            
            expect(db.countOutbox()).toBe(1)
            expect(db.peekOutbox().number).toBe('+639062875909')
        })

        it('adds the complete commands to the queue', () => {
            textMessage.write(state, '+639062875909', `Pasensya na't hindi ko naintindihan ang iyong text. Para malaman ang lagay ng panahon at tsansa ng ulan, mag-text ng "PANAHON <iyong lugar o siyudad>" sa 09061255620. Salamat!`)

            expect(state.emit).toHaveBeenCalledTimes(3)
            expect(state.emit).toHaveBeenCalledWith('sendLine', 'AT+CMGS="+639062875909"')
            expect(state.emit).toHaveBeenCalledWith('sendLine', `Pasensya na't hindi ko naintindihan ang iyong text. Para malaman ang lagay ng panahon at tsansa ng ulan, mag-text ng "PANAHON <iyong lugar o siyudad>" sa 09061255620. Salamat!`)
            expect(state.emit).toHaveBeenCalledWith('sendLine', '\\26')
        })
    })

    describe('getGeocode', () => {
        const emit = jest.spyOn(state, 'emit')

        beforeEach(() => {
            db.initializeQueue()
            db.initializeStorage()
            db.initializeGeocodes()
            emit.mockClear()
        })

        it('gets the geocode for Quezon City', async () => {
            expect.assertions(1)

            const data = await textMessage.getGeocode('Quezon City')

            expect(data).toEqual({ latLong: '14.6760413,121.0437003', address: 'Quezon City, Metro Manila, Philippines' })
        })
        
        it('saves the output to the database', async () => {
            expect.assertions(1)

            const data = await textMessage.getGeocode('Quezon City')
            // const calls = db.geocodes().find()
            const calls = db.countGeocodes()

            expect(calls).toBe(1)
        })

        it('does not query the API for existing geocodes', async () => {
            const get = jest.spyOn(rp, 'get')
            expect.assertions(1)

            const data = await textMessage.getGeocode('Quezon City')
            const data2 = await textMessage.getGeocode('Quezon City')
            expect(get).toHaveBeenCalledTimes(1)
        })
    })

    describe('getHourlyForecast', () => {
        const emit = jest.spyOn(state, 'emit')

        beforeEach(() => {
            db.initializeQueue()
            db.initializeStorage()
            // db.initializeGeocodes()
            emit.mockClear()
        })

        it('gets the current weather', async () => {
            expect.assertions(1)

            const data = await textMessage.getHourlyForecast('14.6760413,121.0437003', true)
            expect(data).toEqual({ weather: 'Partly Cloudy', chanceOfRain: { time: '1:00 PM', chance: 53, weather: 'Showers' }})
        })
    })
})