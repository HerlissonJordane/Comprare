CREATE TABLE unidades(
cod_und INT IDENTITY(1,1) PRIMARY KEY NOT NULL, 
descricao VARCHAR(20) NOT NULL,
qtd_conv INT NOT NULL, 
converte BIT,
sigla char(4)
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

CREATE TABLE cabecalho_compras(
cod_compra INT IDENTITY(1,1) PRIMARY KEY NOT NULL, 
cod_comercio INT FOREIGN KEY REFERENCES comercio(cod_sup),
data_compra DATE NOT NULL,
total_compra DECIMAL(10,2)
chave_nfce VARCHAR(44) NULL
)


CREATE TABLE produtos_compras(
cod_itens_compra INT IDENTITY(1,1) PRIMARY KEY,
cod_produto INT FOREIGN KEY REFERENCES produtos(cod_prod),
cod_compra int FOREIGN KEY REFERENCES cabecalho_compras(cod_compra),
quantidade DECIMAL(10,3) NOT NULL,
valor_unitario SMALLMONEY NOT NULL,
valor_total SMALLMONEY NOT NULL,
valor_promocao SMALLMONEY,
valor_atacado SMALLMONEY,
qtd_min_atacado DECIMAL(10,3)
)