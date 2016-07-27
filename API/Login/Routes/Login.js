module.exports = (app) => {
   
    var controller = require('../Login/LoginController')(app);
    app.post('/api/login', controller.postLogin);

};