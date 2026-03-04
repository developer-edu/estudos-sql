-- ================================
-- DIA 03 - SELECT e WHERE
-- Data: 04/03/2026
-- ================================

-- CONCEITO: SELECT escolhe quais colunas retornar
SELECT * FROM clientes;

SELECT nome, plano
FROM clientes;

SELECT nome,
       plano,
       mensalidade AS valor_mensal
FROM clientes;

-- CONCEITO: WHERE filtra linhas
-- Filtrar por texto
SELECT * FROM clientes
WHERE plano = 'Enterprise';

-- Filtrar por número
SELECT nome, mensalidade
FROM clientes
WHERE mensalidade > 150.00;

-- Filtrar com duas condições (AND)
-- CORREÇÃO: booleano nao usa aspas simples
SELECT * FROM clientes
WHERE cidade = 'São Paulo'
AND ativo = true;

-- LIÇÃO DO DIA:
-- boolean = true (sem aspas)
-- texto = 'valor' (com aspas simples)
-- número = 150.00 (sem aspas)