
CREATE TABLE public.clientes (
                cod_cliente INTEGER NOT NULL,
                nome VARCHAR(50) NOT NULL,
                e_mail VARCHAR(100),
                nascimento DATE NOT NULL,
                sexo CHAR(1) NOT NULL,
                estado_civil VARCHAR(20) NOT NULL,
                CONSTRAINT cod_cliente PRIMARY KEY (cod_cliente)
);


CREATE TABLE public.telefones_clie (
                id_telefone INTEGER NOT NULL,
                cod_cliente INTEGER NOT NULL,
                numero VARCHAR(30) NOT NULL,
                CONSTRAINT id_telefone_clie PRIMARY KEY (id_telefone, cod_cliente)
);


CREATE TABLE public.fornecedor (
                id_fornecedor INTEGER NOT NULL,
                cnpj CHAR(14) NOT NULL,
                razao_social VARCHAR(100) NOT NULL,
                CONSTRAINT id_fornecedor PRIMARY KEY (id_fornecedor)
);


CREATE TABLE public.telefones_forn (
                id_telefone INTEGER NOT NULL,
                id_fornecedor INTEGER NOT NULL,
                numero VARCHAR(30) NOT NULL,
                CONSTRAINT id_telefone_forn PRIMARY KEY (id_telefone, id_fornecedor)
);


CREATE TABLE public.endereco_forn (
                id_fornecedor INTEGER NOT NULL,
                logradouro VARCHAR(100) NOT NULL,
                numero INTEGER NOT NULL,
                complemento VARCHAR(100),
                bairro VARCHAR(30) NOT NULL,
                cidade VARCHAR(30) NOT NULL,
                uf VARCHAR(20) NOT NULL,
                cep CHAR(8) NOT NULL,
                CONSTRAINT id_fornecedor_end PRIMARY KEY (id_fornecedor)
);


CREATE TABLE public.materiais (
                cod_material INTEGER NOT NULL,
                nome VARCHAR(50) NOT NULL,
                quantidade NUMERIC(50) NOT NULL,
                CONSTRAINT cod_material PRIMARY KEY (cod_material)
);


CREATE TABLE public.mat_forn (
                cod_material INTEGER NOT NULL,
                quantidade NUMERIC(50) NOT NULL,
                valor_bruto NUMERIC(6,2) NOT NULL,
                valor_desconto NUMERIC(6,2) NOT NULL,
                valor_liquido NUMERIC(6,2) NOT NULL,
                data_compra DATE NOT NULL,
                data_prevista DATE NOT NULL,
                data_final DATE,
                id_fornecedor INTEGER NOT NULL,
                CONSTRAINT id_material PRIMARY KEY (cod_material)
);


CREATE TABLE public.mat_terceiros (
                cod_material INTEGER NOT NULL,
                cor VARCHAR(20) NOT NULL,
                CONSTRAINT cod_material_ter PRIMARY KEY (cod_material)
);


CREATE TABLE public.mat_proprio (
                cod_material INTEGER NOT NULL,
                data_compra DATE NOT NULL,
                CONSTRAINT cod_material_pro PRIMARY KEY (cod_material)
);


CREATE TABLE public.ferramentas (
                id_ferramentas INTEGER NOT NULL,
                nome VARCHAR(50) NOT NULL,
                quantidade NUMERIC(50) NOT NULL,
                CONSTRAINT id_ferramenta PRIMARY KEY (id_ferramentas)
);


CREATE TABLE public.servicos (
                id_serviço INTEGER NOT NULL,
                nome VARCHAR(50) NOT NULL,
                descricao VARCHAR(200) NOT NULL,
                duracao VARCHAR(10) NOT NULL,
                valor NUMERIC(6,2) NOT NULL,
                orientacoes VARCHAR(200) NOT NULL,
                CONSTRAINT id_servico PRIMARY KEY (id_serviço)
);


CREATE TABLE public.consumo_previsto (
                id_serviço INTEGER NOT NULL,
                quantidade NUMERIC(50) NOT NULL,
                cod_material INTEGER NOT NULL,
                CONSTRAINT id_materiais PRIMARY KEY (id_serviço)
);


CREATE TABLE public.uso_previsto (
                id_servico INTEGER NOT NULL,
                quantidade NUMERIC(50) NOT NULL,
                id_ferramentas INTEGER NOT NULL,
                CONSTRAINT id_servico_pre PRIMARY KEY (id_servico)
);


CREATE TABLE public.empregados (
                matricula INTEGER NOT NULL,
                nome VARCHAR(50) NOT NULL,
                cargo VARCHAR(20) NOT NULL,
                formacao VARCHAR(20) NOT NULL,
                id_lider INTEGER NOT NULL,
                CONSTRAINT matricula PRIMARY KEY (matricula)
);


CREATE TABLE public.agenda (
                codigo INTEGER NOT NULL,
                matricula INTEGER NOT NULL,
                data DATE NOT NULL,
                hora VARCHAR(10) NOT NULL,
                valor NUMERIC(6,2) NOT NULL,
                gorjeta NUMERIC(6,2),
                id_serviço INTEGER NOT NULL,
                cod_cliente INTEGER NOT NULL,
                CONSTRAINT codigo PRIMARY KEY (codigo)
);


CREATE TABLE public.consumo_real (
                codigo INTEGER NOT NULL,
                quantidade NUMERIC(50) NOT NULL,
                cod_material INTEGER NOT NULL,
                CONSTRAINT id_materiais_1 PRIMARY KEY (codigo)
);


CREATE TABLE public.uso_real (
                id_ferramentas INTEGER NOT NULL,
                data_ret DATE NOT NULL,
                hora_ret VARCHAR(10) NOT NULL,
                data_dev DATE NOT NULL,
                hora_dev VARCHAR(10) NOT NULL,
                codigo INTEGER NOT NULL,
                CONSTRAINT id_ferramentas_real PRIMARY KEY (id_ferramentas)
);


CREATE TABLE public.especialidades (
                id_especialidades INTEGER NOT NULL,
                matricula INTEGER NOT NULL,
                curso VARCHAR(100) NOT NULL,
                CONSTRAINT id_especialidades PRIMARY KEY (id_especialidades, matricula)
);


CREATE TABLE public.telefone (
                matricula INTEGER NOT NULL,
                id_telefone INTEGER NOT NULL,
                numero VARCHAR(30) NOT NULL,
                CONSTRAINT matricula_tel PRIMARY KEY (matricula, id_telefone)
);


CREATE TABLE public.endereco (
                matricula INTEGER NOT NULL,
                logradouro VARCHAR(100) NOT NULL,
                numero INTEGER NOT NULL,
                complemento VARCHAR(100),
                bairro VARCHAR(30) NOT NULL,
                cidade VARCHAR(30) NOT NULL,
                uf VARCHAR(20) NOT NULL,
                cep CHAR(8) NOT NULL,
                CONSTRAINT matricula_end PRIMARY KEY (matricula)
);


ALTER TABLE public.telefones_clie ADD CONSTRAINT clientes_telefones_1_fk
FOREIGN KEY (cod_cliente)
REFERENCES public.clientes (cod_cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.agenda ADD CONSTRAINT clientes_agenda_fk
FOREIGN KEY (cod_cliente)
REFERENCES public.clientes (cod_cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.endereco_forn ADD CONSTRAINT fornecedor_endereco_forn_fk
FOREIGN KEY (id_fornecedor)
REFERENCES public.fornecedor (id_fornecedor)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.telefones_forn ADD CONSTRAINT fornecedor_telefones_forn_fk
FOREIGN KEY (id_fornecedor)
REFERENCES public.fornecedor (id_fornecedor)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.mat_forn ADD CONSTRAINT fornecedor_mat_forn_fk
FOREIGN KEY (id_fornecedor)
REFERENCES public.fornecedor (id_fornecedor)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.mat_proprio ADD CONSTRAINT materiais_mat_proprio_fk
FOREIGN KEY (cod_material)
REFERENCES public.materiais (cod_material)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.mat_terceiros ADD CONSTRAINT materiais_mat_terceiros_fk
FOREIGN KEY (cod_material)
REFERENCES public.materiais (cod_material)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.consumo_previsto ADD CONSTRAINT materiais_consumo_previsto_fk
FOREIGN KEY (cod_material)
REFERENCES public.materiais (cod_material)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.consumo_real ADD CONSTRAINT materiais_consumo_real_fk
FOREIGN KEY (cod_material)
REFERENCES public.materiais (cod_material)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.mat_forn ADD CONSTRAINT materiais_mat_forn_fk
FOREIGN KEY (cod_material)
REFERENCES public.materiais (cod_material)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.uso_previsto ADD CONSTRAINT ferramentas_uso_previsto_fk
FOREIGN KEY (id_ferramentas)
REFERENCES public.ferramentas (id_ferramentas)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.uso_real ADD CONSTRAINT ferramentas_uso_real_fk
FOREIGN KEY (id_ferramentas)
REFERENCES public.ferramentas (id_ferramentas)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.uso_previsto ADD CONSTRAINT servicos_uso_previsto_fk
FOREIGN KEY (id_servico)
REFERENCES public.servicos (id_serviço)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.agenda ADD CONSTRAINT servicos_agenda_fk
FOREIGN KEY (id_serviço)
REFERENCES public.servicos (id_serviço)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.consumo_previsto ADD CONSTRAINT servicos_consumo_previsto_fk
FOREIGN KEY (id_serviço)
REFERENCES public.servicos (id_serviço)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.endereco ADD CONSTRAINT empregados_endereco_fk
FOREIGN KEY (matricula)
REFERENCES public.empregados (matricula)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.telefone ADD CONSTRAINT empregados_telefone_fk
FOREIGN KEY (matricula)
REFERENCES public.empregados (matricula)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.especialidades ADD CONSTRAINT empregados_especialidades_fk
FOREIGN KEY (matricula)
REFERENCES public.empregados (matricula)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.empregados ADD CONSTRAINT empregados_empregados_fk
FOREIGN KEY (id_lider)
REFERENCES public.empregados (matricula)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.agenda ADD CONSTRAINT empregados_agenda_fk
FOREIGN KEY (matricula)
REFERENCES public.empregados (matricula)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.uso_real ADD CONSTRAINT agenda_uso_real_fk
FOREIGN KEY (codigo)
REFERENCES public.agenda (codigo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.consumo_real ADD CONSTRAINT agenda_consumo_real_fk
FOREIGN KEY (codigo)
REFERENCES public.agenda (codigo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;