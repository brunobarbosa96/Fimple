module.exports = (app) => {

    var repository = require('./UsuarioRepository')(app);
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
            console.log(req.body);
            repository.post(req, res, (err, row) => {
                if (err)
                    res.status(500).json({ "message:": "Erro ao inserir usuário", "erro:": err });
                else
                    res.status(200).json(row[0]);
            });
        },

        put: (req, res) => {
            repository.put(req, res, (err, row) => {
                if (err)
                    res.status(500).json({ "message:": "Erro ao atualizar usuário", "erro:": err });
                else
                    res.status(200).json(row[0]);
            });
        }

    };

    return controller;
};