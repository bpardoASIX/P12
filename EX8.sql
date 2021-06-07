--EX8
CREATE OR REPLACE FUNCTION avg_price_sql() RETURNS numeric AS $$
SELECT AVG(price)
FROM products;
$$ LANGUAGE SQL;

CREATE OR REPLACE FUNCTION avg_price_plpgsql() RETURNS numeric AS $$
DECLARE
average numeric;
BEGIN
SELECT AVG(price) INTO average
FROM products;
RETURN average;
END;
$$ LANGUAGE PLPGSQL;

CREATE OR REPLACE FUNCTION avg_price_noavg() RETURNS numeric AS $$
DECLARE
sum_price numeric;
num_products numeric;
average numeric;
BEGIN
SELECT SUM(price), COUNT(*) INTO sum_price, num_products
FROM products;
SELECT sum_price/num_products INTO average;
RETURN average;
END;
$$ LANGUAGE PLPGSQL;
