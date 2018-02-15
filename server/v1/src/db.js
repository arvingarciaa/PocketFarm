const loki = require('lokijs')
const moment = require('moment')
const path = require('path')
const LokiFSStructuredAdapter = require('lokijs/src/loki-fs-structured-adapter')
const state = require('./state')
const _extends = require('./_extends')


let dbPath = path.resolve(__dirname, '../logs/log.db')

// export default
const db = exports['default'] = new loki(dbPath, { 
    adapter: new LokiFSStructuredAdapter(),
    autosave: true, 
    autoload: true,
    autosaveInterval: 1000,
    autoloadCallback: autoloadCallback
})

function autoloadCallback () {
    textHistory()
    textStorage()
    geocodes()
    state.emit('databaseReady')
}

// exports everything else begin
// Text history
let textHistory = exports.textHistory = function () {
    return db.getCollection('textHistory') || db.addCollection('textHistory')  
}

exports.initializeTextHistory = function () {
    if (db.getCollection('textHistory')) {
        db.removeCollection('textHistory')
    }

    db.addCollection('textHistory')
}

exports.saveIncomingText = function (data) {
    saveText('incoming', data)
}

exports.saveOutgoingText = function (data) {
    saveText('outgoing', data)
}

function saveText (textType, data) {
    textHistory().insert({
        type: textType,
        contents: data
    })

    db.saveDatabase()
}

// Outgoing Queue
exports.initializeQueue = function () {
    if (db.getCollection('textHistory')) {
        db.removeCollection('textHistory')
    }

    db.addCollection('textHistory')
}

exports.addToQueue = function (data) {
    textHistory().insert({
        type: "outgoing",
        contents: data,
        done: false
    })

    db.saveDatabase()
}

exports.countQueue = function () {
    return textHistory().count({ type: "outgoing", done: false })
}

exports.peekQueue = function () {
    // return textHistory().find({ done: false })
    return textHistory().findOne({ type: "outgoing", done: false })
}

exports.popQueue = function (doc) {
    doc.done = true
    textHistory().update(doc)

    db.saveDatabase()
}

// Inbox, Outbox
let textStorage = exports.textStorage = function () {
    return db.getCollection('textStorage') || db.addCollection('textStorage')
}

exports.initializeStorage = function () {
    if (db.getCollection('textStorage')) {
        db.removeCollection('textStorage')
    }

    db.addCollection('textStorage')
}

exports.saveToInbox = function (number, timestamp, message) {
    textStorage().insert({
        where: 'inbox',
        number: number,
        timestamp: timestamp,
        message: message
    })

    db.saveDatabase()
}

exports.saveToOutbox = function (number, message) {
    textStorage().insert({
        where: 'outbox',
        number: number,
        timestamp: moment().format(),
        message: message
    })

    db.saveDatabase()
}

exports.countInbox = function () {
    return textStorage().count({ where: 'inbox' })
}

exports.peekInbox = function () {
    return textStorage().findOne({ where: 'inbox' })
}

exports.countOutbox = function () {
    return textStorage().count({ where: 'outbox' })
}

exports.peekOutbox = function () {
    return textStorage().findOne({ where: 'outbox' })
}

// Geocodes
let geocodes = exports.geocodes = function () {
    return db.getCollection('geocodes') || db.addCollection('geocodes')
}

exports.initializeGeocodes = function () {
    if (db.getCollection('geocodes')) {
        db.removeCollection('geocodes')
    }

    db.addCollection('geocodes')
}

exports.saveGeocode = function (address, latitude, longitude, formattedAddress) {
    geocodes().insert({
        address: address,
        latitude: latitude,
        longitude: longitude,
        formattedAddress: formattedAddress
    })

    db.saveDatabase()
}

exports.countGeocodes = function () {
    return geocodes().count()
}

exports.searchGeocodes = function (address) {
    return geocodes().findOne({ address: address })
}

// exports everything else end

module.exports = _extends(exports['default'], exports)