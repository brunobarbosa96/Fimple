module.exports = (app) => {
   
    var controller = require('../Chat/ChatController')(app);
    app.get('/api/chat/:Id', controller.get);

};