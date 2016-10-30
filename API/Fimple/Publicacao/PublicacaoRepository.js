module.exports = (app) => {

    var publicacao = app.models.publicacao;
    var repository = {

        get: (req, res, callback) => {
            try {
                publicacao.find()
                    .exec((err, row) => {
                        return callback(err, row);
                    });
            } catch (e) {
                return callback(e);
            } 
        },

        post: (req, res, callback) => {
            try {
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
            } catch (e) {
                return callback(e);
            } 
           
        },

        put: (req, res, callback) => {
            try {
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
            } catch (e) {
                return callback(e);
            } 
        },

        delete: (req, res, callback) => {
            try {
                publicacao.update({ Id: req.params.Id }, {
                    Ativa: 0
                }).exec((err, row) => {
                    return callback(err, row);
                });
            } catch (e) {
                return callback(e);
            } 
            
        }

    };

    return repository;
};