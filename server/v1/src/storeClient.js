const _extends = require('./_extends')
exports['default'] = {}

let client = { send: function () { console.error("No clients connected.") }, default: true }

exports.getClient = function () {
    return !client.default ? client : null
}

exports.setClient = function (newClient) {
    if (!newClient) {
        client = { send: function () { console.error("No clients connected.") }, default: true }
    } else {
        client = newClient
    }
}

module.exports = _extends(exports['default'], exports)