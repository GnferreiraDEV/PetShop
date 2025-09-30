USE petshop;

INSERT INTO FORNECEDOR (idFORNECEDOR, NOME, TELEFONE, EMAIL) VALUES
(1, 'PetDistribuidora S.A.', '11987654321', 'contato@petdistribuidora.com'),
(2, 'Brinquedos Cão Feliz', '21912345678', 'vendas@caofeliz.com.br');

INSERT INTO ADMINISTRADOR (idADMINISTRADOR, NOME, LOGIN, SENHA) VALUES
(1, 'João da Silva', 'admin', 'senha123'),
(2, 'Maria Oliveira', 'gerente', 'senha456');

INSERT INTO PRODUTO (idPRODUTO, NOME, DESCRICAO, PRECO, QUANTIDADE_ESTOQUE) VALUES
(101, 'Ração Premium para Cães Adultos', 'Pacote de 15kg sabor frango', 189.90, 50),
(102, 'Ração para Gatos Castrados', 'Pacote de 3kg sabor salmão', 89.50, 40),
(103, 'Brinquedo de Corda Resistente', 'Brinquedo para cães de mordida forte', 25.00, 120),
(104, 'Arranhador para Gatos', 'Arranhador de sisal com 2 andares', 150.00, 25);

INSERT INTO SERVICO (idSERVICO, PRECO, BANHO, TOSA) VALUES
(1, 50.00, 1, 0),
(2, 45.00, 0, 1),
(3, 85.00, 1, 1);

INSERT INTO CLIENTE (CPF, NOME, TELEFONE, EMAIL, ENDERECO, COMPRA_idCOMPRA, ANIMAL_DE_ESTIMACAO_idANIMAL_DE_ESTIMACAO) VALUES
('11122233344', 'Ana Paula Souza', '61998877665', 'ana.paula@email.com', 'Rua das Flores, 123', NULL, NULL),
('55566677788', 'Carlos Eduardo Lima', '61987654321', 'carlos.lima@email.com', 'Avenida Principal, 456', NULL, NULL),
('99988877766', 'Fernanda Costa', '61991234567', 'fernanda.costa@email.com', 'Quadra 10, Lote 5', NULL, NULL);

INSERT INTO ANIMAL_DE_ESTIMACAO (idANIMAL_DE_ESTIMACAO, NOME, RACA, IDADE, SEXO, CPF_CLIENTE) VALUES
(1, 'Bolinha', 'Poodle', 3, 'M', '11122233344'),
(2, 'Frajola', 'Siamês', 5, 'M', '55566677788'),
(3, 'Luna', 'SRD (Sem Raça Definida)', 2, 'F', '11122233344'),
(4, 'Thor', 'Golden Retriever', 1, 'M', '99988877766');

INSERT INTO COMPRA (idCOMPRA, CPF, DATA_COMPRA, VALOR_TOTAL, idPRODUTO) VALUES
(201, '11122233344', '2025-09-28', 214.90, '101'),
(202, '55566677788', '2025-09-29', 89.50, '102'),
(203, '99988877766', '2025-09-30', 235.00, '104');

INSERT INTO PAGAMENTO_PIX (idPAGAMENTO_PIX, CHAVE_PIX, ID_COMPRA) VALUES
(301, '11122233344', 201),
(302, 'carlos.lima@email.com', 202),
(303, '61991234567', 203);

INSERT INTO FORNECEDOR_has_PRODUTO (FORNECEDOR_idFORNECEDOR, PRODUTO_idPRODUTO) VALUES
(1, 101),
(1, 102),
(2, 103);

INSERT INTO ADMINISTRADOR_has_PRODUTO (ADMINISTRADOR_idADMINISTRADOR, PRODUTO_idPRODUTO) VALUES
(1, 101),
(1, 102),
(2, 103),
(2, 104);

INSERT INTO COMPRA_has_PRODUTO (COMPRA_idCOMPRA, PRODUTO_idPRODUTO) VALUES
(201, 101),
(201, 103),
(202, 102),
(203, 104),
(203, 103);

INSERT INTO CLIENTE_has_SERVICO (CLIENTE_CPF, CLIENTE_COMPRA_idCOMPRA, SERVICO_idSERVICO) VALUES
('99988877766', 203, 3);