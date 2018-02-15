const wss = require('./wss')
const state = require('./state')
const db = require('./db')

module.exports = {
    onLine: function onLine (line) {
        state.emit('sendLine', line)
    },
    onQuit: function onQuit () {
        console.log("Goodbye.")
        db.close()
        wss.clients.forEach(ws => {
            ws.close()
        })
    }

}