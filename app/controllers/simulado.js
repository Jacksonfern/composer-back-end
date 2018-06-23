var connection = require('../../config/connection');
var simuladoModel = require('../models/simulado');
var conn = connection();
var simulado = new simuladoModel(conn);

module.exports.getQuestionarios = function(req, res){
    var id_simulado = req.id_simulado;
    var id_coordenador = req.id_coordenador;

    simulado.getIDQuestionarios(id_simulado, function(err, result){
        if(err){
            res.send("Erro");
            return;
        }

        versoesQuestionarios = [];
        getVersoesQuestionarios(versoesQuestionarios, result);
    });
}

function gerarVersoesSimulados(versoesQuestionarios){
    simulado.getLastID(function(err, res){
        if(err){
            return;
        }
        
        id_versao_simulado = res[0].id_versao_simulado;
        for(i = 0; i < tam; i++){
            id_versao_simulado++;
            for(j = 0; j < versoesQuestionarios.length; j++){
                let versao = {
                    id_versao_simulado : id_versao_simulado,
                    id_versao_questionario : versoesQuestionarios[j].id_versoes[i].id_questionario
                }
            }
        }
    });
}

function getVersoesQuestionarios(versoesQuestionarios, result){
    for(i = 0; i < result.length; i++){
        simulado.getVersoesQuestionarios(result[i].id_questionario, function(err, res){
            if(err){
                return [];
            }
        });
    }
}