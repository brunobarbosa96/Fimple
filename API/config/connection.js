var sql = require('../Login/node_modules/mssql'),
    config = require('./sqlConfiguration');
   
module.exports = () => {

    var connection = {};

    connection.connect = (callback) => {
        sql.connect(config).then(() => {
            callback(null);
        }).catch((err) => {
            callback(err);
        });
    };

    connection.execute = (procedure, parameters, callback) => {
        connection.connect((err) => {
            if(err)
                callback(err, null);
            else {
                var request = new sql.Request();
                for (var key in parameters)
                    request.input(key, parameters[key])
                request.execute(procedure).then((resultset) => {
                    callback(null, resultset);
                }).catch((err) => {
                    callback(err, null);
                });        
            }
        });
    };

    return connection;
};