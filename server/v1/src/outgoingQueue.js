const moment = require('moment')
const _extends = require('./_extends')
// const state = require('./state')
const db = require('./db')
const storeClient = require('./storeClient')
const popAndExecuteQueue = require('./popAndExecuteQueue')

let outgoingQueue = exports['default'] = {}

exports.addToQueue = function (state) {
    return function (line) {
        db.addToQueue(line)

        if (db.countQueue() === 1) {
            state.emit('executeQueue', line)
        }
    }
}

exports.executeQueue = function (state) {
    return function (line) {
        let recent = db.peekQueue()
        if (recent.contents === line) {
            setTimeout(() => {
                storeClient.getClient().send(line)
                setTimeout(() => {
                    if (db.peekQueue() === recent) {
                        popAndExecuteQueue(state)
                    }
                }, 3000)
            }, 500)
        } else {
            throw new Error('QueueExecuteMismatchError')
        }
    }
}

exports.responseCommand = function (state) {
    return function (echo, reply) {
        let line = echo.shift()
        if (line && line.indexOf('AT+CMGR') !== -1) {
            let messageNumber = line.match(/AT\+CMGR=(\d+)/i)[1] // ?
            line = echo.shift().split(',').map(x => x.replace(/\"/g, ''))
            let clientNumber = line[1]
            let clientTimestamp = moment(`${line[3]} ${line[4]}`.match(/(.*)\+32/i)[1], "YY/MM/DD HH:mm:ss").format() // ?
            let clientMessage = echo.slice()

            db.saveToInbox(clientNumber, clientTimestamp, clientMessage)

            // Read and parse the text message.
            state.emit('readTextMessage', clientNumber, clientMessage)

            // Delete the mesasge from the server
            state.emit('sendLine', `AT+CMGD=${messageNumber}`)
        }
    }
}

// exports.responseCommand = function (state) {
//     return function (echo, reply) {
//         let recent = db.peekQueue()
//         if ((!!recent && recent.contents === echo[0] && reply === 'OK') 
//             || (echo && echo[0].indexOf('+CMGS') !== -1 && reply === 'OK')
//             || (reply === '>')) {


//         } else if (recent && recent.contents !== echo[0]) {
//             console.error('QueuePopMismatchError:', echo, reply)
//             // throw new Error('QueuePopMismatchError')
//         } else {
//             console.error('GSMReplyError:', echo, reply)
//             // throw new Error('GSMReplyError')
//         }

//         if (!!recent) db.popQueue(recent)

//         if (db.countQueue() !== 0) {
//             let newRecent = db.peekQueue()
//             state.emit('executeQueue', newRecent.contents)
//         }
//     }
// }

module.exports = _extends(exports['default'], exports)