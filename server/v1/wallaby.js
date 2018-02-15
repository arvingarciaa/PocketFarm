module.exports = function (wallaby) {
    var path = require('path');
    process.env.NODE_PATH +=
      path.delimiter +
      path.join(__dirname, 'node_modules') +
      path.delimiter +
      path.join(__dirname, 'node_modules/react-scripts/node_modules');
    require('module').Module._initPaths();

    return {
        files: [
        'src/**/*.+(js|jsx|json|snap|css|less|sass|scss|jpg|jpeg|gif|png|svg)',
        '!src/**/*.test.js?(x)'
        ],

        tests: ['src/**/*.test.js?(x)'],

        env: {
          type: 'node',
          runner: 'node'
        },

        
        // compilers: {
          // '**/*.js': wallaby.compilers.babel({
            // presets: ['env']
          // })
        // },

        testFramework: 'jest'
    };
};