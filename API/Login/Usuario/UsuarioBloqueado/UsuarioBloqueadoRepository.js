module.exports = (app) => {

    var usuario = app.models.usuario;
    var usuarioBloqueado = app.models.usuariobloqueado;
    var repository = {

        getAll: (req, res, callback) => {

            var usuariosBloqueados;
            usuarioBloqueado.find({ IdUsuarioBloqueou: req.params.Id })
                .exec((err, row) => {
                    if (err)
                        return callback(err, null);

                    usuariosBloqueados = row.map((usuarioBloqueado) => usuarioBloqueado.IdUsuarioBloqueado)
                    usuario.find({ Id: usuariosBloqueados })
                        .exec((err, row) => {
                            return callback(err, row);
                        });
                });

        },

        post: (req, res, callback) => {
            usuarioBloqueado.create({
                IdUsuarioBloqueado: req.body.IdUsuarioBloqueado,
                IdUsuarioBloqueou: req.body.IdUsuarioBloqueou
            }).exec((err, row) => {
                return callback(err, row);
            });
        },

        delete: (req, res, callback) => {
            console.log(req.query);
            usuarioBloqueado.destroy()
                .where({
                    IdUsuarioBloqueou: req.query.IdUsuarioBloqueou,
                    IdUsuarioBloqueado: req.query.IdUsuarioBloqueado
                })
                .exec((err, row) => {
                    return callback(err, row);
                })
        }
    };

    return repository;
};