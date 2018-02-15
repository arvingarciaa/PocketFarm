const db = require('./db')
const state = require('./state')
const setupReadLine = require('./setupReadLine')
const enableReadLine = require('./enableReadLine')(setupReadLine.onLine, setupReadLine.onQuit)

require('dotenv').config()