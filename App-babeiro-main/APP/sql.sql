create database barbearia;

create table clientes(
	id_clientes int primary key auto_increment,
    nome varchar (30),
    email varchar(50),
    senha int 
);