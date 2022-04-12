CREATE OR ALTER PROCEDURE sp_busca_produtos
@busca VARCHAR(50),
@tipo_ordenacao INT
AS

--ordenado por código
IF @tipo_ordenacao = 0 BEGIN
	SELECT cod_prod, nome, sigla, nome_cat, P.cod_cat_prod, P.cod_und
	FROM produtos AS P 
	INNER JOIN unidades as U
		ON P.cod_und = U.cod_und
	LEFT JOIN cat_produto as Cp
		ON Cp.cod_cat_prod = P.cod_cat_prod
	WHERE cod_prod LIKE '%'+@busca+'%'
	ORDER BY cod_prod
END

--ordenado por produto
IF @tipo_ordenacao = 1 BEGIN
	SELECT cod_prod, nome, sigla, nome_cat, P.cod_cat_prod, P.cod_und
	FROM produtos AS P 
	INNER JOIN unidades as U
		ON P.cod_und = U.cod_und
	LEFT JOIN cat_produto as Cp
		ON Cp.cod_cat_prod = P.cod_cat_prod
	WHERE nome LIKE '%'+@busca+'%'
	ORDER BY nome
END

--ordenado por categoria
IF @tipo_ordenacao = 2 BEGIN
	SELECT cod_prod, nome, sigla, nome_cat, P.cod_cat_prod, P.cod_und
	FROM produtos AS P 
	INNER JOIN unidades as U
		ON P.cod_und = U.cod_und
	LEFT JOIN cat_produto as Cp
		ON Cp.cod_cat_prod = P.cod_cat_prod
	WHERE nome_cat LIKE '%'+@busca+'%'
	ORDER BY nome_cat
END

--ordenado por unidade
IF @tipo_ordenacao = 3 BEGIN
	SELECT cod_prod, nome, sigla, nome_cat, P.cod_cat_prod, P.cod_und
	FROM produtos AS P 
	INNER JOIN unidades as U
		ON P.cod_und = U.cod_und
	LEFT JOIN cat_produto as Cp
		ON Cp.cod_cat_prod = P.cod_cat_prod
	WHERE sigla LIKE '%'+@busca+'%'
	ORDER BY sigla
END