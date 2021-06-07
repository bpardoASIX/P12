--EX9
--A
SELECT * FROM avg_price_sql();

--B
SELECT title, price FROM products
WHERE price > avg_price_sql();

--C
SELECT title, price FROM products
WHERE price >  0.2 * avg_price_sql();

--D
SELECT title, price FROM products
WHERE ABS(price-avg_price_sql()) < 0.2 * avg_price_sql();

SELECT title, price FROM products
WHERE price > 0.8 * avg_price_sql()
AND price < 1.2 * avg_price_sql();
