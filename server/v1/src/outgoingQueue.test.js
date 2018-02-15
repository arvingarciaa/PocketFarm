jest.mock('./state')
jest.mock('./storeClient', () => ({ getClient: jest.fn(() => ({ send: jest.fn() })), setClient: jest.fn() }))

const state = require('./state')
const db = require('./db')
const storeClient = require('./storeClient')
let outgoingQueue = require('./outgoingQueue')
let receiveMessage = require('./receiveMessage')

describe('outgoingQueue', () => {
    it('sets up an object, addToQueue, executeQueue, responseCommand', () => {
        expect(typeof outgoingQueue).toBe('object')
        expect(typeof outgoingQueue.addToQueue).toBe('function')
        expect(typeof outgoingQueue.executeQueue).toBe('function')
        expect(typeof outgoingQueue.responseCommand).toBe('function')
    })

    describe('addToQueue', () => {
        const emit = jest.spyOn(state, 'emit')
        const addQueue = outgoingQueue.addToQueue(state)

        beforeEach(() => {
            db.initializeQueue()
            emit.mockClear()
        })

        it('adds things to the queue', () => {
            outgoingQueue.addToQueue(state)('test')
            expect(db.countQueue()).toEqual(1)
        })
        
        it(`pops the queue when it's the only element`, () => {
            addQueue('test')
            expect(emit).toHaveBeenCalledWith('executeQueue', 'test')
        })
        
        it(`does not pop the queue when there's more than one element`, () => {            
            addQueue('test')
            addQueue('test')
            expect(emit).toHaveBeenCalledWith('executeQueue', 'test')
            expect(emit).toHaveBeenCalledTimes(1)
        })
    })

    describe('executeQueue', () => {
        beforeEach(() => {
            db.initializeQueue()
        })

        it('execute the first command', () => {
            // Add three test commands.
            outgoingQueue.addToQueue(state)('test 1')
            outgoingQueue.addToQueue(state)('test 2')
            outgoingQueue.addToQueue(state)('test 3')
            outgoingQueue.executeQueue(state)('test 1')
            // It must send data once.
            // expect(storeClient.getClient().send).toHaveBeenCalledTimes(1)
            // expect(storeClient.getClient().send).toHaveBeenCalledWith('test 1')
            // It must have reduced the number of elements.
            expect(db.countQueue()).toBe(3)
            expect(db.peekQueue().contents).toBe('test 1')
        })

        it('must not execute non-first command', () => {
            // Add three test commands.
            outgoingQueue.addToQueue(state)('test 1')
            outgoingQueue.addToQueue(state)('test 2')
            outgoingQueue.addToQueue(state)('test 3')

            function failingTest () {
                outgoingQueue.executeQueue(state)('test 2')
            }

            expect(failingTest).toThrow('QueueExecuteMismatchError')
            expect(db.countQueue()).toBe(3)
            expect(db.peekQueue().contents).toBe('test 1')
        })

        it('pops the command after 3s timeout', () => {
            jest.useFakeTimers()

            outgoingQueue.addToQueue(state)('test 1')
            outgoingQueue.executeQueue(state)('test 1')
            
            expect(db.countQueue()).toBe(1)
            expect(db.peekQueue().contents).toBe('test 1')
            
            jest.runAllTimers()
            
            expect(db.countQueue()).toBe(0)
        })
    })

    describe('responseCommand', () => {
        const emit = jest.spyOn(state, 'emit')
        const addQueue = outgoingQueue.addToQueue(state)
        const responseCommand = outgoingQueue.responseCommand(state)

        beforeEach(() => {
            db.initializeQueue()
            db.initializeStorage()
            emit.mockClear()
        })

        it('parses and saves AT+CMGR replies', () => {
            responseCommand(['AT+CMGR=2', '+CMGR: "REC READ","+639062875909","","18/01/28,18:38:10+32"', 'Q'], 'OK')
            
            expect(db.countInbox()).toBe(1)
            expect(db.peekInbox().number).toBe("+639062875909")
        })

        it('parses and saves AT+CMGR longer line replies', () => {
            responseCommand(['AT+CMGR=6', '+CMGR: "REC READ","8080","","18/01/28,19:51:48+32"', 'Naku, malapit nang mag-expire ang iyong ASTIGTXT30! Gusto mo ba itong i-extend nang isang araw pa, P5 lang? I-text ang EXTEND to 8080 bago mag-expire a'], 'OK')

            expect(db.countInbox()).toBe(1)
            expect(db.peekInbox().number).toBe("8080")
        })
        
        it('forwards message for processing', () => {
            responseCommand(['AT+CMGR=2', '+CMGR: "REC READ","+639062875909","","18/01/28,18:38:10+32"', 'Q'], 'OK')

            expect(state.emit).toHaveBeenCalledWith('readTextMessage', '+639062875909', ['Q'])
        })
        
        it('deletes the message from the server', () => {
            responseCommand(['AT+CMGR=2', '+CMGR: "REC READ","+639062875909","","18/01/28,18:38:10+32"', 'Q'], 'OK')
            
            expect(state.emit).toHaveBeenCalledWith('sendLine', 'AT+CMGD=2')
        })
        // it('checks and verifies the first command', () => {
        //     outgoingQueue.addToQueue(state)('test 1')
        //     receiveMessage(state)(null, 'test 1\r\r\nOK\r\n')

        //     expect(db.countQueue()).toBe(0)
        // })

        // it('executes the command after', () => {
        //     outgoingQueue.addToQueue(state)('test 1')
        //     outgoingQueue.addToQueue(state)('test 2')
        //     receiveMessage(state)(null, 'test 1\r\r\nOK\r\n')

        //     expect(db.countQueue()).toBe(1)
        //     expect(state.emit).toHaveBeenCalledWith('executeQueue', 'test 2')
        // })

        // it('fails on wrong command', () => {
        //     outgoingQueue.addToQueue(state)('test 1')

        //     function failingTest () {
        //         outgoingQueue.responseCommand(state)('test 2', 'OK')
        //     }

        //     expect(failingTest).toThrow('QueuePopMismatchError')
        //     expect(db.countQueue()).toBe(1)
        // })
        
        
        // it('fails on GSM error reply', () => {
        //     outgoingQueue.addToQueue(state)('test 1')

        //     function failingTest () {
        //         outgoingQueue.responseCommand(state)(['test 1'], 'ERROR')
        //     }
            
        //     expect(failingTest).toThrow('GSMReplyError')
        //     expect(db.countQueue()).toBe(1)
        // })
    })
})
