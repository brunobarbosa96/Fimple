module.exports = (app) => {

    var repository = {

        get: (req, res, callback) => {
            app.config.connection.execute('SP_SelecionaPublicacoes', (err, row) => {
                return err
                    ? callback(err, null)
                    : callback(null, row);
            });
        },

        post: (req, res, callback) => {
            app.config.connection.execute('SP_InserePublicacao', {
                IdUsuario: req.body.IdUsuario,
                Titulo: req.body.Titulo,
                Conteudo: req.body.Conteudo,
                IdEntidade: req.body.IdEntidade,
                IdCategoria: req.body.IdCategoria,
                IdCurso: req.body.IdCurso
            }, (err, row) => {
                return err
                    ? callback(err, null)
                    : callback(null, row);
            });
        },

        put: (req, res, callback) => {
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
                        ? callback(err, null)
                        : callback(null, row);
                });
        },

        delete: (req, res, callback) => {
            app.config.connection.execute('SP_DeletaPublicacao', {
                Id: req.params.Id
            },
                (err, row) => {
                    return err
                        ? callback(err, null)
                        : callback(null, row);
                });
        }

    };

    return repository;
};