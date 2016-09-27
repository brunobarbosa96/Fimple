module.exports = (app) => {

    var repository = {
        post: (req, res, callback) => {
            app.config.connection.execute('SP_Login', {
                Email: req.body.Email,
                Senha: req.body.Senha
            }, (err, row) => {
                if (err)
                    return callback(err, null);
                else
                    return callback(null, row[0]);
            });
        }
    };

    return repository;
};