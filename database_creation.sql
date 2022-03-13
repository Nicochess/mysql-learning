/*
    This piece of code is used to create a database in UTF-8 model
    because in Portuguese we have our own language structure and this should be
    respected when you go to create a database.
*/

CREATE DATABASE CADASTRO
DEFAULT CHARACTER utf8
DEFAULT COLLATE utf8;

/*
    This is a model to create a table inside a database without repeat
    a register did in a table.
*/

USE CADASTRO

CREATE TABLE pessoas(
    id int NOT NULL AUTO_INCREMENT,
    nome varchar(30) NOT NULL,
    nascimento date,
    sexo enum('M','F'),
    altura decimal(5,2)
    peso decimal(3,2)
    nacionalidade varchar(20) DEFAULT 'Brasil',
    PRIMARY KEY (id)
) DEFAULT CHARSET = utf8;


/*
    This is a model to insert data in a selected fields in a table 'pessoas'.
    First you have to select the fields and then put the values
    in the next line.

    DO NOT INSERT ID AS A VALUE, BECAUSE IS AUTO_INCREMENTED. :D
*/

INSERT INTO pessoas
(nome, nascimento, sexo, altura, peso, nacionalidade)
VALUES
('Nicolas', '2001-10-10', 'M', '1.81', '64.5', 'Brasil');

/*
    This command will show all the data in pessoas table
*/

select * from pessoas;