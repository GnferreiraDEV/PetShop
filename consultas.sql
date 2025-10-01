USE petshop;

# 1 - Listar todos os clientes
SELECT * FROM CLIENTE;

# 2 - Mostrar nome, telefone e email dos clientes
SELECT NOME, TELEFONE, EMAIL FROM CLIENTE;

# 3 - Listar todos os animais de estimação com o nome do dono
SELECT a.NOME AS Animal, a.RACA, a.IDADE, c.NOME AS Dono
FROM ANIMAL_DE_ESTIMACAO a
JOIN CLIENTE c ON a.CPF_CLIENTE = c.CPF;

# 4 - Listar todos os produtos e seus fornecedores
SELECT p.NOME AS Produto, f.NOME AS Fornecedor
FROM PRODUTO p
JOIN FORNECEDOR_has_PRODUTO fp ON p.idPRODUTO = fp.PRODUTO_idPRODUTO
JOIN FORNECEDOR f ON fp.FORNECEDOR_idFORNECEDOR = f.idFORNECEDOR;

# 5 - Listar todas as compras com nome do cliente e valor total
SELECT c.NOME AS Cliente, co.idCOMPRA, co.DATA_COMPRA, co.VALOR_TOTAL
FROM COMPRA co
JOIN CLIENTE c ON co.CPF = c.CPF;

# 6 - Mostrar produtos comprados por cada cliente
SELECT cl.NOME AS Cliente, p.NOME AS Produto, p.PRECO
FROM COMPRA_has_PRODUTO cp
JOIN COMPRA co ON cp.COMPRA_idCOMPRA = co.idCOMPRA
JOIN CLIENTE cl ON co.CPF = cl.CPF
JOIN PRODUTO p ON cp.PRODUTO_idPRODUTO = p.idPRODUTO;

# 7 - Mostrar os serviços contratados pelos clientes
SELECT cl.NOME AS Cliente, s.idSERVICO, s.PRECO, s.BANHO, s.TOSA
FROM CLIENTE_has_SERVICO cs
JOIN CLIENTE cl ON cs.CLIENTE_CPF = cl.CPF
JOIN SERVICO s ON cs.SERVICO_idSERVICO = s.idSERVICO;

# 8 - Mostrar pagamentos via PIX com dados do cliente
SELECT cl.NOME AS Cliente, px.CHAVE_PIX, co.VALOR_TOTAL
FROM PAGAMENTO_PIX px
JOIN COMPRA co ON px.ID_COMPRA = co.idCOMPRA
JOIN CLIENTE cl ON co.CPF = cl.CPF;

# 9 - Quantidade de compras por cliente
SELECT cl.NOME, COUNT(co.idCOMPRA) AS Total_Compras
FROM CLIENTE cl
JOIN COMPRA co ON cl.CPF = co.CPF
GROUP BY cl.NOME;

# 10 - Produtos mais caros (top 3)
SELECT NOME, PRECO
FROM PRODUTO
ORDER BY PRECO DESC
LIMIT 3;
