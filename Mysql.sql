CREATE DATABASE Projeto2;
USE projeto2;

DROP TABLE IF EXISTS `Colaboradores`;

CREATE TABLE `Colaboradores` (
  `CL_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CL_LOGIN` varchar(150) DEFAULT NULL,
  `CL_PASS` varchar(150) DEFAULT NULL,
  `CL_NOME` varchar(300) DEFAULT NULL,
  `CL_NIVEL` int(11) DEFAULT NULL,
  `CL_EMAIL` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`CL_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;


INSERT INTO `Colaboradores` (`CL_ID`, `CL_LOGIN`, `CL_PASS`, `CL_NOME`, `CL_NIVEL`, `CL_EMAIL`)
VALUES
	(1,'jacksonx','123','Jackson Xavier',1,'jxcostas@gmail.com'),
	(2,'ederg','123','Eder Gomes',1,'edergomess@gmail.com'),
	(3,'leonardob','123','Leonardo Baptista',1,'leobaptista92@hotmail.com'),
	(4,'naiara','123','Naiara Oliver',3,'naiara_olive@hotmail.com'),
	(5,'dirceum','123','Dirceu Matheus',2,'dirceu.matheus@mackenzie.br');





# ------------------------------------------------------------

DROP TABLE IF EXISTS `Eventos`;

CREATE TABLE `Eventos` (
  `EV_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `EV_NOME` varchar(300) DEFAULT NULL,
  `EV_DATA` date DEFAULT NULL,
  `EV_SALA` varchar(300) DEFAULT NULL,
  `EV_DESC` text,
  `EV_COLABORADOR` int(11) DEFAULT NULL,
  PRIMARY KEY (`EV_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;



INSERT INTO `Eventos` (`EV_ID`, `EV_NOME`, `EV_DATA`, `EV_SALA`, `EV_DESC`, `EV_COLABORADOR`)
VALUES
	(1,'Semana do Recrutamento X','2014-05-16','1','Semana de Recrutamento onde você pode fazer amigos e se divertir',2),
	(2,'Iniciação Científica','2014-05-22','2','inscrição aos projetos de iniciação Científica',3),
	(3,'Aula Magna','2014-05-23','1','Aula referente ao tema escolhido por estudantes',1),
	(4,'Projeto2 Abertura','2014-04-27','1','Abertura para apresentação de projetos da Disciplina',1),
	(5,'Gastronomia','2014-05-31','1','Melhores formas de aproveitamento da Comida',4),
	(6,'Teste','2014-05-31','2','Teste',4);


# ------------------------------------------------------------

DROP TABLE IF EXISTS `infra`;

CREATE TABLE `infra` (
  `sl_item` varchar(200) DEFAULT NULL,
  `sl_id2` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `infra` (`sl_item`, `sl_id2`)
VALUES
	('TV',1),
	('MICROFONE',2),
	('MESAS REDONDAS',3),
	('SISTEMA MULTIMIDIA',4),
	('PROJETOR',5);





# ------------------------------------------------------------

DROP TABLE IF EXISTS `Nivel`;

CREATE TABLE `Nivel` (
  `NV_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NV_NOME` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`NV_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;




INSERT INTO `Nivel` (`NV_ID`, `NV_NOME`)
VALUES
	(1,'Aluno'),
	(2,'Professor'),
	(3,'Outros');



# ------------------------------------------------------------

DROP TABLE IF EXISTS `Reserva`;

CREATE TABLE `Reserva` (
  `rs_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `colaborador_id` int(11) DEFAULT NULL,
  `sala_id` int(11) DEFAULT NULL,
  `data_evento` date DEFAULT NULL,
  PRIMARY KEY (`rs_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;


INSERT INTO `Reserva` (`rs_id`, `colaborador_id`, `sala_id`, `data_evento`)
VALUES
	(1,2,1,'2014-05-16'),
	(2,3,1,'2014-05-22'),
	(3,1,1,'2014-05-23'),
	(4,1,1,'2014-04-27'),
	(5,4,1,'2014-05-31'),
	(6,4,2,'2014-05-31');



# -----------------------------------------------------

DROP TABLE IF EXISTS `Salas`;

CREATE TABLE `Salas` (
  `SL_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SL_SALA` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`SL_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;



INSERT INTO `Salas` (`SL_ID`, `SL_SALA`)
VALUES
	(1,'Sala 01'),
	(2,'Sala 02'),
	(3,'Sala 03'),
	(4,'Sala 04'),
	(5,'Sala 05');


