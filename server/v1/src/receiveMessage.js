const db = require('./db')
const popAndExecuteQueue = require('./popAndExecuteQueue')

function receiveMessage (state) {
    return function (ws, message) {
        // const state = this
        // Save incoming text first
        db.saveIncomingText(message)

        // Clean and parse the message into parts
        const parseMessage = message.split("\n").map(x => x.trim()).filter(x => x)

        // Note if we're expecting a second line.
        let commandEcho = []
        let commandResponse = ''
        

        console.warn(JSON.stringify(message), parseMessage)
        
        // Parse each message one by one
        parseMessage.forEach(line => {
            if (line.indexOf('+CMTI') !== -1) {
                const textIndex = Number(line.split(',')[1])
                state.emit('getText', textIndex)
            } else if (line === 'OK' || line === 'ERROR' || line === '>') {
                commandResponse = line
                state.emit('responseCommand', commandEcho, commandResponse)
            } else {
                commandEcho.push(line)
            }

        })

        popAndExecuteQueue(state)
    }
}

module.exports = receiveMessage