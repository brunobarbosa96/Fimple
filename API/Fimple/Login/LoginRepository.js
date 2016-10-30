module.exports = (app) => {
    var usuario = app.models.usuario;
    var repository = {
        post: (req, res, callback) => {
            try {
                usuario.findOne({
                    Senha: req.body.Senha,
                    or: [
                        { Rgm: +req.body.Email || "" },
                        { Email: req.body.Email }
                    ]
                }).populate("Curso")
                    .exec((err, row) => {
                        if(row) delete row.Curso.Categoria;
                        return callback(err, row);
                    });
            } catch (ex) {
                return callback(ex);
            }
        }
    };

    return repository;
};