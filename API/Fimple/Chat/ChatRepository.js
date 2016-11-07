module.exports = (app) => {

    var mensagem = app.models.mensagem;
    var repository = {

        get: (req, res, callback) => {
            try {
                mensagem.find({
                    or: [
                        { UsuarioEnvio: req.params.Id },
                        { UsuarioDestino: req.params.Id }
                    ]
                })
                    .paginate({ page: req.query.Pagina, limit: 25 })
                    .populate("UsuarioEnvio", { select: ["Id", "Nome"] })
                    .populate("UsuarioDestino", { select: ["Id", "Nome"] })
                    .exec((err, row) => {
                        return callback(err, row);
                    });
            } catch (e) {
                return callback(e);
            }
        },

        post: (req, res, callback) => {
            mensagem.create({
                Conteudo: req.body.Conteudo,
                UsuarioEnvio: req.body.UsuarioEnvio.Id,
                UsuarioDestino: req.body.UsuarioDestino.Id,
            }).exec((err, row) => {
                return callback(err, row);
            });
        },

        put: (req, res, callback) => {
            mensagem.update({
                DataRecebimento: req.body.DataRecebimento,
                DataVisualizacao: req.body.DataVisualizacao,
            }).exec((err, row) => {
                return callback(err, row);
            });
        },

        delete: (req, res, callback) => {
            mensagem.destroy({ Id: req.params.Id }).exec((err, row) => {
                return callback(err, row);
            });
        }

    };

    return repository;
};