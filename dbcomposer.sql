-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 23, 2018 at 12:54 PM
-- Server version: 5.7.22-0ubuntu0.17.10.1
-- PHP Version: 7.1.17-0ubuntu0.17.10.1

CREATE DATABASE dbcomposer;
USE dbcomposer;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbcomposer`
--

-- --------------------------------------------------------

--
-- Table structure for table `aluno`
--

CREATE TABLE `aluno` (
  `id_aluno` int(10) UNSIGNED NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `id_dados_pessoais` int(10) UNSIGNED NOT NULL,
  `nome_responsavel` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aluno_has_versao_questionario`
--

CREATE TABLE `aluno_has_versao_questionario` (
  `aluno_id_aluno` int(10) UNSIGNED NOT NULL,
  `versao_questionario_id_versao_questionario` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aluno_turma`
--

CREATE TABLE `aluno_turma` (
  `aluno_id_aluno` int(10) UNSIGNED NOT NULL,
  `turma_id_turma` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `area`
--

CREATE TABLE `area` (
  `id_area` int(11) NOT NULL,
  `nome_area` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `area`
--

INSERT INTO `area` (`id_area`, `nome_area`) VALUES
(1, 'CIENCIAS DA NATUREZA');

-- --------------------------------------------------------

--
-- Table structure for table `aula`
--

CREATE TABLE `aula` (
  `id_aula` int(10) UNSIGNED NOT NULL,
  `descricao_aula` varchar(45) DEFAULT NULL,
  `id_disciplina` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aula`
--

INSERT INTO `aula` (`id_aula`, `descricao_aula`, `id_disciplina`) VALUES
(0, 'SIMULADO', 1),
(1, 'INTRODUCAO A OPTICA', 2),
(2, 'CADEIAS CARBONICAS', 1),
(3, 'CLASSIFICACAO CARBONICA', 1),
(4, 'SIMULADO 2', 1);

-- --------------------------------------------------------

--
-- Table structure for table `aula_has_oa_questionario`
--

CREATE TABLE `aula_has_oa_questionario` (
  `aula_id_aula` int(10) UNSIGNED NOT NULL,
  `OA_questionario_id_questionario` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aula_has_oa_questionario`
--

INSERT INTO `aula_has_oa_questionario` (`aula_id_aula`, `OA_questionario_id_questionario`) VALUES
(1, 1),
(2, 3),
(2, 4),
(3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `aula_has_objetos_aprendizagem`
--

CREATE TABLE `aula_has_objetos_aprendizagem` (
  `aula_id_aula` int(10) UNSIGNED NOT NULL,
  `Objetos_Aprendizagem_idObjetos_Aprendizagem` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aula_has_topico`
--

CREATE TABLE `aula_has_topico` (
  `aula_id_aula` int(10) UNSIGNED NOT NULL,
  `topico_id_topico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aula_has_turma`
--

CREATE TABLE `aula_has_turma` (
  `aula_id_aula` int(10) UNSIGNED NOT NULL,
  `turma_id_turma` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aula_has_turma`
--

INSERT INTO `aula_has_turma` (`aula_id_aula`, `turma_id_turma`) VALUES
(1, 1),
(2, 1),
(3, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `bairro`
--

CREATE TABLE `bairro` (
  `id_bairro` int(10) UNSIGNED NOT NULL,
  `nome_bairro` varchar(45) DEFAULT NULL,
  `id_cidade` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bairro`
--

INSERT INTO `bairro` (`id_bairro`, `nome_bairro`, `id_cidade`) VALUES
(1, 'PADRAO', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cidade`
--

CREATE TABLE `cidade` (
  `id_cidade` int(10) UNSIGNED NOT NULL,
  `nome_cidade` varchar(45) DEFAULT NULL,
  `nome_estado` varchar(45) DEFAULT NULL,
  `id_UF` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cidade`
--

INSERT INTO `cidade` (`id_cidade`, `nome_cidade`, `nome_estado`, `id_UF`) VALUES
(1, 'PADRAO', 'PADRAO', 1);

-- --------------------------------------------------------

--
-- Table structure for table `competencias`
--

CREATE TABLE `competencias` (
  `idcompetencias` int(11) NOT NULL,
  `descricao_competencia` varchar(45) DEFAULT NULL,
  `area_id_area` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `coordenador`
--

CREATE TABLE `coordenador` (
  `id_coordenador` int(11) NOT NULL,
  `curso_id_curso` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `coordenador`
--

INSERT INTO `coordenador` (`id_coordenador`, `curso_id_curso`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `curso`
--

CREATE TABLE `curso` (
  `id_curso` int(10) UNSIGNED NOT NULL,
  `nome_curso` varchar(45) DEFAULT NULL,
  `status_curso_id_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `curso`
--

INSERT INTO `curso` (`id_curso`, `nome_curso`, `status_curso_id_status`) VALUES
(1, 'Ensino Médio', 1),
(2, 'ENSINO MEDIO TECNICO EM INFORMATICA', 1);

-- --------------------------------------------------------

--
-- Table structure for table `dados_pessoais`
--

CREATE TABLE `dados_pessoais` (
  `id_dados_pessoais` int(10) UNSIGNED NOT NULL,
  `CPF` varchar(45) DEFAULT NULL,
  `RG` varchar(45) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `idade` varchar(45) DEFAULT NULL,
  `sexo` int(11) DEFAULT NULL,
  `telefone` int(11) DEFAULT NULL,
  `rua_idendereco` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dados_pessoais`
--

INSERT INTO `dados_pessoais` (`id_dados_pessoais`, `CPF`, `RG`, `data_nascimento`, `idade`, `sexo`, `telefone`, `rua_idendereco`) VALUES
(1, '0', '0', '2018-05-24', '0', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `disciplina`
--

CREATE TABLE `disciplina` (
  `id_disciplina` int(10) UNSIGNED NOT NULL,
  `nome_disciplina` varchar(100) NOT NULL,
  `id_area` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `disciplina`
--

INSERT INTO `disciplina` (`id_disciplina`, `nome_disciplina`, `id_area`) VALUES
(1, 'QUIMICA', 1),
(2, 'FISICA 3', 1);

-- --------------------------------------------------------

--
-- Table structure for table `eixocognitivo`
--

CREATE TABLE `eixocognitivo` (
  `ideixocognitivo` int(11) NOT NULL,
  `descricao_eixo` varchar(200) DEFAULT NULL,
  `area_id_area` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `epoca_bimestre`
--

CREATE TABLE `epoca_bimestre` (
  `id_epoca_bimestre` int(11) NOT NULL,
  `nome_epoca` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `epoca_semestre`
--

CREATE TABLE `epoca_semestre` (
  `id_epoca_semestre` int(11) NOT NULL,
  `nome_epoca_semestre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `habilidades`
--

CREATE TABLE `habilidades` (
  `id_habilidades` int(10) UNSIGNED NOT NULL,
  `id_area` int(11) NOT NULL,
  `Descricao_Habilidade` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `keywords`
--

CREATE TABLE `keywords` (
  `idKeywords` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oa_questionario`
--

CREATE TABLE `oa_questionario` (
  `id_questionario` int(10) UNSIGNED NOT NULL,
  `flag_avaliacao` tinyint(1) NOT NULL,
  `disciplina_id_disciplina` int(10) UNSIGNED NOT NULL,
  `descricao_OA` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oa_questionario`
--

INSERT INTO `oa_questionario` (`id_questionario`, `flag_avaliacao`, `disciplina_id_disciplina`, `descricao_OA`) VALUES
(1, 1, 2, 'QUESTIONARIO 1 DE FISICA'),
(3, 1, 1, 'QUESTIONARIO 1 DE QUIMICA ORGANICA'),
(4, 1, 1, 'QUESTIONARIO 2 DE QUIMICA ORGANICA');

-- --------------------------------------------------------

--
-- Table structure for table `oa_questionario_has_oa_questoes`
--

CREATE TABLE `oa_questionario_has_oa_questoes` (
  `OA_questionario_id_questionario` int(10) UNSIGNED NOT NULL,
  `OA_questoes_id_questao` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oa_questionario_has_oa_questoes`
--

INSERT INTO `oa_questionario_has_oa_questoes` (`OA_questionario_id_questionario`, `OA_questoes_id_questao`) VALUES
(1, 1),
(3, 1),
(1, 2),
(3, 2),
(1, 3),
(3, 3),
(1, 4),
(3, 4),
(1, 5),
(3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `oa_questoes`
--

CREATE TABLE `oa_questoes` (
  `id_questao` int(10) UNSIGNED NOT NULL,
  `descricao_OA` varchar(45) DEFAULT NULL,
  `disciplina_id_disciplina` int(10) UNSIGNED NOT NULL,
  `professor_id_professor` int(10) UNSIGNED NOT NULL,
  `enunciado` varchar(500) DEFAULT NULL,
  `desvio_opcaoA` int(11) DEFAULT NULL,
  `desvio_opcaoB` int(11) DEFAULT NULL,
  `desvio_opcaoC` int(11) DEFAULT NULL,
  `desvio_opcaoD` int(11) DEFAULT NULL,
  `desvio_opcaoE` int(11) DEFAULT NULL,
  `NDQ` int(11) DEFAULT NULL,
  `tempo_esperado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oa_questoes`
--

INSERT INTO `oa_questoes` (`id_questao`, `descricao_OA`, `disciplina_id_disciplina`, `professor_id_professor`, `enunciado`, `desvio_opcaoA`, `desvio_opcaoB`, `desvio_opcaoC`, `desvio_opcaoD`, `desvio_opcaoE`, `NDQ`, `tempo_esperado`) VALUES
(1, 'Conhecimento básico', 1, 1, 'Qual a velocidade de um carro que corre 50m em 10s?;a)10m/s;b)50m/s;c)5m/s;d)5km/h;e)10km/h', 1, 2, 3, 0, 1, 1, 15),
(2, 'Habilidade com matemática', 1, 1, 'Quanto é 4*4??;a)8;b)4;c)6;d)16;e)20', 2, 3, 4, 0, 1, 1, 10),
(3, 'Trigonometria', 1, 1, 'Qual o arcoseno de 1/2??', 1, 2, 3, 0, 1, 1, 10),
(4, 'Tabela periodica', 1, 1, 'Qual a massa atomica do carbono??;a)10u.c;b)5u.c;c)12u.c;d)15u.c;e)16u.c', 2, 3, 0, 1, 1, 1, 10),
(5, 'Tabela periodica', 1, 1, 'Qual a massa atomica do carbono??;a)10u.c;b)5u.c;c)12u.c;d)15u.c;e)16u.c', 2, 3, 0, 1, 1, 1, 10);

-- --------------------------------------------------------

--
-- Table structure for table `oa_questoes_has_habilidades`
--

CREATE TABLE `oa_questoes_has_habilidades` (
  `OA_questoes_id_questao` int(10) UNSIGNED NOT NULL,
  `habilidades_id_habilidades` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oa_questoes_has_topico`
--

CREATE TABLE `oa_questoes_has_topico` (
  `OA_questoes_id_questao` int(10) UNSIGNED NOT NULL,
  `topico_id_topico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `objetos_aprendizagem`
--

CREATE TABLE `objetos_aprendizagem` (
  `idObjetos_Aprendizagem` int(11) NOT NULL,
  `URIdoobjeto` varchar(200) DEFAULT NULL,
  `tipo_objeto` varchar(45) DEFAULT NULL,
  `disciplina_id_disciplina` int(10) UNSIGNED NOT NULL,
  `professor_id_professor` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `objetos_aprendizagem_has_habilidades`
--

CREATE TABLE `objetos_aprendizagem_has_habilidades` (
  `Objetos_Aprendizagem_idObjetos_Aprendizagem` int(11) NOT NULL,
  `habilidades_id_habilidades` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `objetos_aprendizagem_has_keywords`
--

CREATE TABLE `objetos_aprendizagem_has_keywords` (
  `Objetos_Aprendizagem_idObjetos_Aprendizagem` int(11) NOT NULL,
  `Keywords_idKeywords` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `objetos_aprendizagem_has_topico`
--

CREATE TABLE `objetos_aprendizagem_has_topico` (
  `Objetos_Aprendizagem_idObjetos_Aprendizagem` int(11) NOT NULL,
  `topico_id_topico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `professor`
--

CREATE TABLE `professor` (
  `id_professor` int(10) UNSIGNED NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `data_admissao` date DEFAULT NULL,
  `salario_base` float DEFAULT NULL,
  `id_dados_pessoais` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `professor`
--

INSERT INTO `professor` (`id_professor`, `nome`, `data_admissao`, `salario_base`, `id_dados_pessoais`) VALUES
(1, 'PADRAO', '2018-05-24', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `professor_has_disciplina`
--

CREATE TABLE `professor_has_disciplina` (
  `professor_id_professor` int(10) UNSIGNED NOT NULL,
  `disciplina_id_disciplina` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `professor_has_turma`
--

CREATE TABLE `professor_has_turma` (
  `professor_id_professor` int(10) UNSIGNED NOT NULL,
  `turma_id_turma` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rua`
--

CREATE TABLE `rua` (
  `idendereco` int(10) UNSIGNED NOT NULL,
  `nome_rua` varchar(45) NOT NULL,
  `numero_casa` int(11) NOT NULL,
  `CEP` varchar(45) NOT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `id_bairro` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rua`
--

INSERT INTO `rua` (`idendereco`, `nome_rua`, `numero_casa`, `CEP`, `complemento`, `id_bairro`) VALUES
(1, 'PADRAO', 0, 'PADRAO', 'PADRAO', 1);

-- --------------------------------------------------------

--
-- Table structure for table `simulado`
--

CREATE TABLE `simulado` (
  `id_simulado` int(11) NOT NULL,
  `descricao_simulado` varchar(45) DEFAULT NULL,
  `id_coordenador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `simulado`
--

INSERT INTO `simulado` (`id_simulado`, `descricao_simulado`, `id_coordenador`) VALUES
(1, 'Programação web', 1);

-- --------------------------------------------------------

--
-- Table structure for table `simulado_has_oa_questionario`
--

CREATE TABLE `simulado_has_oa_questionario` (
  `simulado_id_simulado` int(11) NOT NULL,
  `OA_questionario_id_questionario` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `simulado_has_oa_questionario`
--

INSERT INTO `simulado_has_oa_questionario` (`simulado_id_simulado`, `OA_questionario_id_questionario`) VALUES
(1, 1),
(1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `status_curso`
--

CREATE TABLE `status_curso` (
  `id_status` int(11) NOT NULL,
  `status_cursocol` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `status_curso`
--

INSERT INTO `status_curso` (`id_status`, `status_cursocol`) VALUES
(1, 'OK');

-- --------------------------------------------------------

--
-- Table structure for table `topico`
--

CREATE TABLE `topico` (
  `id_topico` int(11) NOT NULL,
  `nome_topico` varchar(45) NOT NULL,
  `NDT` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `topico`
--

INSERT INTO `topico` (`id_topico`, `nome_topico`, `NDT`) VALUES
(1, 'Gramática', 1),
(2, 'Ortografia', 1),
(3, 'IR', 3),
(4, 'Grama', 1);

-- --------------------------------------------------------

--
-- Table structure for table `turma`
--

CREATE TABLE `turma` (
  `id_turma` int(10) UNSIGNED NOT NULL,
  `turno` varchar(45) DEFAULT NULL,
  `id_curso` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `turma`
--

INSERT INTO `turma` (`id_turma`, `turno`, `id_curso`) VALUES
(1, 'MATUTINO - 3 ANO A', 1),
(2, 'VESPERTINO - 3 ANO B', 1);

-- --------------------------------------------------------

--
-- Table structure for table `turma_has_disciplina`
--

CREATE TABLE `turma_has_disciplina` (
  `turma_id_turma` int(10) UNSIGNED NOT NULL,
  `disciplina_id_disciplina` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `turma_has_disciplina`
--

INSERT INTO `turma_has_disciplina` (`turma_id_turma`, `disciplina_id_disciplina`) VALUES
(1, 1),
(1, 2),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `turma_has_epoca_bimestre`
--

CREATE TABLE `turma_has_epoca_bimestre` (
  `turma_id_turma` int(10) UNSIGNED NOT NULL,
  `epoca_bimestre_id_epoca_bimestre` int(11) NOT NULL,
  `epoca_semestre_id_epoca_semestre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `turma_has_simulado`
--

CREATE TABLE `turma_has_simulado` (
  `turma_id_turma` int(10) UNSIGNED NOT NULL,
  `simulado_id_simulado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `uf`
--

CREATE TABLE `uf` (
  `id_UF` int(10) UNSIGNED NOT NULL,
  `nome_UF` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `uf`
--

INSERT INTO `uf` (`id_UF`, `nome_UF`) VALUES
(1, 'PADRAO');

-- --------------------------------------------------------

--
-- Table structure for table `versao_questionario`
--

CREATE TABLE `versao_questionario` (
  `id_versao_questionario` int(10) UNSIGNED NOT NULL,
  `OA_questionario_id_questionario` int(10) UNSIGNED NOT NULL,
  `ordem` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `versao_questionario`
--

INSERT INTO `versao_questionario` (`id_versao_questionario`, `OA_questionario_id_questionario`, `ordem`) VALUES
(1, 1, '1,2,3,4,5'),
(2, 1, '2,4,1,5,3'),
(3, 1, '3,1,5,2,4'),
(4, 1, '4,3,5,2,1'),
(5, 3, '1,2,3,4,5'),
(6, 3, '2,4,1,5,3'),
(7, 3, '3,1,5,2,4'),
(8, 3, '4,3,5,2,1');

-- --------------------------------------------------------

--
-- Table structure for table `versao_questionario_has_oa_questoes`
--

CREATE TABLE `versao_questionario_has_oa_questoes` (
  `versao_questionario_id_versao_questionario` int(10) UNSIGNED NOT NULL,
  `OA_questoes_id_questao` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `versao_simulado`
--

CREATE TABLE `versao_simulado` (
  `id_versao_simulado` int(11) NOT NULL,
  `versao_simulado` int(11) NOT NULL,
  `simulado_id_simulado` int(11) NOT NULL,
  `versao_questionario_id_versao_questionario` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `versao_simulado`
--

INSERT INTO `versao_simulado` (`id_versao_simulado`, `simulado_id_simulado`, `versao_questionario_id_versao_questionario`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aluno`
--
ALTER TABLE `aluno`
  ADD PRIMARY KEY (`id_aluno`),
  ADD KEY `fk_aluno_dados_pessoais1_idx` (`id_dados_pessoais`);

--
-- Indexes for table `aluno_has_versao_questionario`
--
ALTER TABLE `aluno_has_versao_questionario`
  ADD PRIMARY KEY (`aluno_id_aluno`,`versao_questionario_id_versao_questionario`),
  ADD KEY `fk_aluno_has_versao_questionario_versao_questionario1_idx` (`versao_questionario_id_versao_questionario`),
  ADD KEY `fk_aluno_has_versao_questionario_aluno1_idx` (`aluno_id_aluno`);

--
-- Indexes for table `aluno_turma`
--
ALTER TABLE `aluno_turma`
  ADD PRIMARY KEY (`aluno_id_aluno`,`turma_id_turma`),
  ADD KEY `fk_aluno_has_turma_turma1_idx` (`turma_id_turma`),
  ADD KEY `fk_aluno_has_turma_aluno1_idx` (`aluno_id_aluno`);

--
-- Indexes for table `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`id_area`);

--
-- Indexes for table `aula`
--
ALTER TABLE `aula`
  ADD PRIMARY KEY (`id_aula`),
  ADD KEY `fk_aula_disciplina1_idx` (`id_disciplina`);

--
-- Indexes for table `aula_has_oa_questionario`
--
ALTER TABLE `aula_has_oa_questionario`
  ADD PRIMARY KEY (`aula_id_aula`,`OA_questionario_id_questionario`),
  ADD KEY `fk_aula_has_OA_questionario_OA_questionario1_idx` (`OA_questionario_id_questionario`),
  ADD KEY `fk_aula_has_OA_questionario_aula1_idx` (`aula_id_aula`);

--
-- Indexes for table `aula_has_objetos_aprendizagem`
--
ALTER TABLE `aula_has_objetos_aprendizagem`
  ADD PRIMARY KEY (`aula_id_aula`,`Objetos_Aprendizagem_idObjetos_Aprendizagem`),
  ADD KEY `fk_aula_has_Objetos_Aprendizagem_Objetos_Aprendizagem1_idx` (`Objetos_Aprendizagem_idObjetos_Aprendizagem`),
  ADD KEY `fk_aula_has_Objetos_Aprendizagem_aula1_idx` (`aula_id_aula`);

--
-- Indexes for table `aula_has_topico`
--
ALTER TABLE `aula_has_topico`
  ADD PRIMARY KEY (`aula_id_aula`,`topico_id_topico`),
  ADD KEY `fk_aula_has_topico_topico1_idx` (`topico_id_topico`),
  ADD KEY `fk_aula_has_topico_aula1_idx` (`aula_id_aula`);

--
-- Indexes for table `aula_has_turma`
--
ALTER TABLE `aula_has_turma`
  ADD PRIMARY KEY (`aula_id_aula`,`turma_id_turma`),
  ADD KEY `fk_aula_has_turma_turma1_idx` (`turma_id_turma`),
  ADD KEY `fk_aula_has_turma_aula1_idx` (`aula_id_aula`);

--
-- Indexes for table `bairro`
--
ALTER TABLE `bairro`
  ADD PRIMARY KEY (`id_bairro`),
  ADD KEY `fk_bairro_cidade1_idx` (`id_cidade`);

--
-- Indexes for table `cidade`
--
ALTER TABLE `cidade`
  ADD PRIMARY KEY (`id_cidade`),
  ADD KEY `fk_cidade_UF1_idx` (`id_UF`);

--
-- Indexes for table `competencias`
--
ALTER TABLE `competencias`
  ADD PRIMARY KEY (`idcompetencias`),
  ADD KEY `fk_competencias_area1_idx` (`area_id_area`);

--
-- Indexes for table `coordenador`
--
ALTER TABLE `coordenador`
  ADD PRIMARY KEY (`id_coordenador`),
  ADD KEY `fk_coordenador_curso1_idx` (`curso_id_curso`);

--
-- Indexes for table `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`id_curso`),
  ADD KEY `fk_curso_status_curso1_idx` (`status_curso_id_status`);

--
-- Indexes for table `dados_pessoais`
--
ALTER TABLE `dados_pessoais`
  ADD PRIMARY KEY (`id_dados_pessoais`),
  ADD KEY `fk_dados_pessoais_rua1_idx` (`rua_idendereco`);

--
-- Indexes for table `disciplina`
--
ALTER TABLE `disciplina`
  ADD PRIMARY KEY (`id_disciplina`),
  ADD KEY `fk_disciplina_area1_idx` (`id_area`);

--
-- Indexes for table `eixocognitivo`
--
ALTER TABLE `eixocognitivo`
  ADD PRIMARY KEY (`ideixocognitivo`),
  ADD KEY `fk_eixocognitivo_area1_idx` (`area_id_area`);

--
-- Indexes for table `epoca_bimestre`
--
ALTER TABLE `epoca_bimestre`
  ADD PRIMARY KEY (`id_epoca_bimestre`);

--
-- Indexes for table `epoca_semestre`
--
ALTER TABLE `epoca_semestre`
  ADD PRIMARY KEY (`id_epoca_semestre`);

--
-- Indexes for table `habilidades`
--
ALTER TABLE `habilidades`
  ADD PRIMARY KEY (`id_habilidades`),
  ADD KEY `fk_habilidades_area1_idx` (`id_area`);

--
-- Indexes for table `keywords`
--
ALTER TABLE `keywords`
  ADD PRIMARY KEY (`idKeywords`);

--
-- Indexes for table `oa_questionario`
--
ALTER TABLE `oa_questionario`
  ADD PRIMARY KEY (`id_questionario`),
  ADD KEY `fk_OA_questionario_disciplina1_idx` (`disciplina_id_disciplina`);

--
-- Indexes for table `oa_questionario_has_oa_questoes`
--
ALTER TABLE `oa_questionario_has_oa_questoes`
  ADD PRIMARY KEY (`OA_questionario_id_questionario`,`OA_questoes_id_questao`),
  ADD KEY `fk_OA_questionario_has_OA_questoes_OA_questoes1_idx` (`OA_questoes_id_questao`),
  ADD KEY `fk_OA_questionario_has_OA_questoes_OA_questionario1_idx` (`OA_questionario_id_questionario`);

--
-- Indexes for table `oa_questoes`
--
ALTER TABLE `oa_questoes`
  ADD PRIMARY KEY (`id_questao`),
  ADD KEY `fk_OA_questoes_disciplina1_idx` (`disciplina_id_disciplina`),
  ADD KEY `fk_OA_questoes_professor1_idx` (`professor_id_professor`);

--
-- Indexes for table `oa_questoes_has_habilidades`
--
ALTER TABLE `oa_questoes_has_habilidades`
  ADD PRIMARY KEY (`OA_questoes_id_questao`,`habilidades_id_habilidades`),
  ADD KEY `fk_OA_questoes_has_habilidades_habilidades1_idx` (`habilidades_id_habilidades`),
  ADD KEY `fk_OA_questoes_has_habilidades_OA_questoes1_idx` (`OA_questoes_id_questao`);

--
-- Indexes for table `oa_questoes_has_topico`
--
ALTER TABLE `oa_questoes_has_topico`
  ADD PRIMARY KEY (`OA_questoes_id_questao`,`topico_id_topico`),
  ADD KEY `fk_OA_questoes_has_topico_topico1_idx` (`topico_id_topico`),
  ADD KEY `fk_OA_questoes_has_topico_OA_questoes1_idx` (`OA_questoes_id_questao`);

--
-- Indexes for table `objetos_aprendizagem`
--
ALTER TABLE `objetos_aprendizagem`
  ADD PRIMARY KEY (`idObjetos_Aprendizagem`),
  ADD KEY `fk_Objetos_Aprendizagem_disciplina1_idx` (`disciplina_id_disciplina`),
  ADD KEY `fk_Objetos_Aprendizagem_professor1_idx` (`professor_id_professor`);

--
-- Indexes for table `objetos_aprendizagem_has_habilidades`
--
ALTER TABLE `objetos_aprendizagem_has_habilidades`
  ADD PRIMARY KEY (`Objetos_Aprendizagem_idObjetos_Aprendizagem`,`habilidades_id_habilidades`),
  ADD KEY `fk_Objetos_Aprendizagem_has_habilidades_habilidades1_idx` (`habilidades_id_habilidades`),
  ADD KEY `fk_Objetos_Aprendizagem_has_habilidades_Objetos_Aprendizage_idx` (`Objetos_Aprendizagem_idObjetos_Aprendizagem`);

--
-- Indexes for table `objetos_aprendizagem_has_keywords`
--
ALTER TABLE `objetos_aprendizagem_has_keywords`
  ADD PRIMARY KEY (`Objetos_Aprendizagem_idObjetos_Aprendizagem`,`Keywords_idKeywords`),
  ADD KEY `fk_Objetos_Aprendizagem_has_Keywords_Keywords1_idx` (`Keywords_idKeywords`),
  ADD KEY `fk_Objetos_Aprendizagem_has_Keywords_Objetos_Aprendizagem1_idx` (`Objetos_Aprendizagem_idObjetos_Aprendizagem`);

--
-- Indexes for table `objetos_aprendizagem_has_topico`
--
ALTER TABLE `objetos_aprendizagem_has_topico`
  ADD PRIMARY KEY (`Objetos_Aprendizagem_idObjetos_Aprendizagem`,`topico_id_topico`),
  ADD KEY `fk_Objetos_Aprendizagem_has_topico_topico1_idx` (`topico_id_topico`),
  ADD KEY `fk_Objetos_Aprendizagem_has_topico_Objetos_Aprendizagem1_idx` (`Objetos_Aprendizagem_idObjetos_Aprendizagem`);

--
-- Indexes for table `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`id_professor`),
  ADD KEY `fk_professor_dados_pessoais1_idx` (`id_dados_pessoais`);

--
-- Indexes for table `professor_has_disciplina`
--
ALTER TABLE `professor_has_disciplina`
  ADD PRIMARY KEY (`professor_id_professor`,`disciplina_id_disciplina`),
  ADD KEY `fk_professor_has_disciplina_disciplina1_idx` (`disciplina_id_disciplina`),
  ADD KEY `fk_professor_has_disciplina_professor1_idx` (`professor_id_professor`);

--
-- Indexes for table `professor_has_turma`
--
ALTER TABLE `professor_has_turma`
  ADD PRIMARY KEY (`professor_id_professor`,`turma_id_turma`),
  ADD KEY `fk_professor_has_turma_turma1_idx` (`turma_id_turma`),
  ADD KEY `fk_professor_has_turma_professor1_idx` (`professor_id_professor`);

--
-- Indexes for table `rua`
--
ALTER TABLE `rua`
  ADD PRIMARY KEY (`idendereco`),
  ADD KEY `fk_rua_bairro1_idx` (`id_bairro`);

--
-- Indexes for table `simulado`
--
ALTER TABLE `simulado`
  ADD PRIMARY KEY (`id_simulado`),
  ADD KEY `fk_simulado_coordenador1_idx` (`id_coordenador`);

--
-- Indexes for table `simulado_has_oa_questionario`
--
ALTER TABLE `simulado_has_oa_questionario`
  ADD PRIMARY KEY (`simulado_id_simulado`,`OA_questionario_id_questionario`),
  ADD KEY `fk_simulado_has_OA_questionario_OA_questionario1_idx` (`OA_questionario_id_questionario`),
  ADD KEY `fk_simulado_has_OA_questionario_simulado1_idx` (`simulado_id_simulado`);

--
-- Indexes for table `status_curso`
--
ALTER TABLE `status_curso`
  ADD PRIMARY KEY (`id_status`);

--
-- Indexes for table `topico`
--
ALTER TABLE `topico`
  ADD PRIMARY KEY (`id_topico`);

--
-- Indexes for table `turma`
--
ALTER TABLE `turma`
  ADD PRIMARY KEY (`id_turma`),
  ADD KEY `fk_turma_curso1_idx` (`id_curso`);

--
-- Indexes for table `turma_has_disciplina`
--
ALTER TABLE `turma_has_disciplina`
  ADD PRIMARY KEY (`turma_id_turma`,`disciplina_id_disciplina`),
  ADD KEY `fk_turma_has_disciplina_disciplina1_idx` (`disciplina_id_disciplina`),
  ADD KEY `fk_turma_has_disciplina_turma1_idx` (`turma_id_turma`);

--
-- Indexes for table `turma_has_epoca_bimestre`
--
ALTER TABLE `turma_has_epoca_bimestre`
  ADD PRIMARY KEY (`turma_id_turma`,`epoca_semestre_id_epoca_semestre`),
  ADD KEY `fk_turma_has_epoca_bimestre_epoca_bimestre1_idx` (`epoca_bimestre_id_epoca_bimestre`),
  ADD KEY `fk_turma_has_epoca_bimestre_turma1_idx` (`turma_id_turma`),
  ADD KEY `fk_turma_has_epoca_bimestre_epoca_semestre1_idx` (`epoca_semestre_id_epoca_semestre`);

--
-- Indexes for table `turma_has_simulado`
--
ALTER TABLE `turma_has_simulado`
  ADD PRIMARY KEY (`turma_id_turma`,`simulado_id_simulado`),
  ADD KEY `fk_turma_has_simulado_simulado1_idx` (`simulado_id_simulado`),
  ADD KEY `fk_turma_has_simulado_turma1_idx` (`turma_id_turma`);

--
-- Indexes for table `uf`
--
ALTER TABLE `uf`
  ADD PRIMARY KEY (`id_UF`);

--
-- Indexes for table `versao_questionario`
--
ALTER TABLE `versao_questionario`
  ADD PRIMARY KEY (`id_versao_questionario`),
  ADD KEY `fk_versao_questionario_OA_questionario1_idx` (`OA_questionario_id_questionario`);

--
-- Indexes for table `versao_questionario_has_oa_questoes`
--
ALTER TABLE `versao_questionario_has_oa_questoes`
  ADD PRIMARY KEY (`versao_questionario_id_versao_questionario`,`OA_questoes_id_questao`),
  ADD KEY `fk_versao_questionario_has_OA_questoes_OA_questoes1_idx` (`OA_questoes_id_questao`),
  ADD KEY `fk_versao_questionario_has_OA_questoes_versao_questionario1_idx` (`versao_questionario_id_versao_questionario`);

--
-- Indexes for table `versao_simulado`
--
ALTER TABLE `versao_simulado`
  ADD PRIMARY KEY (`id_versao_simulado`),
  ADD KEY `simulado_id_simulado` (`simulado_id_simulado`),
  ADD KEY `versao_questionario_id_versao_questionario` (`versao_questionario_id_versao_questionario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aluno`
--
ALTER TABLE `aluno`
  MODIFY `id_aluno` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bairro`
--
ALTER TABLE `bairro`
  MODIFY `id_bairro` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cidade`
--
ALTER TABLE `cidade`
  MODIFY `id_cidade` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `curso`
--
ALTER TABLE `curso`
  MODIFY `id_curso` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `dados_pessoais`
--
ALTER TABLE `dados_pessoais`
  MODIFY `id_dados_pessoais` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `disciplina`
--
ALTER TABLE `disciplina`
  MODIFY `id_disciplina` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `habilidades`
--
ALTER TABLE `habilidades`
  MODIFY `id_habilidades` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oa_questionario`
--
ALTER TABLE `oa_questionario`
  MODIFY `id_questionario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `professor`
--
ALTER TABLE `professor`
  MODIFY `id_professor` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `rua`
--
ALTER TABLE `rua`
  MODIFY `idendereco` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `turma`
--
ALTER TABLE `turma`
  MODIFY `id_turma` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `uf`
--
ALTER TABLE `uf`
  MODIFY `id_UF` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `aluno`
--
ALTER TABLE `aluno`
  ADD CONSTRAINT `fk_aluno_dados_pessoais1` FOREIGN KEY (`id_dados_pessoais`) REFERENCES `dados_pessoais` (`id_dados_pessoais`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `aluno_has_versao_questionario`
--
ALTER TABLE `aluno_has_versao_questionario`
  ADD CONSTRAINT `fk_aluno_has_versao_questionario_aluno1` FOREIGN KEY (`aluno_id_aluno`) REFERENCES `aluno` (`id_aluno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_aluno_has_versao_questionario_versao_questionario1` FOREIGN KEY (`versao_questionario_id_versao_questionario`) REFERENCES `versao_questionario` (`id_versao_questionario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `aluno_turma`
--
ALTER TABLE `aluno_turma`
  ADD CONSTRAINT `fk_aluno_has_turma_aluno1` FOREIGN KEY (`aluno_id_aluno`) REFERENCES `aluno` (`id_aluno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_aluno_has_turma_turma1` FOREIGN KEY (`turma_id_turma`) REFERENCES `turma` (`id_turma`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `aula`
--
ALTER TABLE `aula`
  ADD CONSTRAINT `fk_aula_disciplina1` FOREIGN KEY (`id_disciplina`) REFERENCES `disciplina` (`id_disciplina`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `aula_has_oa_questionario`
--
ALTER TABLE `aula_has_oa_questionario`
  ADD CONSTRAINT `fk_aula_has_OA_questionario_OA_questionario1` FOREIGN KEY (`OA_questionario_id_questionario`) REFERENCES `oa_questionario` (`id_questionario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_aula_has_OA_questionario_aula1` FOREIGN KEY (`aula_id_aula`) REFERENCES `aula` (`id_aula`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `aula_has_objetos_aprendizagem`
--
ALTER TABLE `aula_has_objetos_aprendizagem`
  ADD CONSTRAINT `fk_aula_has_Objetos_Aprendizagem_Objetos_Aprendizagem1` FOREIGN KEY (`Objetos_Aprendizagem_idObjetos_Aprendizagem`) REFERENCES `objetos_aprendizagem` (`idObjetos_Aprendizagem`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_aula_has_Objetos_Aprendizagem_aula1` FOREIGN KEY (`aula_id_aula`) REFERENCES `aula` (`id_aula`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `aula_has_topico`
--
ALTER TABLE `aula_has_topico`
  ADD CONSTRAINT `fk_aula_has_topico_aula1` FOREIGN KEY (`aula_id_aula`) REFERENCES `aula` (`id_aula`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_aula_has_topico_topico1` FOREIGN KEY (`topico_id_topico`) REFERENCES `topico` (`id_topico`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `aula_has_turma`
--
ALTER TABLE `aula_has_turma`
  ADD CONSTRAINT `fk_aula_has_turma_aula1` FOREIGN KEY (`aula_id_aula`) REFERENCES `aula` (`id_aula`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_aula_has_turma_turma1` FOREIGN KEY (`turma_id_turma`) REFERENCES `turma` (`id_turma`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `bairro`
--
ALTER TABLE `bairro`
  ADD CONSTRAINT `fk_bairro_cidade1` FOREIGN KEY (`id_cidade`) REFERENCES `cidade` (`id_cidade`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `cidade`
--
ALTER TABLE `cidade`
  ADD CONSTRAINT `fk_cidade_UF1` FOREIGN KEY (`id_UF`) REFERENCES `uf` (`id_UF`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `competencias`
--
ALTER TABLE `competencias`
  ADD CONSTRAINT `fk_competencias_area1` FOREIGN KEY (`area_id_area`) REFERENCES `area` (`id_area`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `coordenador`
--
ALTER TABLE `coordenador`
  ADD CONSTRAINT `fk_coordenador_curso1` FOREIGN KEY (`curso_id_curso`) REFERENCES `curso` (`id_curso`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `curso`
--
ALTER TABLE `curso`
  ADD CONSTRAINT `fk_curso_status_curso1` FOREIGN KEY (`status_curso_id_status`) REFERENCES `status_curso` (`id_status`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `dados_pessoais`
--
ALTER TABLE `dados_pessoais`
  ADD CONSTRAINT `fk_dados_pessoais_rua1` FOREIGN KEY (`rua_idendereco`) REFERENCES `rua` (`idendereco`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `disciplina`
--
ALTER TABLE `disciplina`
  ADD CONSTRAINT `fk_disciplina_area1` FOREIGN KEY (`id_area`) REFERENCES `area` (`id_area`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `eixocognitivo`
--
ALTER TABLE `eixocognitivo`
  ADD CONSTRAINT `fk_eixocognitivo_area1` FOREIGN KEY (`area_id_area`) REFERENCES `area` (`id_area`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `habilidades`
--
ALTER TABLE `habilidades`
  ADD CONSTRAINT `fk_habilidades_area1` FOREIGN KEY (`id_area`) REFERENCES `area` (`id_area`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `oa_questionario`
--
ALTER TABLE `oa_questionario`
  ADD CONSTRAINT `fk_OA_questionario_disciplina1` FOREIGN KEY (`disciplina_id_disciplina`) REFERENCES `disciplina` (`id_disciplina`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `oa_questionario_has_oa_questoes`
--
ALTER TABLE `oa_questionario_has_oa_questoes`
  ADD CONSTRAINT `fk_OA_questionario_has_OA_questoes_OA_questionario1` FOREIGN KEY (`OA_questionario_id_questionario`) REFERENCES `oa_questionario` (`id_questionario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_OA_questionario_has_OA_questoes_OA_questoes1` FOREIGN KEY (`OA_questoes_id_questao`) REFERENCES `oa_questoes` (`id_questao`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `oa_questoes`
--
ALTER TABLE `oa_questoes`
  ADD CONSTRAINT `fk_OA_questoes_disciplina1` FOREIGN KEY (`disciplina_id_disciplina`) REFERENCES `disciplina` (`id_disciplina`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_OA_questoes_professor1` FOREIGN KEY (`professor_id_professor`) REFERENCES `professor` (`id_professor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `oa_questoes_has_habilidades`
--
ALTER TABLE `oa_questoes_has_habilidades`
  ADD CONSTRAINT `fk_OA_questoes_has_habilidades_OA_questoes1` FOREIGN KEY (`OA_questoes_id_questao`) REFERENCES `oa_questoes` (`id_questao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_OA_questoes_has_habilidades_habilidades1` FOREIGN KEY (`habilidades_id_habilidades`) REFERENCES `habilidades` (`id_habilidades`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `oa_questoes_has_topico`
--
ALTER TABLE `oa_questoes_has_topico`
  ADD CONSTRAINT `fk_OA_questoes_has_topico_OA_questoes1` FOREIGN KEY (`OA_questoes_id_questao`) REFERENCES `oa_questoes` (`id_questao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_OA_questoes_has_topico_topico1` FOREIGN KEY (`topico_id_topico`) REFERENCES `topico` (`id_topico`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `objetos_aprendizagem`
--
ALTER TABLE `objetos_aprendizagem`
  ADD CONSTRAINT `fk_Objetos_Aprendizagem_disciplina1` FOREIGN KEY (`disciplina_id_disciplina`) REFERENCES `disciplina` (`id_disciplina`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Objetos_Aprendizagem_professor1` FOREIGN KEY (`professor_id_professor`) REFERENCES `professor` (`id_professor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `objetos_aprendizagem_has_habilidades`
--
ALTER TABLE `objetos_aprendizagem_has_habilidades`
  ADD CONSTRAINT `fk_Objetos_Aprendizagem_has_habilidades_Objetos_Aprendizagem1` FOREIGN KEY (`Objetos_Aprendizagem_idObjetos_Aprendizagem`) REFERENCES `objetos_aprendizagem` (`idObjetos_Aprendizagem`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Objetos_Aprendizagem_has_habilidades_habilidades1` FOREIGN KEY (`habilidades_id_habilidades`) REFERENCES `habilidades` (`id_habilidades`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `objetos_aprendizagem_has_keywords`
--
ALTER TABLE `objetos_aprendizagem_has_keywords`
  ADD CONSTRAINT `fk_Objetos_Aprendizagem_has_Keywords_Keywords1` FOREIGN KEY (`Keywords_idKeywords`) REFERENCES `keywords` (`idKeywords`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Objetos_Aprendizagem_has_Keywords_Objetos_Aprendizagem1` FOREIGN KEY (`Objetos_Aprendizagem_idObjetos_Aprendizagem`) REFERENCES `objetos_aprendizagem` (`idObjetos_Aprendizagem`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `objetos_aprendizagem_has_topico`
--
ALTER TABLE `objetos_aprendizagem_has_topico`
  ADD CONSTRAINT `fk_Objetos_Aprendizagem_has_topico_Objetos_Aprendizagem1` FOREIGN KEY (`Objetos_Aprendizagem_idObjetos_Aprendizagem`) REFERENCES `objetos_aprendizagem` (`idObjetos_Aprendizagem`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Objetos_Aprendizagem_has_topico_topico1` FOREIGN KEY (`topico_id_topico`) REFERENCES `topico` (`id_topico`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `professor`
--
ALTER TABLE `professor`
  ADD CONSTRAINT `fk_professor_dados_pessoais1` FOREIGN KEY (`id_dados_pessoais`) REFERENCES `dados_pessoais` (`id_dados_pessoais`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `professor_has_disciplina`
--
ALTER TABLE `professor_has_disciplina`
  ADD CONSTRAINT `fk_professor_has_disciplina_disciplina1` FOREIGN KEY (`disciplina_id_disciplina`) REFERENCES `disciplina` (`id_disciplina`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_professor_has_disciplina_professor1` FOREIGN KEY (`professor_id_professor`) REFERENCES `professor` (`id_professor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `professor_has_turma`
--
ALTER TABLE `professor_has_turma`
  ADD CONSTRAINT `fk_professor_has_turma_professor1` FOREIGN KEY (`professor_id_professor`) REFERENCES `professor` (`id_professor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_professor_has_turma_turma1` FOREIGN KEY (`turma_id_turma`) REFERENCES `turma` (`id_turma`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `rua`
--
ALTER TABLE `rua`
  ADD CONSTRAINT `fk_rua_bairro1` FOREIGN KEY (`id_bairro`) REFERENCES `bairro` (`id_bairro`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `simulado`
--
ALTER TABLE `simulado`
  ADD CONSTRAINT `fk_simulado_coordenador1` FOREIGN KEY (`id_coordenador`) REFERENCES `coordenador` (`id_coordenador`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `simulado_has_oa_questionario`
--
ALTER TABLE `simulado_has_oa_questionario`
  ADD CONSTRAINT `fk_simulado_has_OA_questionario_OA_questionario1` FOREIGN KEY (`OA_questionario_id_questionario`) REFERENCES `oa_questionario` (`id_questionario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_simulado_has_OA_questionario_simulado1` FOREIGN KEY (`simulado_id_simulado`) REFERENCES `simulado` (`id_simulado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `turma`
--
ALTER TABLE `turma`
  ADD CONSTRAINT `fk_turma_curso1` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `turma_has_disciplina`
--
ALTER TABLE `turma_has_disciplina`
  ADD CONSTRAINT `fk_turma_has_disciplina_disciplina1` FOREIGN KEY (`disciplina_id_disciplina`) REFERENCES `disciplina` (`id_disciplina`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_turma_has_disciplina_turma1` FOREIGN KEY (`turma_id_turma`) REFERENCES `turma` (`id_turma`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `turma_has_epoca_bimestre`
--
ALTER TABLE `turma_has_epoca_bimestre`
  ADD CONSTRAINT `fk_turma_has_epoca_bimestre_epoca_bimestre1` FOREIGN KEY (`epoca_bimestre_id_epoca_bimestre`) REFERENCES `epoca_bimestre` (`id_epoca_bimestre`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_turma_has_epoca_bimestre_epoca_semestre1` FOREIGN KEY (`epoca_semestre_id_epoca_semestre`) REFERENCES `epoca_semestre` (`id_epoca_semestre`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_turma_has_epoca_bimestre_turma1` FOREIGN KEY (`turma_id_turma`) REFERENCES `turma` (`id_turma`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `turma_has_simulado`
--
ALTER TABLE `turma_has_simulado`
  ADD CONSTRAINT `fk_turma_has_simulado_simulado1` FOREIGN KEY (`simulado_id_simulado`) REFERENCES `simulado` (`id_simulado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_turma_has_simulado_turma1` FOREIGN KEY (`turma_id_turma`) REFERENCES `turma` (`id_turma`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `versao_questionario`
--
ALTER TABLE `versao_questionario`
  ADD CONSTRAINT `fk_versao_questionario_OA_questionario1` FOREIGN KEY (`OA_questionario_id_questionario`) REFERENCES `oa_questionario` (`id_questionario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `versao_questionario_has_oa_questoes`
--
ALTER TABLE `versao_questionario_has_oa_questoes`
  ADD CONSTRAINT `fk_versao_questionario_has_OA_questoes_OA_questoes1` FOREIGN KEY (`OA_questoes_id_questao`) REFERENCES `oa_questoes` (`id_questao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_versao_questionario_has_OA_questoes_versao_questionario1` FOREIGN KEY (`versao_questionario_id_versao_questionario`) REFERENCES `versao_questionario` (`id_versao_questionario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `versao_simulado`
--
ALTER TABLE `versao_simulado`
  ADD CONSTRAINT `versao_simulado_ibfk_1` FOREIGN KEY (`simulado_id_simulado`) REFERENCES `simulado` (`id_simulado`),
  ADD CONSTRAINT `versao_simulado_ibfk_2` FOREIGN KEY (`versao_questionario_id_versao_questionario`) REFERENCES `versao_questionario` (`id_versao_questionario`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
