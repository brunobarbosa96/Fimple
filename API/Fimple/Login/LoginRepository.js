module.exports = (app) => {
    var usuario = app.models.usuario;
    var repository = {
        post: (req, res, callback) => {
            try {
                usuario.findOne({
                    Senha: req.body.Senha,
                    or: [
                        { Email: req.body.Email },
                        { Rgm: +req.body.Email ? +req.body.Email : "" }
                    ]
                }).populate("Curso")
                    .exec((err, row) => {
                        return callback(err, row);
                    });
            } catch (ex) {
                return callback(ex);
            }
        }
    };

    return repository;
};