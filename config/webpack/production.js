process.env.NODE_ENV = process.env.NODE_ENV || 'production'

const environment = require('./environment')

devServer: {
    headers: {
        'Access-Control-Allow-Origin': '*'
    }
}

module.exports = environment.toWebpackConfig()
