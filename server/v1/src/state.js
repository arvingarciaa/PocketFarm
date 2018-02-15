const EventEmitter = require('events')

class FSM extends EventEmitter { }
const state = new FSM()

const receiveMessage = require('./receiveMessage')
const outgoingQueue = require('./outgoingQueue')
const storeClient = require('./storeClient')
const textMessage = require('./textMessage')

/**
 * =================================================================================
 * Handles states as for easy management.
 * =================================================================================
 */

state.on('databaseReady', () => {
    const wss = require('./wss')
})

state.on('setClient', ws => {
    if (!storeClient.getClient()) {
        storeClient.setClient(ws)
    }
})

state.on('closeClient', ws => {
    if (storeClient.getClient() === ws) {
        storeClient.setClient(null)
    }
})

state.on('sendLine', line => {
    let binaryZ = new Uint8Array(1)
    binaryZ[0] = 26

    // client.send(line.indexOf("\\26") != -1 ? binaryZ : line)
    state.emit('addToQueue', line.indexOf('\\26') != -1 ? binaryZ : line)
})

state.on('receiveMessage', receiveMessage(state))
state.on('addToQueue', outgoingQueue.addToQueue(state))
state.on('executeQueue', outgoingQueue.executeQueue(state))
state.on('responseCommand', outgoingQueue.responseCommand(state))
state.on('readTextMessage', textMessage.read(state))

state.on('getText', number => {
    console.log(`Getting text #${number}`)
    state.emit('sendLine', `AT+CMGR=${number}`)
    // state.emit('addToQueue', `AT+CMGD=1`)
})

module.exports = state
