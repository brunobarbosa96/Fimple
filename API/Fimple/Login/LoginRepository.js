module.exports = (app) => {
    var usuario = app.models.usuario;
    var repository = {
        post: (req, res, callback) => {
            usuario.findOne({
                Senha: req.body.Senha,
                or: [
                    { Email: req.body.Email },
                    { Rgm: +req.body.Email ? +req.body.Email : "" }
                ]
            }).exec((err, row) => {
                return callback(err, row);
            });
        }
    };

    return repository;
};