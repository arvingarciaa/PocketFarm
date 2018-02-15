const WebSocket = require('ws')
const state = require('./state')

/**
 * =================================================================================
 * This block of code sets up the WebSockets server.
 * =================================================================================
 */

const wss = new WebSocket.Server({ port: 5000, clientTracking: true })

wss.on('connection', ws => {
    state.emit('setClient', ws)
    state.emit('addToQueue', 'AT+CMGF=1')
    
    ws.isAlive = true
    
    ws.on('pong', heartbeat)

    ws.on('message', message => {
        state.emit('receiveMessage', ws, message)
    })

    ws.on('close', () => {
        state.emit('closeClient', ws)
    })
})

// Take care of the pings and the pongs of the Web Socket connection.
const interval = setInterval(() =>  {
    wss.clients.forEach(ws => {
        if (ws.isAlive === false) return ws.terminate()

        ws.isAlive = false
        ws.ping(noop)
    })
}, 30000)

function noop() { }

function heartbeat() {
    this.isAlive = true
}

module.exports = wss