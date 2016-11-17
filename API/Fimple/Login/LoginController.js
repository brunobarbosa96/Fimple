module.exports = (app) => {

    var repository = require('./LoginRepository')(app);
    var controller = {
        post: (req, res) => {
            repository.post(req, res, (err, row) => {
                if (err)
                    res.status(500).json("Erro ao tentar efetuar login");
                if (!row)
                    res.status(401).json("Não autorizado: Login e/ou senha inválido(s).");
                else
                    res.status(200).json(row);
            });
        }
    };

    return controller;
};