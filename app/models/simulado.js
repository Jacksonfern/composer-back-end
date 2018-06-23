function simulados(connection){
    this._connection = connection;
}

simulados.prototype.countVersoes = function(id_questionario, callback){
    this._connection.query("SELECT count(*) from versao_questionario "
         + "WHERE OA_questionario_id_questionario = '" + id_questionario + "'", callback);
}

simulados.prototype.getLastIDSimulado = function(callback){
    this._connection.query("SELECT MAX(simulado_id_simulado) as id_simulado "
    + "FROM simulado_has_oa_questionario", callback);
}

simulados.prototype.getLastID = function(callback){
    this._connection.query("SELECT MAX(id_versao_simulado) as id_versao_simulado from versao_simulado", callback);
}

simulados.prototype.addQuestionario = function(params, callback){
    this._connection.query("INSERT INTO simulado_has_oa_questionario SET ?", params, callback);
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