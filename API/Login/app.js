var express = require('express'),
    bodyParser = require('body-parser'),
    load = require('express-load'),
    ports = require('../config/ports');

app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended:true}));

load('../config').then('controllers').then('routes').into(app);

app.listen(ports.login, () => {
   console.log("Server up on port " + ports.login); 
});