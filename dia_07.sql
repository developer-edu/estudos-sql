-- INNER JOIN: retorna apenas registros que existem nas DUAS tabelas
-- Exemplo: pedidos com informações do cliente

SELECT o.order_id,
       o.order_status,
       c.customer_city,
       c.customer_state
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
LIMIT 10;

-- EXERCÍCIO 1 — Básico
-- Retorne order_id, order_status e customer_city
-- de todos os pedidos
-- Tabelas: orders + customers
SELECT o.order_id, 
	   o.order_status, 
	   c.customer_city
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id


-- EXERCÍCIO 2 — Básico
-- Retorne order_id, price, freight_value
-- e product_category_name de cada item
-- Tabelas: order_items + products
SELECT o.order_id,
	   o.price,
	   o.freight_value,
	   p.product_category_name
FROM order_items o
INNER JOIN products p
ON o.product_id = p.product_id

-- EXERCÍCIO 3 — Básico
-- Retorne order_id, payment_type e payment_value
-- apenas dos pedidos com status 'delivered'
-- Tabelas: orders + order_payments
SELECT o.order_id,
	   order_payments.payment_type,
	   order_payments.payment_value
FROM orders o
INNER JOIN order_payments
ON o.order_id = order_payments.order_id
WHERE order_status = 'delivered'

-- EXERCÍCIO 4 — Intermediário
-- Retorne customer_state, COUNT de pedidos
-- e SUM de payment_value por estado
-- Tabelas: orders + customers + order_payments
-- Dica: dois JOINs na mesma query
SELECT c.customer_state,
COUNT(DISTINCT o.order_id) AS total_orders,
SUM(order_payments.payment_value) AS total_payments
FROM orders o
INNER JOIN order_payments
ON o.order_id = order_payments.order_id
INNER JOIN customers c
ON c.customer_id = o.customer_id
GROUP BY c.customer_state


	   

-- EXERCÍCIO 5 — Intermediário
-- Qual o total de receita por categoria de produto?
-- Tabelas: order_items + products
-- Ordene do maior para o menor
-- Mostre apenas top 10 categorias
SELECT p.product_category_name,
SUM(o.price) AS total_revenue
FROM order_items o
INNER JOIN products p
ON o.product_id = p.product_id
GROUP BY product_category_name 
ORDER BY total_revenue DESC
LIMIT 10 

-- EXERCÍCIO 6 — Intermediário
-- Qual a nota média de avaliação por estado do cliente?
-- Tabelas: orders + customers + order_reviews
-- Ordene da maior para a menor nota

-- EXERCÍCIO 7 — Avançado
-- Qual o ticket médio por estado?
-- (total de pagamentos / total de pedidos por estado)
-- Tabelas: orders + customers + order_payments
-- Ordene do maior ticket para o menor

-- EXERCÍCIO 8 — Desafio
-- Relatório completo por estado:
-- estado | total_pedidos | total_receita | ticket_medio | nota_media
-- Tabelas: orders + customers + order_payments + order_reviews
-- Apenas estados com mais de 1000 pedidos
-- Ordene por total_receita DESC