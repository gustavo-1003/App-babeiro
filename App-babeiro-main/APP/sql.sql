create database barbearia;

create table clientes(
	id_clientes int primary key auto_increment,
    nome varchar (30),
    email varchar(50),
    senha int 
);

CREATE TABLE agenda (
    id_agenda INT AUTO_INCREMENT PRIMARY KEY,
    id_clientes INT NOT NULL,
    data DATE,
    horario TIME,

    FOREIGN KEY (id_clientes)
        REFERENCES clientes(id_clientes)
);
