
/*CRIANDO O BANCO DE DADOS*/
create database db_procedure;

USE db_procedure;

/* CRIANDO AS TABELAS CLIENTES E FACULDADE */
CREATE TABLE FACULDADE(
    ID INT AUTO_INCREMENT,
    NOME varchar(45),
    LOCALIZACAO VARCHAR(45),
    primary KEY(ID)

);

CREATE TABLE ALUNO(
    ID_ALUNO INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(45),
    CIDADE VARCHAR(45),
    FACULDADE_ID INT,
    FOREIGN KEY  (FACULDADE_ID)
    REFERENCES FACULDADE(ID)
);
/* CRIANDO AS PROCEDURES PARA, CRIAR, ATUALIZAR, DELETAR, MOSTRAR A SELEÇÃO DA TABELA FACULDADE*/

/*CRIAR*/
CREATE PROCEDURE CAD_FACUDADE(NOME VARCHAR(45),LOCALIZACAO VARCHAR(45))
BEGIN
    INSERT INTO FACULDADE(NOME,LOCALIZACAO) VALUES(NOME,LOCALIZACAO); 
END
#

/*SELEÇÃO*/

CREATE PROCEDURE SELECT_FACUDADE()
BEGIN
    SELECT * FROM FACULDADE; 
END
#


/*DELETAR*/
CREATE PROCEDURE DELETE_FACUDADE(IDS INT)
BEGIN
    DELETE FROM FACULDADE
    WHERE ID = IDS;
END
#

/*update*/
CREATE PROCEDURE UPDATE_FACUDADE(ids int, nome varchar(50), LOCALIZACAO varchar(50))
BEGIN
    UPDATE faculdade 
    set nome = nome, LOCALIZACAO = LOCALIZACAO where id = ids;
END
#

/*CRIANDO AS PROCEDURES PARA, CRIAR, ATUALIZAR, DELETAR E MOSTRAR AS PROJEÇÕES DA TABELA ALUNO*/

/*CRIAR*/
CREATE PROCEDURE CAD_ALUNO(NOME VARCHAR(45),CIDADE VARCHAR(45), ID INT)
BEGIN
    INSERT INTO aluno(NOME,cidade,FACULDADE_ID) VALUES(NOME,CIDADE,ID); 
END
#

/*SELEÇÃO*/

CREATE PROCEDURE SELECT_aluno()
BEGIN
    SELECT * FROM ALUNO; 
END
#

/*DELETAR*/


CREATE PROCEDURE DELETE_aluno(IDS INT)
BEGIN
    DELETE FROM ALUNO
    WHERE ID_ALUNO = IDS;
END
#

/*update*/
CREATE PROCEDURE update_aluno(ID int, nome varchar(50),CIDADE VARCHAR(50),FACUDADE_ID INT)
BEGIN
    UPDATE ALUNO 
    set nome = nome, CIDADE = CIDADE, FACULDADE = FACUDADE_ID where ID_ALUNO = ids;
END
#
/* PROCEDURES CRIADA DA TABELA FACULDADE*/

CALL CAD_FACUDADE();
CALL SELECT_FACUDADE();
CALL UPDATE_FACUDADE();
CALL DELETE_FACUDADE();

/* ALIMENTANDO A TABELA FACULDADE CHAMANDO AS PROCEDURES*/

CALL CAD_FACUDADE('UNIASSELVI','CAUCAIA');
CALL CAD_FACUDADE('FAMETRO','FORTALEZA');
CALL CAD_FACUDADE('UNIFANOR','CAUCAIA');
CALL CAD_FACUDADE('ANHANGUERA','FORTALEZA');
CALL CAD_FACUDADE('UFC','FORTALEZA');
CALL CAD_FACUDADE('ESTACIO','FORTALEZA');

/* ALIMENTANDO A TABELA ALUNO CHAMANDO AS PROCEDURES*/

CALL CAD_ALUNO('MIGUEL', 'CAUCAIA', 1);
CALL CAD_ALUNO('ANDRE', 'FORTALEZA', 2);
CALL CAD_ALUNO('JHONNY', 'MARACANAU', 3);
CALL CAD_ALUNO('MARIA','CAUCAIA', 4);
CALL CAD_ALUNO('MARCOS','FORTALEZA', 5);
CALL CAD_ALUNO('SABRINA','MARCANAU',6);
CALL CAD_ALUNO('FELINA','CAUCAIA', 5);
CALL CAD_ALUNO('JARED', 'FORTALEZA', 6);
CALL CAD_ALUNO('SILVANIELE', 'CAUCAIA', 6);
CALL CAD_ALUNO('JOAO', 'CAUCAIA', 1);
CALL CAD_ALUNO('MARCELO', 'FORTALEZA', 2);
CALL CAD_ALUNO('CARLOS', 'MARACANAU', 3);
CALL CAD_ALUNO('MARTA','CAUCAIA', 4);
CALL CAD_ALUNO('ASH','FORTALEZA', 5);
CALL CAD_ALUNO('MARCONDES','MARCANAU',6);
CALL CAD_ALUNO('JACOB','CAUCAIA', 5);
CALL CAD_ALUNO('JUNIOIR', 'FORTALEZA', 6);
CALL CAD_ALUNO('FABRICIO', 'CAUCAIA', 6);


/* PROCEDURES CRIADA DA TABELA ALUNO */

CALL CAD_ALUNO();
CALL SELECT_aluno();
CALL DELETE_aluno();
CALL update_aluno();


/* ATIVIDADE SOLICITADA PARA CRIAÇÃO DAS PROCEDURES */

/*1- LISTAR O NOME DOS ALUNOS E SUAS FACUDADES */

CREATE PROCEDURE ALUNOS()
BEGIN
    SELECT A.NOME, A.CIDADE, F.NOME, F.LOCALIZACAO FROM ALUNO AS A
INNER JOIN FACULDADE AS F
ON FACULDADE_ID = ID;
END
#

/* 2- LISTAR QUANTOS ALUNOS DE FORTALEZA ESTUDAM NA UFC */
CREATE PROCEDURE QUAN_UFC()
BEGIN
    SELECT F.NOME, F.LOCALIZACAO, COUNT(F.NOME) AS QUANTIDADE FROM ALUNO AS A
    INNER JOIN FACULDADE AS F
    ON FACULDADE_ID = ID
    WHERE CIDADE = 'FORTALEZA' 
    AND F.NOME = 'UFC'
    GROUP BY CIDADE;
END
#


/*3 -  LISTAR QUANTOS ALUNOS ESTUDAM NA ESTACIO */

CREATE PROCEDURE QUAN_ESTACIO()
BEGIN
    SELECT F.NOME, COUNT(F.NOME) FROM ALUNO AS A
    INNER JOIN FACULDADE AS F
    ON FACULDADE_ID = ID
    WHERE F.NOME = 'ESTACIO'
    GROUP BY F.NOME;
END
#
/* PROCEDURES CRIADA PARA PROJEÇÃO DAS ATIVIDADES SOLICITADAS */
CALL ALUNOS();
CALL QUAN_UFC();
CALL QUANT_ESTACIO();

