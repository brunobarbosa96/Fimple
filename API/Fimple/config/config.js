var diskAdapter = require('sails-disk'),
    postgresAdapter = require('sails-postgresql'),
    msSqlAdapter = require('sails-sqlserver');

module.exports = () => {

    var config = {

        // Setup Adapters
        // Creates named adapters that have been required
        adapters: {
            'default': diskAdapter,
            disk: diskAdapter,
            postgres: postgresAdapter,
            msSql: msSqlAdapter
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
            // myLocalSql: {
            //    adapter: 'msSql',
            //    database: 'Fimple',
            //    host: 'localhost',
            //    user: 'Admin',
            //    password: 'Fimple@2016',
            //    port: 5432,
            //    ssl: false
            //}
        },

        defaults: {
            migrate: 'alter'
        }

    };

    return config;
};
