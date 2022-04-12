CREATE OR ALTER PROCEDURE SP_busca_comercio
@busca VARCHAR(30),
@tipo_ordenacao INT
AS

--ordenado por código
IF @tipo_ordenacao = 0 BEGIN
	SELECT cod_sup, nome, bairro, cidade, CAT.categoria
	FROM comercio AS COM
		INNER JOIN cat_comercio AS CAT
			ON COM.cod_cat = CAT.cod_cat
	WHERE cod_sup LIKE '%'+@busca+'%'
	ORDER BY nome
END

--ordenado por comércio
IF @tipo_ordenacao = 1 BEGIN
	SELECT cod_sup, nome, bairro, cidade, CAT.categoria
	FROM comercio AS COM
		INNER JOIN cat_comercio AS CAT
			ON COM.cod_cat = CAT.cod_cat
	WHERE nome LIKE '%'+@busca+'%'
	ORDER BY nome
END

--ordenado por comércio
IF @tipo_ordenacao = 2 BEGIN
	SELECT cod_sup, nome, bairro, cidade, CAT.categoria
	FROM comercio AS COM
		INNER JOIN cat_comercio AS CAT
			ON COM.cod_cat = CAT.cod_cat
	WHERE bairro LIKE '%'+@busca+'%'
	ORDER BY bairro
END

--ordenado por cidade
IF @tipo_ordenacao = 3 BEGIN
	SELECT cod_sup, nome, bairro, cidade, CAT.categoria
	FROM comercio AS COM
		INNER JOIN cat_comercio AS CAT
			ON COM.cod_cat = CAT.cod_cat
	WHERE cidade LIKE '%'+@busca+'%'
	ORDER BY cidade
END

--ordenado por categoria
IF @tipo_ordenacao = 4 BEGIN
	SELECT cod_sup, nome, bairro, cidade, CAT.categoria
	FROM comercio AS COM
		INNER JOIN cat_comercio AS CAT
			ON COM.cod_cat = CAT.cod_cat
	WHERE CAT.categoria LIKE '%'+@busca+'%'
	ORDER BY CAT.Categoria
END
