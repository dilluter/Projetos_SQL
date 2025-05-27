CREATE DATABASE IF NOT EXISTS lojaDB;
USE lojaDB;

CREATE TABLE clientes(
	idcliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100)	
);

INSERT INTO clientes(nome, email) VALUES
('Cleiton Rhasta', 'cleitin_cabeçaDEGELO@gmail.com'), -- id 1--
('Luan Raio Laser', 'LuanDoRaio@gmail.com'), -- id 2 --
('Robson CruzuÉ', 'cruzuezinhodaCEI@gmail.com'); -- id 3 --

SELECT * FROM clientes;

CREATE TABLE pedidos(
	idpedidos INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    data_pedido DATE,
    valor_total DECIMAL(10,2),
	FOREIGN KEY (id_cliente) REFERENCES clientes(idcliente) 
    -- TAMANHO DOS TIPOS DE DADOS --
);

INSERT INTO pedidos(id_cliente, data_pedido, valor_total) VALUES
(1, '2025-05-01', 2150.99),
(1, '2023-09-21', 10.99),
(3, '2022-02-clientes24', 999.99);

SELECT * FROM pedidos;

-- INNER JOIN -> RETORNAR APENAS REGISTROS QUE EXISTEM EM AMBAS AS TABELAS
-- SELECT -> DEFINIR QUAIS COLUNAS VÃO SER EXIBIDAS NO RESULTADO
-- c.nome -> ACESSAR A COLUNA 'nome' DA TABELA CLIENTE(APELIDO COM 'c')
-- p.data_pedido e p.valor_total -> ACESSAR COLUNAS DA TABELA PEDIDO
-- FROM -> CLIENTES C: DEFINE CLIENTES 
-- ON -> COMANDO DE JUNÇÃO QUE COMPARA O ID DA TABELA X COM O ID DA TABELA Y --


SELECT c.nome, p.data_pedido, p.valor_total
FROM clientes c
INNER JOIN pedidos p ON c.idcliente = p.id_cliente;

-- LEFT JOIN -> RETORNA TODOS OS CLIENTES, MESMO OS QUE NÃO TEM PEDIDOS(OS VALORES DO PEDIDO APARECEM COMO NULL)

SELECT c.nome, p.data_pedido, p.valor_total
FROM clientes c
LEFT JOIN pedidos p ON  c.idcliente = p.id_cliente;


-- RIGHT/ FULL OUTER JOIN ** PROXIMA AULA

-- SUM() -> SOMA OS VALORES DE UMA COLUNA
-- GROUP BY -> AGRUPA OS REGISTROS PARA APLICAR FUNÇÕES
-- AVG() CALCULA A MEDIA DOS VALORES DE UMA COLUNA

	SELECT c.nome, SUM(p.valor_total) AS total_gasto
    FROM clientes c
    JOIN pedidos p ON c.idcliente = p.id_cliente
    GROUP BY c.nome;




select * from cliente;
INSERT INTO cliente(nome) VALUES
('fefe'), -- id 1--
('fafa'),
('juju'), -- id 2 --
('Jessica '); -- id 3 --

-- CONSULTAS E COMANDOS --
-- COMANDO LIKE: FILTRA NOMES COM PADRÕES ESPECIFICOS
select * from cliente where nome LIKE 'J%';

-- IN: FILTRA MÚLTIPLOS VALORES COM CLAREZA, COMO EXEMPLO CHAVE PRIMARIA(ID'S)
SELECT * FROM pedidos WHERE id_cliente IN (1,2);
DESC PEDIDOS;
-- max e min: ENCONTRA VALORES EXTREMOS NUMÉRICOS --
	SELECT
		MAX(valor_total) AS VALOR_TOTAL_MAXIMO,
        MIN(valor_total) AS VALOR_TOTAL_MINIMO
	FROM pedidos;
-- ORDER BY: Organiza os resultados da busca no banco de dados --
SELECT * FROM pedidos ORDER BY valor_total ASC;

-- IS NULL: VERIFICA CAMPOS VAZIOS
SELECT * FROM cliente WHERE email IS NULL;

-- BETWEEN: FILTRA POR FAIXA DE VALORES
SELECT * FROM pedidos WHERE valor_total BETWEEN 40000 AND 50000;

-- LIMIT: MOSTRA APENAS OS PRIMEIRO RESULTADOS
SELECT * FROM pedidos ORDER BY valor_total ASC limit 3;

-- DISTINCT: REMOVE DUPLICIDADES
SELECT DISTINCT id_cliente FROM pedidos;

select * from pedidos;

-- INNER JOIN: TABELAS COM RELACIONAMENTO
SELECT c.nome, p.data_pedido, p.valor_total
FROM cliente c
INNER JOIN pedidos p ON c.idcliente = p.id_cliente;