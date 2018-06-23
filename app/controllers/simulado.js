var connection = require('../../config/connection');
var simuladoModel = require('../models/simulado');
var conn = connection();
var simulado = new simuladoModel(conn);

module.exports.createSimulado = function(req, res){ //Adiciona questionarios a um simulado
    var id_simulado = req.id_simulado; //id para vincular questionarios
    req.id.forEach(element => {
        let quest = {
            simulado_id_simulado : id_simulado,
            OA_questionario_id_questionario : element
        }
        simulado.addQuestionario(quest, function(error, response){
            if(error){
                res.send("Erro");
                return;
            }
        });
    });
}

module.exports.gerarVersoesSimulados = function(req, res){ //Gera versões de simulados
    var id_simulado = req.id_simulado;
    var id_coordenador = req.id_coordenador;

    simulado.getIDQuestionarios(id_simulado, function(err, result){ //Pega os ids dos questionarios vinculados ao simulado
        if(err){
            res.send("Erro");
            return;
        }

        simulado.getLastID(function(err, last_id){
            if(err){
                console.log(err);
                res.send("Erro");
                return;
            }

            var id = last_id[0].id_versao_simulado;
            if(id == null)
                id = 0;
            
            var insert = setVersoesSimulados(id, id_simulado, result, 0);
            console.log(insert);
            /**
             * Função recursiva para vincular as versões de questionários às versões de simulados
             * OBS: Não consegui fazer sem recursão porque tinha problemas 
             *      com callbacks e inserção no banco
             * Apesar de inserir no banco certinho, ele mostra um erro
             */
        });
    });
}

function setVersoesSimulados(id, id_simulado, questionarios, index){
    if(index == questionarios.length)
        return null;
    
    simulado.getVersoesQuestionarios(questionarios[index].id_questionario, function(err, result){
        if(err){
            console.log(err);
            return;
        }

        for(i = 0; i < result.length; i++){
            id++;
            let versao = {
                id_versao_simulado : id,
                versao_simulado : i + 1,
                simulado_id_simulado : id_simulado,
                versao_questionario_id_versao_questionario : result[i].id_versao_questionario
            }

            simulado.gerarVersaoSimulado(versao, function(err, res){
                if(err){
                    console.log(err);
                    return err;
                }
                return setVersoesSimulados(id, id_simulado, questionarios, index + 1);
            });
        }
    });
}