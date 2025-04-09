-- Listar todos os Clientes que não tenham realizado uma compra
SELECT c.customer_id, c.first_name, c.last_name FROM customers c LEFT JOIN orders o ON c.customer_id = o.customer_id WHERE o.order_id IS NULL;

-- Listar os Produtos que não tenham sido comprados
SELECT p.product_id, p.product_name FROM products p LEFT JOIN order_items oi ON p.product_id = oi.product_id WHERE oi.order_id IS NULL;

-- Listar os Produtos sem Estoque
SELECT p.product_id, p.product_name FROM products p LEFT JOIN stocks s ON p.product_id = s.product_id WHERE s.quantity = 0 OR s.quantity IS NULL;

-- Agrupar a quantidade de vendas que uma determinada Marca por Loja
SELECT
    b.brand_name,
    st.store_name,
    SUM(oi.quantity) AS total_quantity_sold
FROM brands b 
JOIN products p ON b.brand_id = p.brand_id
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o ON oi.order_id = o.order_id
JOIN stores st ON o.store_id = st.store_id
GROUP BY b.brand_name, st.store_name
ORDER BY b.brand_name, st.store_name;

-- Listar os Funcionários que não estejam relacionados a um Pedido
SELECT sf.staff_id, sf.first_name, sf.last_name FROM staffs sf LEFT JOIN orders o ON sf.staff_id = o.staff_id WHERE o.order_id IS NULL;
