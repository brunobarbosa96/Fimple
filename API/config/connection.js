var sql = require('mssql'),
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

    connection.execute = (procedure, param1, param2) => {
        connection.connect((err) => {
            if(err)
                param2 ? param2(err, null) : param1(err, null);
            else {
                var request = new sql.Request();
                if (param2)
                    for (var key in param1)
                        request.input(key, param1[key]);
                request.execute(procedure).then((resultset) => {
                    param2 ? param2(null, resultset) : param1(null, resultset);
                }).catch((error) => {
                    param2 ? param2(error, null) : param1(error, null);
                });        
            }
        });
    };

    return connection;
};