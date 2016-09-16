module.exports = (app) => {

    var repository = {

        get: (req, res, callback) => {
            console.log(req.query);
            app.config.connection.execute('SP_SelecionaPublicacoes', {
                IdUsuario: req.query.IdUsuario,
                Recentes: req.query.Recentes,
                IdPublicacao: req.query.IdPublicacao
            }, (err, row) => {
                if (err)
                    return callback(err, null);
                return callback(null, row);
            });
        },

        post: (req, res, callback) => {
            console.log(req.body);
            app.config.connection.execute('SP_InserePublicacao', {
                IdUsuario: req.body.IdUsuario,
                Titulo: req.body.Titulo,
                Conteudo: req.body.Conteudo,
                IdEntidade: req.body.IdEntidade,
                IdCategoria: req.body.IdCategoria,
                IdCurso: req.body.IdCurso
            }, (err, row) => {
                return err
                    ? callback(null, err)
                    : callback(null, row);
            });
        },

        put: (req, res, callback) => {
            console.log(req.body);
            app.config.connection.execute('SP_AtualizaPublicacao', {
                IdPublicacao: req.body.IdPublicacao,
                IdUsuario: req.body.IdUsuario,
                Titulo: req.body.Titulo,
                Conteudo: req.body.Conteudo,
                IdEntidade: req.body.IdEntidade,
                IdCategoria: req.body.IdCategoria,
                IdCurso: req.body.IdCurso
            },
                (err, row) => {
                    return err
                        ? callback(null, err)
                        : callback(null, row);
                });
        },

        delete: (req, res, callback) => {
            console.log(req.query);
            app.config.connection.execute('SP_DeletaPublicacao', {
                Id: req.params.Id
            },
                (err, row) => {
                    return err
                        ? callback(null, err)
                        : callback(null, row);
                });
        }

    };

    return repository;
};