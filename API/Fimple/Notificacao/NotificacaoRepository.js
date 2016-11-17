module.exports = (app) => {

    var notificacao = app.models.notificacao;
    var usuario = app.models.usuario;

    var repository = {

        get: (req, res, callback) => {
            try {
                notificacao.find({ Usuario: req.params.IdUsuario, DataVisualizacao: null },
                    {
                        select: ["Usuario", "Publicacao"]
                    })
                    .populate("Usuario", { select: ["Id", "Nome"] })
                    .populate("Publicacao", { select: ["Id", "Conteudo", "Usuario"] })
                    .exec((err, row) => {
                        usuario.find({ select: ["Id", "Nome"] }).exec((error, rows) => {
                            if (error)
                                return callback(error);

                            for (var i in row) 
                                row[i].Publicacao.Usuario = rows.filter((x) => x.Id == row[i].Publicacao.Usuario)[0];

                            return callback(err, row);
                        });
                    });
            } catch (e) {
                return callback(e);
            }
        },

        post: (req, res, callback) => {
            try {
                notificacao.create({
                    Usuario: req.body.Usuario.Id,
                    Publicacao: req.body.IdPublicacao
                }).exec((err, row) => {
                    console.log(row);
                    return callback(err, row);
                });
            } catch (e) {
                return callback(e);
            }
        },

        put: (req, res, callback) => {
            try {
                notificacao.update({
                    Id: req.body.Id
                }, {
                        DataVisualizacao: new Date()
                    }).exec((err, row) => {
                        return callback(err, row);
                    });
            } catch (e) {
                return callback(e);
            }
        },

        delete: (req, res, callback) => {
            try {
                notificacao.destroy({ Id: req.params.Id }).exec((err, row) => {
                    return callback(err, row);
                });
            } catch (e) {
                return callback(e);
            }
        }

    };

    return repository;
};