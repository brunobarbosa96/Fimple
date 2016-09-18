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

        get: (req, res, callback) => {

            app.config.connection.execute('', {
                Id: req.params.Id
            }, (err, row) => {
                return err
                    ? callback(err, null)
                    : callback(null, row);
            });
        },

        post: (req, res, callback) => {
            app.config.connection.execute('', {
                IdCurso: req.body.IdCurso,
                Senha: req.body.Senha,
                Rgm: req.body.Rgm,
                Nome: req.body.Nome,
                Sobrenome: req.body.Sobrenome,
                Apelido: req.body.Apelido,
                Email: req.body.Email,
                DataNascimento: req.body.DataNascimento,
                Cep: req.body.Cep,
                DataInicioCurso: req.body.DataInicioCurso
            }, (err, row) => {
                return err
                    ? callback(err, null)
                    : callback(null, row);
            });
        }
    };

    return repository;
};