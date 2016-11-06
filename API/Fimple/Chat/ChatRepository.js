module.exports = (app) => {

    var mensagem = app.models.mensagem;
    var repository = {

        get: (req, res, callback) => {
            mensagem.find({
                or: [
                    { UsuarioEnvio: req.params.Id },
                    { UsuarioDestino: req.params.Id }
                ]
            }/*, { select: ['Id', 'Data', 'Visualizada' ] }*/).exec((err, row) => {
                console.log(row);
                return callback(err, row);
            });
        },

        post: (req, res, callback) => {
            mensagem.create({
                Data: req.body.Data,
                Visualizada: false,
                Remetente: req.body.Remetente.Id,
                Destino: req.body.Destino.Id,
                IdCategoria: req.body.IdCategoria,
                IdCurso: req.body.IdCurso
            }).exec((err, row) => {
                delete row.Mensagem;
                return callback(err, row);
            });
        },

        delete: (req, res, callback) => {
            mensagem.update({ Id: req.params.Id }, {
                Ativa: 0
            }).exec((err, row) => {
                return callback(err, row);
            });
        }

    };

    return repository;
};