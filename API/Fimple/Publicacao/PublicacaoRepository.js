module.exports = (app) => {

    var publicacao = app.models.publicacao;
    var repository = {

        get: (req, res, callback) => {
            publicacao.find()
                .exec((err, row) => {
                    return callback(err, row);
                });
        },

        post: (req, res, callback) => {
            publicacao.create({
                IdUsuario: req.body.IdUsuario,
                Titulo: req.body.Titulo,
                Conteudo: req.body.Conteudo,
                IdEntidade: req.body.IdEntidade,
                IdCategoria: req.body.IdCategoria,
                IdCurso: req.body.IdCurso
            }).exec((err, row) => {
                return callback(err, row);
            });
        },

        put: (req, res, callback) => {
            publicacao.update({ Id: req.body.IdPublicacao }, {
                IdUsuario: req.body.IdUsuario,
                Titulo: req.body.Titulo,
                Conteudo: req.body.Conteudo,
                IdEntidade: req.body.IdEntidade,
                IdCategoria: req.body.IdCategoria,
                IdCurso: req.body.IdCurso
            }).exec((err, row) => {
                return callback(err, row);
            });
        },

        delete: (req, res, callback) => {
            publicacao.update({ Id: req.params.Id }, {
                Ativa: 0
            }).exec((err, row) => {
                return callback(err, row);
            });
        }

    };

    return repository;
};