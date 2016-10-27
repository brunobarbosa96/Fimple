var diskAdapter = require('../Login/node_modules/sails-disk'),
    postgresAdapter = require('../Login/node_modules/sails-postgresql');

module.exports = () => {

    var config = {

        // Setup Adapters
        // Creates named adapters that have been required
        adapters: {
            'default': diskAdapter,
            disk: diskAdapter,
            postgres: postgresAdapter
        },

        // Build Connections Config
        // Setup connections using the named adapter configs
        connections: {
            myLocalDisk: {
                adapter: 'disk'
            },

            myLocalSql: {
                adapter: 'postgres',
                database: 'Fimple',
                host: 'localhost',
                user: 'Admin',
                password: 'Fimple@2016',
                port: 5432,
                ssl: false
            }
        },

        defaults: {
            migrate: 'alter'
        }

    };

    return config;
};
