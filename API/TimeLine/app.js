var express = require('express'),
    bodyParser = require('body-parser'),
    load = require('express-load'),
    connection = require('../config/connection.js')();

app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.config = {
    connection: connection
};

load('Routes').into(app);

app.listen(5001, () => {
    console.log("Server up on port 5001");
});