var express = require('express'),
    bodyParser = require('body-parser'),
    load = require('express-load'),
    connection = require('../config/connection.js')(),
    port = require('../config/ports.js');

app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended:true}));

app.config = {
    connection: connection
};

load('Routes').into(app);

app.listen(port.login, () => {
   console.log("Server up on port " + port.login); 
});