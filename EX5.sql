--EX5
CREATE OR REPLACE FUNCTION increase_price_sql(prod products) RETURNS numeric AS $$
UPDATE products
SET price = price * 1.05
WHERE prod_id = prod.prod_id
RETURNING price;
$$ LANGUAGE SQL;

SELECT common_prod_id, increase_price_sql(products.*)
FROM products
WHERE title = 'ACADEMY ADAPTATION';

CREATE OR replace FUNCTION increase_price_plpgsql(prod products) RETURNS numeric AS $$
BEGIN
UPDATE products
SET price = price * 1.05
WHERE prod_id = prod.prod_id;
RETURN prod.price;
END;
$$ LANGUAGE PLPGSQL;

SELECT common_prod_id, increase_price_plpgsql(products.*)
FROM products
WHERE title = 'ACADEMY ADAPTATION';
