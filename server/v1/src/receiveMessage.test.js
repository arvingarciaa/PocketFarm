jest.mock('./state')
// jest.mock('./db', () => ({ saveIncomingText: jest.fn() }))

const receiveMessage = require('./receiveMessage')
const outgoingQueue = require('./outgoingQueue')
const db = require('./db')
const state = require('./state')

describe('receiveMessage', () => {
    const emit = jest.spyOn(state, 'emit')

    beforeEach(() => {
        db.initializeQueue()
        emit.mockReset()
    })

    it('returns a function', () => {
        expect(typeof receiveMessage).toBe('function')
    })

    it('saves to database', () => {
        receiveMessage(state)(null, 'test message')
        expect(db.textHistory().findOne({ type: 'incoming' }).contents).toBe('test message')
    })

    it('parses incoming unsolicited text messages', () => {
        receiveMessage(state)(null, `\r\n+CMTI: "SM",2\r\n`)
        expect(state.emit).toHaveBeenCalledWith('getText', 2)
    })
    
    it('parses incoming solicited text messages', () => {
        outgoingQueue.addToQueue(state)('AT')
        receiveMessage(state)(null, `AT\r\r\nOK\r\n`)
        expect(state.emit).toHaveBeenCalledWith('responseCommand', ['AT'], 'OK')
    })

    it('checks and verifies the first command', () => {
        outgoingQueue.addToQueue(state)('test 1')
        receiveMessage(state)(null, 'test 1\r\r\nOK\r\n')

        expect(db.countQueue()).toBe(0)
    })

    it('executes the command after', () => {
        outgoingQueue.addToQueue(state)('test 1')
        outgoingQueue.addToQueue(state)('test 2')
        receiveMessage(state)(null, 'test 1\r\r\nOK\r\n')

        expect(db.countQueue()).toBe(1)
        expect(state.emit).toHaveBeenCalledWith('executeQueue', 'test 2')
    })

    it('AT+CMGR=2', () => {
        receiveMessage(state)(null, `AT+CMGR=2\r\r\n+CMGR: \"REC READ\",\"+639062875909\",\"\",\"18/01/28,18:38:10+32\"\r\nQ\r\n\r\nOK\r\n`)
        expect(state.emit).toHaveBeenCalledWith('responseCommand', ['AT+CMGR=2', '+CMGR: "REC READ","+639062875909","","18/01/28,18:38:10+32"', 'Q'], 'OK')
    })

    it('AT+CMGF=1', () => {
        receiveMessage(state)(null, `AT+CMGF=1\r\r\nOK\r\n`)
        expect(state.emit).toHaveBeenCalledWith('responseCommand', ['AT+CMGF=1'], 'OK')
    })
    
    it('AT+CMGL="ALL"', () => {
        receiveMessage(state)(null, `AT+CMGL=\"ALL\"\r\r\n+CMGL: 1,\"REC READ\",\"+639062875909\",\"\",\"18/01/28,18:37:56+32\"\r\nW\r\n\r\n+CMGL: 2,\"REC READ\",\"+639062875909\",\"\",\"18/01/28,18:38:10+32\"\r\nQ\r\n\r\n+CMGL: 3,\"REC READ\",\"+639062875909\",\"\",\"18/01/28,19:13:08+32\"\r\nW\r\n\r\n+CMGL: 4,\"REC READ\",\"+639062875909\",\"\",\"18/01/28,19:41:26+32\"\r\nW\r\n\r\n+CMGL: 5,\"REC READ\",\"+639062875909\",\"\",\"18/01/28,19:42:39+32\"\r\nW\r\n\r\n+CMGL: 6,\"REC READ\",\"8080\",\"\",\"18/01/28,19:51:48+32\"\r\nNaku, malapit nang mag-expire ang iyong ASTIGTXT30! Gusto mo ba itong i-extend nang isang araw pa, P5 lang? I-text ang EXTEND to 8080 bago mag-expire a\r\n\r\n+CMGL: 7,\"REC READ\",\"8080\",\"\",\"18/01/28,19:51:49+32\"\r\nng iyong ASTIGTXT30. For other TM promos, dial *143# for free.\r\n\r\n+CMGL: 8,\"REC READ\",\"+639062875909\",\"\",\"18/01/28,19:54:24+32\"\r\nG\r\n\r\n+CMGL: 9,\"REC READ\",\"8080\",\"\",\"18/01/28,22:52:09+32\"\r\nExpired na ang iyong ASTIGTXT30. Mag-register ulit, text A30 to 8080.\r\n\r\n+CMGL: 10,\"REC READ\",\"+639062875909\",\"\",\"18/01/29,00:14:53+32\"\r\nTest\r\n\r\n+CMGL: 11,\"REC READ\",\"+639062875909\",\"\",\"18/01/29,00:15:43+32\"\r\nTest\r\n\r\n+CMGL: 12,\"REC READ\",\"+639062875909\",\"\",\"18/01/29,00:16:28+32\"\r\nTest\r\n\r\nOK\r\n`)
        expect(state.emit).toHaveBeenCalledWith('responseCommand', ["AT+CMGL=\"ALL\"", "+CMGL: 1,\"REC READ\",\"+639062875909\",\"\",\"18/01/28,18:37:56+32\"", "W", "+CMGL: 2,\"REC READ\",\"+639062875909\",\"\",\"18/01/28,18:38:10+32\"", "Q", "+CMGL: 3,\"REC READ\",\"+639062875909\",\"\",\"18/01/28,19:13:08+32\"", "W", "+CMGL: 4,\"REC READ\",\"+639062875909\",\"\",\"18/01/28,19:41:26+32\"", "W", "+CMGL: 5,\"REC READ\",\"+639062875909\",\"\",\"18/01/28,19:42:39+32\"", "W", "+CMGL: 6,\"REC READ\",\"8080\",\"\",\"18/01/28,19:51:48+32\"", "Naku, malapit nang mag-expire ang iyong ASTIGTXT30! Gusto mo ba itong i-extend nang isang araw pa, P5 lang? I-text ang EXTEND to 8080 bago mag-expire a", "+CMGL: 7,\"REC READ\",\"8080\",\"\",\"18/01/28,19:51:49+32\"", "ng iyong ASTIGTXT30. For other TM promos, dial *143# for free.", "+CMGL: 8,\"REC READ\",\"+639062875909\",\"\",\"18/01/28,19:54:24+32\"", "G", "+CMGL: 9,\"REC READ\",\"8080\",\"\",\"18/01/28,22:52:09+32\"", "Expired na ang iyong ASTIGTXT30. Mag-register ulit, text A30 to 8080.", "+CMGL: 10,\"REC READ\",\"+639062875909\",\"\",\"18/01/29,00:14:53+32\"", "Test", "+CMGL: 11,\"REC READ\",\"+639062875909\",\"\",\"18/01/29,00:15:43+32\"", "Test", "+CMGL: 12,\"REC READ\",\"+639062875909\",\"\",\"18/01/29,00:16:28+32\"", "Test"], 'OK')
    })

    it('AT+CMGS="+639062875909"', () => {
        receiveMessage(state)(null, `AT+CMGS=\"+639062875909\"\r\r\n> `)
        expect(state.emit).toHaveBeenCalledWith('responseCommand', ['AT+CMGS=\"+639062875909\"'], '>')
    })
    
    it('Hello!', () => {
        receiveMessage(state)(null, `Hello!\r\n> `)
        expect(state.emit).toHaveBeenCalledWith('responseCommand', ['Hello!'], '>')
    })
    
    it('\26', () => {
        receiveMessage(state)(null, `\r\n+CMGS: 57\r\n\r\nOK\r\n`)
        expect(state.emit).toHaveBeenCalledWith('responseCommand', ['+CMGS: 57'], 'OK')
    })

})
