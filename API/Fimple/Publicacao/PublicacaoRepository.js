module.exports = (app) => {

    var publicacao = app.models.publicacao;
    var comentario = app.models.comentario;
    var repository = {

        get: (req, res, callback) => {
            try {
                publicacao.find({
                    select: ["Id", "Conteudo", "Data", "updatedAt", "Usuario"]
                })
                    .sort("updatedAt DESC")
                    .paginate({ page: req.query.Pagina, limit: 30 })
                    .populate("Usuario", { select: ["Id", "Nome", "Sobrenome"] })
                    .exec((err, row) => {
                        comentario.find({ select: ["Id", "Conteudo", "Publicacao", "updatedAt", "Usuario"] })
                            .populate("Usuario", { select: ["Id", "Nome", "Sobrenome"] })
                            .exec((erro, rows) => {
                                if (erro)
                                    return callback(erro);

                                for (var i in row)
                                    row[i].Comentarios =
                                        rows.filter((x) => x.Publicacao == row[i].Id)
                                        .map((x) => {
                                            return {
                                                Id: x.Id,
                                                Conteudo: x.Conteudo,
                                                updatedAt: x.updatedAt,
                                                Usuario: {
                                                    Id: x.Usuario.Id,
                                                    Nome: x.Usuario.Nome
                                                }
                                            }
                                        });

                                return callback(err, row);
                            });
                    });
            } catch (e) {
                return callback(e);
            }
        },

        post: (req, res, callback) => {
            try {
                publicacao.create({
                    Titulo: req.body.Titulo,
                    Conteudo: req.body.Conteudo,
                    Data: new Date(),
                    Usuario: req.body.Usuario.Id,
                    Entidade: req.body.Entidade.Id,
                    Categoria: req.body.Categoria.Id,
                    Curso: req.body.Curso.Id
                }).exec((err, row) => {
                    return callback(err, row);
                });
            } catch (e) {
                return callback(e);
            }

        },

        put: (req, res, callback) => {
            try {
                publicacao.update({ Id: req.body.Id }, {
                    Titulo: req.body.Titulo,
                    Conteudo: req.body.Conteudo,
                    Data: new Date(),
                    Usuario: req.body.Usuario.Id,
                    Entidade: req.body.Entidade.Id,
                    Categoria: req.body.Categoria.Id,
                    Curso: req.body.Curso.Id
                }).exec((err, row) => {
                    return callback(err, row);
                });
            } catch (e) {
                return callback(e);
            }
        },

        delete: (req, res, callback) => {
            try {
                publicacao.destroy({ Id: req.params.Id })
                    .exec((err, row) => {
                        return callback(err, row);
                    });
            } catch (e) {
                return callback(e);
            }

        }

    };

    return repository;
};