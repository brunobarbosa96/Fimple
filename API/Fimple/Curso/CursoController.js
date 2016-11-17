module.exports = (app) => {

    var repository = require('./CursoRepository')(app);
    var controller = {

        getAll: (req, res) => {

            repository.getAll(req, res, (err, row) => {
                if (err)
                    res.status(500).json("Erro ao buscar cursos");
                if (!row)
                    res.status(204).json("Nenhum registro encontrado");
                else
                    res.status(200).json(row);
            });
        }

    };

    return controller;
};