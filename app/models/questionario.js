function questionario(connection){
    this._connection = connection;
}

questionario.prototype.questions = function(id_questionario, callback){
    this._connection.query("SELECT OA_questoes_id_questao as id FROM oa_questionario_has_oa_questoes "
    + "WHERE OA_questionario_id_questionario = '"+id_questionario+"'", callback);
}

questionario.prototype.addVersao = function(params, callback){
    this._connection.query("INSERT INTO versao_questionario SET ?", params,
        callback);
}

questionario.prototype.getLastID = function(callback){
    this._connection.query("SELECT MAX(id_versao_questionario) AS id "
    + "FROM versao_questionario", callback);
}

module.exports = questionario;