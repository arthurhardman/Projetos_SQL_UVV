CREATE TABLE IF NOT EXISTS si1ng10.clientes
(
    cpf char (11) NOT NULL,
    nome varchar(100) NOT NULL,
    nascimento date,
    email varchar(50) NOT NULL,
    senha varchar(50) NOT NULL,
    CONSTRAINT clientes_pkey PRIMARY KEY (cpf)
);


--------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS si1ng10.telefones
(
    cpf char(11)  NOT NULL,
    ddd char(3)  NOT NULL,
    numero char(9)  NOT NULL,
    CONSTRAINT telefones_pkey PRIMARY KEY (cpf),
    CONSTRAINT clientes_telefones_fk FOREIGN KEY (cpf)
        REFERENCES si1ng10.clientes (cpf) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);


--------------------------------------------------------------
CREATE TABLE IF NOT EXISTS si1ng10.endereco
(
    cpf char(11)  NOT NULL,
    rua varchar(100) NOT NULL,
    bairro varchar(50) NOT NULL,
    complemento varchar(250) ,
    cidade varchar(30) NOT NULL,
    uf char(2) NOT NULL,
    pais varchar(50) NOT NULL,
    CONSTRAINT endereco_pkey PRIMARY KEY (cpf),
    CONSTRAINT clientes_endereco_fk FOREIGN KEY (cpf)
        REFERENCES si1ng10.clientes (cpf) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);


---------------------------------------------------------
CREATE TABLE IF NOT EXISTS si1ng10.localizacao
(
    id_localizacao integer NOT NULL,
    cidade varchar (30) NOT NULL,
    uf char (2) NOT NULL,
    pais varchar(50) NOT NULL,
    CONSTRAINT localizacao_pkey PRIMARY KEY (id_localizacao)
);


---------------------------------------------------------
CREATE TABLE IF NOT EXISTS si1ng10.loja
(
    id_loja integer NOT NULL,
    nome varchar (50) COLLATE pg_catalog."default" NOT NULL,
    id_localizacao integer NOT NULL,
    CONSTRAINT loja_pkey PRIMARY KEY (id_loja),
    CONSTRAINT loja_localizacao_fk FOREIGN KEY (id_localizacao)
        REFERENCES si1ng10.localizacao (id_localizacao) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);


------------------------------------------------------
CREATE TABLE IF NOT EXISTS si1ng10.empregados
(
    id_empregado integer NOT NULL,
    nome varchar(100) NOT NULL,
    nascimento date,
    email varchar(50)  NOT NULL,
    id_lider integer NOT NULL,
    id_loja integer NOT NULL,
    CONSTRAINT empregados_pkey PRIMARY KEY (id_empregado),
    CONSTRAINT empregados_empregados_fk FOREIGN KEY (id_lider)
        REFERENCES si1ng10.empregados (id_empregado) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT empregados_loja_fk FOREIGN KEY (id_loja)
        REFERENCES si1ng10.loja (id_loja) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);


----------------------------------------------
CREATE TABLE IF NOT EXISTS si1ng10.pedidos
(
    id_pedido integer NOT NULL,
    quantidade char (10) NOT NULL,
    data date NOT NULL,
    id_empregado integer NOT NULL,
    cpf char (11) NOT NULL,
    CONSTRAINT pedidos_pkey PRIMARY KEY (id_pedido),
    CONSTRAINT pedidos_clientes_fk FOREIGN KEY (cpf)
        REFERENCES si1ng10.clientes (cpf) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT pedidos_empregados_fk FOREIGN KEY (id_empregado)
        REFERENCES si1ng10.empregados (id_empregado) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

