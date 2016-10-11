var diskAdapter = require('../Exemplo/node_modules/sails-disk'),
    sqlAdapter = require('../Exemplo/node_modules/sails-sqlserver');

module.exports = () => {

    var config = {

        // Setup Adapters
        // Creates named adapters that have been required
        adapters: {
            'default': diskAdapter,
            disk: diskAdapter,
            sql: sqlAdapter
        },

        // Build Connections Config
        // Setup connections using the named adapter configs
        connections: {
            myLocalDisk: {
                adapter: 'disk'
            },

            myLocalSql: {
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
            migrate: 'safe'
        }

    };

    return config;
};
