module.exports = (app) => {

    var repository = require('./UsuarioRepository')(app);
    var controller = {

        getAll: (req, res) => {
            repository.getAll(req, res, (err, row) => {
                if (err)
                    res.status(500).json("Erro ao buscar usuários");
                if (!row)
                    res.status(204).json("Nenhum registro encontrado.");
                else
                    res.status(200).json(row);
            });
        },

        get: (req, res) => {

            repository.get(req, res, (err, row) => {
                if (err)
                    res.status(500).json("Erro ao buscar usuário");
                if (!row)
                    res.status(204).json("Nenhum registro encontrado.");
                else
                    res.status(200).json(row);
            });
        },

        post: (req, res) => {

            repository.post(req, res, (err, row) => {
                if (err)
                    res.status(500).json("Erro ao inserir usuário");
                else
                    res.status(200).json(row);
            });
        },

        put: (req, res) => {
            repository.put(req, res, (err, row) => {
                if (err)
                    res.status(500).json("Erro ao atualizar usuário");
                else
                    res.status(200).json(row);
            });
        }

    };

    return controller;
};