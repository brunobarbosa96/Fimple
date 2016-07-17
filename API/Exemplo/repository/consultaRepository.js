module.exports = (app) => {

    var repository = {

        getAll: (req, res, callback) => {
            app.config.connection.execute('SP_SelExemploUsuarios', req.params, (err, row) => {
                if (err)
                    return callback(err, null);
                else
                    return callback(null, row);
            });
        },

        getById: (req, res, callback) => {
            app.config.connection.execute('SP_SelExemploUsuariosId', req.params, (err, row) => {
                if (err)
                    return callback(err, null);
                else
                    return callback(null, row);
            });
        },

        getByName: (req, res, callback) => {
            app.config.connection.execute('SP_SelExemploUsuariosNome', req.params, (err, row) => {
                if (err)
                    return callback(err, null);
                else
                    return callback(null, row);
            });
        }

    };

    return repository;
};