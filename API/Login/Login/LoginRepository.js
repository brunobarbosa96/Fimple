module.exports = (app) => {

    var repository = {
        postLogin: (req, res, callback) => {
            app.config.connection.execute('SP_Login', req.body, (err, row) => {
                if (err)
                    return callback(err, null);
                else
                    return callback(null, row);
            });
        }
    };

    return repository;
};