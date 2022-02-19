CREATE PROCEDURE sp_busca_categoria_produto
@busca VARCHAR(50)
AS

SELECT * 
FROM cat_produto 
WHERE nome_cat LIKE '%'+@busca+'%'