module.exports = (app) => {
    var fimple = app.model;
    var repository = {

        getAll: (req, res, callback) => {

            fimple.Entidade.findAll().then((objs) => {
                return callback(null, objs);
            }).catch((err) => {
                return callback(err, null);
            });
        }

    };

    return repository;
};