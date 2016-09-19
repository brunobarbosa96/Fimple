module.exports = (app) => {

    var repository = require('./UsuarioBloqueadoRepository')(app);
    var controller = {

        getAll: (req, res) => {

            repository.getAll(req, res, (err, row) => {
                if (!row[0].length)
                    res.status(204).json({ "message": "Nenhum registro encontrado." });
                if (err)
                    res.status(500).json({ "message": err });
                else
                    res.status(200).json(row[0]);
            });
        },

        post: (req, res) => {
            repository.post(req, res, (err, row) => {
                if (err)
                    res.status(500).json({ "message:": "Erro ao inserir usuário" });
                else
                    res.status(200).json(row[0]);
            });
        },

        delete: (req, res) => {
            repository.delete(req, res, (err, row) => {
                if (err)
                    res.status(500).json({ "message:": "Erro ao deletar usuário" });
                else
                    res.status(200).json(row[0]);
            });
        }

    };

    return controller;
};