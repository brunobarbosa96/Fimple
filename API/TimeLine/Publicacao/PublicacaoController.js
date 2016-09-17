module.exports = (app) => {

    var repository = require('./PublicacaoRepository')(app);
    var controller = {

        get: (req, res) => {

            repository.get(req, res, (err, row) => {
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
                    res.status(500).json({ "message:": "Erro ao inserir publicação" });
                else
                    res.status(200).json(row[0]);
            });
        },

        put: (req, res) => {
            repository.put(req, res, (err, row) => {
                if (err)
                    res.status(500).json({ "message:": "Erro ao atualizar publicação" });
                else
                    res.status(200).json(row[0]);
            });
        },

        delete: (req, res) => {
            repository.delete(req, res, (err, row) => {
                if (err)
                    res.status(500).json({ "message:": "Erro ao excluir publicação" });
                else
                    res.status(200).json(row[0]);
            });
        }
    };

    return controller;
};