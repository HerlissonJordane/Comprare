CREATE TABLE unidades(
cod_und INT IDENTITY(1,1) PRIMARY KEY NOT NULL, 
descricao VARCHAR(20) NOT NULL,
qtd_conv INT NOT NULL, 
converte BIT
)

CREATE TABLE cat_produto(
cod_cat_prod int PRIMARY KEY IDENTITY(1,1),
nome_cat VARCHAR(30) not null
)

CREATE TABLE produtos (
cod_prod INT IDENTITY(1,1) PRIMARY KEY NOT NULL, 
nome VARCHAR(50) NOT NULL, 
cod_und INT FOREIGN KEY REFERENCES unidades(cod_und),
cod_cat_prod INT FOREIGN KEY REFERENCES cat_produto(cod_cat_prod)
)

CREATE TABLE categoria (
cod_cat INT IDENTITY(1,1) PRIMARY KEY NOT NULL, 
categoria VARCHAR(50) NOT NULL
)

CREATE TABLE comercio(
cod_sup INT IDENTITY(1,1) PRIMARY KEY NOT NULL, 
nome VARCHAR(50) NOT NULL, 
rua VARCHAR(50),
numero int,
bairro VARCHAR(30),
cidade VARCHAR(30),
estado CHAR(2),
cod_cat int FOREIGN KEY REFERENCES categoria(cod_cat)
)

CREATE TABLE compras(
cod_comp INT IDENTITY(1,1) PRIMARY KEY NOT NULL, 
cod_prod INT FOREIGN KEY REFERENCES produtos(cod_prod),
cod_sup INT FOREIGN KEY REFERENCES supermercados(cod_sup),
data_compra DATE NOT NULL,
qtd DECIMAL(10,3) NOT NULL,
valor_unit SMALLMONEY NOT NULL,
valor_tot SMALLMONEY NOT NULL,
valor_prom SMALLMONEY,
valor_atac SMALLMONEY,
qtd_min_atac DECIMAL(10,3)
)