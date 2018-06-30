var mysql = require('mysql');

var conn = function(){
    return mysql.createConnection({
        host : 'localhost',
        user : 'root',
        password : '@admin123',
        database : 'dbcompose'
    });
}

module.exports = conn;