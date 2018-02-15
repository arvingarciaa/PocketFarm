const db = require('./db')
// const state = require('./state')

function popAndExecuteQueue (state) {
    // Pop the outgoing queue.
    let recent = db.peekQueue()

    if (!!recent) db.popQueue(recent)

    if (db.countQueue() !== 0) {
        let newRecent = db.peekQueue()
        state.emit('executeQueue', newRecent.contents)
    }
}

module.exports = popAndExecuteQueue