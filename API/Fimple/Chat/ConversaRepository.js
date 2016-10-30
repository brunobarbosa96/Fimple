module.exports = (app) => {

    var conversa = app.models.conversa;
    var repository = {

        get: (req, res, callback) => {
            conversa.find({
                or: [
                    { Remetente: req.params.Id },
                    { Destino: req.params.Id }
                ]
            }/*, { select: ['Id', 'Data', 'Visualizada' ] }*/).exec((err, row) => {
                return callback(err, row);
            });
        },

        post: (req, res, callback) => {
            conversa.create({
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
            conversa.update({ Id: req.params.Id }, {
                Ativa: 0
            }).exec((err, row) => {
                return callback(err, row);
            });
        }

    };

    return repository;
};