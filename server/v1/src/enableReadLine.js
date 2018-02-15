const readline = require('readline')
const util = require('util')
const colors = require('colors')

function enableReadLine (onLine, onQuit) {
    /**
     * =================================================================================
     * This block of code takes care of modifying the readline interface to handle prompts.
     * =================================================================================
     */

    // Creates the interface for the readline prompt.
    const rl = readline.createInterface({
        input: process.stdin,
        output: process.stdout,
    })

    // Modifies core logging to ensure user input stays in one line even if data gets received.
    let fu = function (type, args) {
        let t = Math.ceil((rl.line.length + 3) / process.stdout.columns)
        let text = util.format.apply(console, args)
        rl.output.write('\n\x1B[' + t + 'A\x1B[0J')

        if (type === 'error') {
            rl.output.write(colors.bgRed.bold.white(' ! '))
            rl.output.write(' ' + text + '\n')
        } else if (type === 'warn') {
            rl.output.write(colors.bgYellow.bold.white(' ! '))
            rl.output.write(' ' + text + '\n')
        } else {
            rl.output.write(text + '\n')
        }

        rl.output.write(Array(t).join('\n\x1B[E'))
        rl._refreshLine()
    }

    // Overwrite the default console.log with our custom logging function.
    console.log = function () {
        fu('log', arguments)
    }

    // Overwrite the default console.error with our custom logging function.
    console.error = function () {
        fu('error', arguments)
    }

    // Overwrite the default console.warn with our custom logging function.
    console.warn = function () {
        fu('warn', arguments)
    }

    // Set the preliminary characters before every prompt.
    rl.setPrompt(colors.green.bold('> '), 2)

    // Forward user input to the state FSM, indicating the current state.
    rl.on('line', (line) => {
        onLine(line)
        rl.prompt()
    })

    // Properly close the program.
    rl.on('close', () => process.exit(0))

    // Prompt the user for confirmation before exit.
    rl.on('SIGINT', () => {
        readline.clearLine(process.stdout, 0)
        onQuit()
        process.exit(0)
    })

}

module.exports = enableReadLine