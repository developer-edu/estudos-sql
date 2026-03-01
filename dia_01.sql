-- ================================
-- DIA 01 - Fundamentos de SQL
-- Data: 01/03/2026
-- ================================

-- CONCEITO 1: SELECT e WHERE com texto
SELECT name, population/1000000 AS population_millions
FROM world
WHERE continent = 'South America';

-- CONCEITO 2: Filtrar múltiplos valores com IN
SELECT name, population
FROM world
WHERE name IN ('France', 'Germany', 'Italy');

-- CONCEITO 3: O que aprendi hoje
-- WHERE coluna = 'valor' → filtra por um valor
-- WHERE coluna IN ('a','b','c') → filtra por lista
-- AS → renomeia a coluna no resultado
-- population/1000000 → calculo direto no SELECT