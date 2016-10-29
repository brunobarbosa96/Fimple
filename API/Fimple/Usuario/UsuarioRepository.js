module.exports = (app) => {

    var usuario = app.models.usuario;
    var repository = {

        getAll: (req, res, callback) => {
            usuario.find()
                .exec((err, row) => {
                    return callback(err, row);
                });
        },

        get: (req, res, callback) => {
            usuario.findOne({ Id: req.params.Id })
                .populate("Curso")
                .exec((err, row) => {
                return callback(err, row);
            });
        },

        post: (req, res, callback) => {
            usuario.create({
                Senha: req.body.Senha,
                Rgm: req.body.Rgm,
                Nome: req.body.Nome,
                Sobrenome: req.body.Sobrenome,
                Apelido: req.body.Apelido,
                Email: req.body.Email,
                DataNascimento: req.body.DataNascimento,
                Cep: req.body.Cep,
                DataInicioCurso: req.body.DataInicioCurso,
                DataUltimoAcesso: new Date(),
                Curso: req.body.Curso.Id
            }).exec((err, row) => {
                return callback(err, row);
            });
        },

        put: (req, res, callback) => {
            usuario.update({ Id: req.body.Id }, {
                Senha: req.body.Senha,
                Rgm: req.body.Rgm,
                Nome: req.body.Nome,
                Sobrenome: req.body.Sobrenome,
                Apelido: req.body.Apelido,
                Email: req.body.Email,
                DataNascimento: req.body.DataNascimento,
                Cep: req.body.Cep,
                DataInicioCurso: req.body.DataInicioCurso,
                DataUltimoAcesso: new Date(),
                Curso: req.body.Curso.Id
            }).exec((err, row) => {
                return callback(err, row);
            });
        }

    };

    return repository;
};