var db = function localConnect(){
    return require('mysql').createConnection({
        hostname: 'localhost',
        user: 'root',
        password: 'root',
        database: 'ppr'
    });
    connection.connect();
}
/*var pg = require("pg");
var db = function localConnect() {
    var conString = "pg://postgres:postgres@localhost:5432/ppr";
    var connection = new pg.Client(conString);
    connection.connect();
    return connection;
}*/
module.exports.localConnect = db;