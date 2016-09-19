module.exports = (app) => {

    var repository = {

        getAll: (req, res, callback) => {
            app.config.connection.execute('SP_SelecionaUsuariosBloqueados',
            {
                IdUsuarioBloqueou: req.params.Id
            },
                (err, row) => {
                    return err
                        ? callback(err, null)
                        : callback(null, row);
                });
        },

        post: (req, res, callback) => {
            app.config.connection.execute('SP_InsereUsuarioBloqueado', {
                IdUsuarioBloqueado: req.body.IdUsuarioBloqueado,
                IdUsuarioBloqueou: req.body.IdUsuarioBloqueou
            }, (err, row) => {
                return err
                    ? callback(err, null)
                    : callback(null, row);
            });
        },

        delete: (req, res, callback) => {
            console.log("repository");
            app.config.connection.execute('SP_DeletaUsuarioBloqueado', {
                IdUsuarioBloqueado: req.params.IdUsuarioBloqueado,
                IdUsuarioBloqueou: req.params.IdUsuarioBloqueou
            }, (err, row) => {
                return err
                    ? callback(err, null)
                    : callback(null, row);  
                });
        }
    };

    return repository;
};