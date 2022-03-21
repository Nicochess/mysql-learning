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
    This model is the same as the up here.
    The difference consist in the values is already respect the order from
    the table. Once you respect the order, you do not need to declare the fields.
*/

INSERT INTO pessoas VALUES
(DEFAULT, 'Nicolas', '2001-10-10', 'M', '1.70', '49.0', DEFAULT);

/*
    You could use INSERT INTO declaring how many data
    do you prefer to insert into a table.
    Looks like this.
*/

INSERT INTO pessoas VALUES
(DEFAULT, 'Nicolas', '2001-10-10', 'M', '1.70', '49.0', DEFAULT),
(DEFAULT, 'Silva', '2001-12-10', 'M', '1.75', '87.0', DEFAULT),
(DEFAULT, 'Melo', '2001-11-10', 'M', '1.78', '99.0', DEFAULT),
(DEFAULT, 'Pedro', '2001-10-11', 'M', '1.70', '69.0', DEFAULT),
(DEFAULT, 'João', '2001-01-10', 'M', '1.70', '79.0', DEFAULT);


/*
    This command will show all the data in pessoas table
*/

select * from pessoas;


/*
    This command will first show the structure of the pessoas table.
    Then, will change the pessoas table adding a new column named profissao
*/

desc pessoas;

alter table pessoas
add column profissao varchar(10);

/*
    This command will alter the pessoas table
    removing the profissao column from it.
*/

alter table pessoas
drop column profissao

/*
    This command will add the profissao column after the nome column
*/

alter table pessoas
add column profissao varchar(20) after nome;

/*
    This command will add the apelido column at first place in pessoas table
*/

alter table pessoas
add column apelido varchar(10) first;

/*
    This command is used to modify apelido column in table
    passing in to not null and fill the other with blank space
*/

alter table pessoas
modify column apelido varchar(15) not null default '';

/*
    This command will change the name of the register from apelido to nickname
    and keep the not null and default definitions
*/

alter table pessoas
change column apelido nickname varchar(20) not null default '';

/* 
    This command will change the table name from pessoas to humanos
*/

alter table pessoas
rename to humanos;

/* 
    This command is a model to create a new table preventing from override an existed
    table in database
*/

create table if not exists curso(
    nome varchar(15) not null unique,
    descricao text,
    carga int unsigned,
    totaulas int,
    ano year default '2016'
) default charset = utf8;

/*
    To delete a table from the database you could use this command
*/

drop table curso;

/*
    To update a register in a database, you could use this command
    First you should use update and the table that you want to change
    Once you did, use set to identify the field you want to modify and the value
    Last command, you inform to the database using where how to identify the row you
    want to change.
*/

update cursos
set nome = 'HTML5'
where idcursos = '1';

/*
    You could you this command to delete from a table cursos
    and passing a identify in where to specify the data you want to delete
*/

delete from cursos
where ano = '2017';

/*
    To delete all data from a table without delete itself, use this command
*/

truncate table cursos;

/*
    To select all data from a table and order by some field, use this command
*/

select * from cursos
order by ano;

/*
    To select all data and order by some field descendent, use this command
*/

select * from cursos
order by ano desc;

/*
    With select you could target only some columns in a table
*/

select nome, carga, curso from cursos;

/*
    You could select some rows in the table, doing the select all content and filter
    using where and the field with data like this
*/

select * from cursos
where nome = 'Programação';

/*
    You could filter some rows in a columns in a table, using select
    especify columns and filter the rows
*/

select nome, carga from cursos
where ano = '2018';

/*
    A cool option as well is filter rows between some values using select
*/

select nome, carga, id from cursos
where ano between 2010 and 2019;

/*
    If you want to filter your rows specify some values in the field
*/

select nome, carga from cursos
where ano in (2015, 2016, 2019);

/*
    You could filter rows using logic operators as well
*/

select * from cursos
where ano > 2010 and carga < 20;