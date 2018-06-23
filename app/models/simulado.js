function simulados(connection){
    this._connection = connection;
}

simulados.getLastID = function(callback){
    this._connection.query("SELECT MAX(id_versao_simulado) FROM versao_simulado", callback);
}

simulados.prototype.getIDQuestionarios = function(id_simulado, callback){
    this._connection.query("SELECT OA_questionario_id_questionario as id_questionario "
        + "FROM simulado_has_oa_questionario "
        + "WHERE simulado_id_simulado = '" + id_simulado + "'", callback);
}

simulados.prototype.getVersoesQuestionarios = function(id, callback){
    this._connection.query("SELECT id_versao_questionario FROM versao_questionario WHERE "
    + "OA_questionario_id_questionario = '" + id + "'", callback);
}

simulados.prototype.gerarVersaoSimulado = function(params, callback){
    this._connection.query("INSERT INTO versao_simulado SET ?", params, callback);
}

module.exports = simulados;