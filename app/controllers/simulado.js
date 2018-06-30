var connection = require('../../config/connection');
var simuladoModel = require('../models/simulado');
var questionarioModel = require('../models/questionario');

var conn = connection();
var questionario = new questionarioModel(conn);
var simulado = new simuladoModel(conn);

module.exports.criarSimulado = function(req, res){ //Não sei se precisa, mas essa é a função para criar Simulado
    var id_coordenador = req.id_coordenador;
    var descricao = req.descricao;

    simulado.getLastSimulado(function(err, id){
        if(err){
            res.status(400).send(err);
            return;
        }
        var id_simulado = id[0].id;
        if(id_simulado == null)
            id_simulado = 1;
        
        let sim = {
            id_simulado : id_simulado + 1,
            descricao_simulado : descricao,
            id_coordenador : id_coordenador
        }

        simulado.createSimulado(sim, (err, result) => {
            if(err){
                res.status(400).send(err);
                return;
            }
            res.status(200).send('OK');
        });
    });
}

module.exports.addQuestionarios = function(req, res){ //Adiciona questionarios a um simulado
    var id_simulado = req.id_simulado; //id para vincular questionarios
    var id_questionarios = req.id;
    var questionarios = []; //Lista com todos os ids_questionarios para vincular ao simulado

    id_questionarios.forEach(id_questionario => {
        let quest = {
            simulado_id_simulado : id_simulado,
            OA_questionario_id_questionario : id_questionario
        }
        questionarios.push(quest);
    });

    vinculaQuestionarios(questionarios, function(resp){ //Vincula questionários ao simulado
        if(resp == "OK"){
            res.status(200).send('OK');
            return;
        }
        else{
            res.status(400).send(resp);
            return;
        }
    });
}

async function vinculaQuestionarios(questionarios, callback){
    for(i = 0; i < questionarios.length; i++){
        let resp = await new Promise((resolve, reject) => {
            simulado.addQuestionario(questionarios[i], function(error, result){
                if(error){
                    resolve(error);
                }
                else
                    resolve("OK");
            });
        });
        if(resp != "OK"){
            callback(resp);
            return;
        }
    }
    callback("OK");
}

/*--------------------------------------------------------------------------------*/

module.exports.gerarVersoesSimulados = function(req, res){ //Gera versões de simulados
    var id_simulado = req.id_simulado;

    versoesQuestionarios(id_simulado, function(response){
        if(response == "OK"){
            res.status(200).send('OK');
            return;
        }
        else{
            res.status(400).send(response);
            return;
        }
    });
}

async function getNumeroVersoes(questionarios){ //Número de versões de cada questionário do simulado
    var maior = 1; //Se os questionários não tiverem nenhuma versão, ele vai criar somente uma para cada
    var tams = [];
    for(i = 0; i < questionarios.length; i++){
        let num = await new Promise((resolve, reject) => {
            simulado.countVersoes(questionarios[i].id_questionario, function(error, num){
                if(error){
                    reject(error);
                }
                resolve(num);
            });
        });
        tams.push(num[0].quantidade);
        if(num[0].quantidade > maior)
            maior = num[0].quantidade;
    }
    let resp = await gerarVersoesQuestionarios(questionarios, tams, maior);
    return "OK";
}

async function gerarVersoesQuestionarios(questionarios, tams, maior){ //Gera o resto das versões dos questionários
    let lastID = await new Promise((resolve, reject) => {
        questionario.getLastID(function(err, id){
            if(err){
                reject(err);
            }
            resolve(id);
        });
    });

    var id = lastID[0].id;
    if(id == null)
        id = 0;
    for(i = 0; i < questionarios.length; i++){
        let questoes = await new Promise((resolve, reject) => {
            questionario.questions(questionarios[i].id_questionario, (err, questoes) => {
                if(err){
                    reject("Erro: " + err);
                }
                resolve(questoes);
            });
        });

        for(j = tams[i]; j < maior; j++){
            var ordem = geraVersao(questoes, j);
            id++;
            let versaoQuestionario = {
                id_versao_questionario: id,
                OA_questionario_id_questionario: questionarios[i].id_questionario,
                ordem: ordem
            }

            let add = await new Promise((resolve, reject) => {
                questionario.addVersao(versaoQuestionario, function (err, result) {
                    if (err) {
                        reject(err);
                        return;
                    }
                    else{
                        resolve("OK");
                    }
                });
            });
            if(add != "OK"){
                console.log(add);
                return add;
            }
        }
    }
}

function geraVersao(id_questoes, seed){
    var ordem = ""; //String para armazenar a ordem
    var aux = id_questoes.slice(); //Copio o vetor
    var index = 0;

    //Algoritmo para gerar versões
    while (aux.length > 1) {
        index = (index + seed) % aux.length;
        ordem += aux.splice(index, 1)[0].id + ",";
    }
    ordem += aux[0].id;
    return ordem;
}

async function versoesQuestionarios(id_simulado, callback){
    let id_questionarios = await new Promise((resolve, reject) => {
        simulado.getIDQuestionarios(id_simulado, function(err, result){
            if(err){
                callback(err);
                reject(err);
            }
            resolve(result);
        });
    });

    let resp = await getNumeroVersoes(id_questionarios);
    if(resp != "OK"){
        callback(resp);
        return;
    }

    let id_versao_simulado = await new Promise((resolve, reject) => {
        simulado.getLastID(function(error, id){
            if(error){
                callback(error);
                reject(error);
            }
            resolve(id);
        });
    });
    
    var id = id_versao_simulado[0].id_versao_simulado;
    if(id == null)
        id = 0;

    for(i = 0; i < id_questionarios.length; i++){
        let versoes = await new Promise((resolve, reject) => {
            simulado.getVersoesQuestionarios(id_questionarios[i].id_questionario, function(error, versoes){
                if(error){
                    reject(error);
                    callback(error);
                }
                resolve(versoes);
            });
        });

        for(j = 0; j < versoes.length; j++){
            id++;
            let resp = await new Promise((resolve, reject) => {
                let versao = {
                    id_versao_simulado : id,
                    versao_simulado : j + 1,
                    simulado_id_simulado : id_simulado,
                    versao_questionario_id_versao_questionario : versoes[j].id_versao_questionario
                }
                simulado.gerarVersaoSimulado(versao, function(error, resp){
                    if(error){
                        callback(error);
                        reject(error);
                    }
                    resolve("OK");
                });
            });
        }
    }
    callback("OK");
}