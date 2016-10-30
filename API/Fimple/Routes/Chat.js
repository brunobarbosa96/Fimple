module.exports = (app) => {
   
    var controller = require('../Chat/ConversaController')(app);
    app.get('/api/chat/conversa/:Id', controller.get);

};