var adapter = require('../Exemplo/node_modules/sails-sqlserver');

module.exports = {

    adapters: {
        default: adapter
    },

    connections: {
        default: {
            adapter: 'default',
            database: 'Fimple',
            host: '189.90.130.120',
            port: 1433,
            user: 'Admin',
            persistent: true,
            password: 'Fimple@2016'
        }
    },

    defaults: {
        migrate: 'create'
    }

};
