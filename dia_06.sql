-- 1. Quantos clientes por estado?
--    (GROUP BY + COUNT + ORDER BY)
SELECT customer_state,
COUNT(customer_state) AS clientes_por_estado
FROM customers
GROUP BY customer_state
ORDER BY clientes_por_estado DESC


-- 2. Tipos de pagamento com total acima de R$500.000
--    (GROUP BY + SUM + HAVING)
SELECT payment_type, SUM(payment_value)
FROM order_payments
GROUP BY payment_type
HAVING SUM(payment_value) > 500000;

-- 3. Vendedores de SP cuja cidade NÃO começa com 'sao'
--    (WHERE + NOT LIKE)
SELECT *
FROM sellers
WHERE seller_state = 'SP'
AND seller_city NOT LIKE 'sao%'