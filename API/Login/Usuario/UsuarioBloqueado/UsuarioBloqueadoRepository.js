module.exports = (app) => {

    var usuario = app.models.usuario;
    var usuarioBloqueado = app.models.usuariobloqueado;
    var curso = app.models.curso;
    var repository = {

        getAll: (req, res, callback) => {
            usuarioBloqueado.find({ IdUsuarioBloqueou: req.params.Id})
                .exec((err, row) => {
                    callback(err, row);
                });
        },

        post: (req, res, callback) => {
            app.config.connection.execute('SP_InsereUsuarioBloqueado', {
                IdUsuarioBloqueado: req.body.IdUsuarioBloqueado,
                IdUsuarioBloqueou: req.body.IdUsuarioBloqueou
            }, (err, row) => {
                return err
                    ? callback(err, null)
                    : callback(null, row[0]);
            });
        },

        delete: (req, res, callback) => {
            app.config.connection.execute('SP_DeletaUsuarioBloqueado', {
                IdUsuarioBloqueado: req.query.IdUsuarioBloqueado,
                IdUsuarioBloqueou: req.query.IdUsuarioBloqueou
            }, (err, row) => {
                return err
                    ? callback(err, null)
                    : callback(null, row[0]);
            });
        }
    };

    return repository;
};