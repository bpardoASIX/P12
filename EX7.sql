--EX7
CREATE OR REPLACE FUNCTION show_prod_sql(INOUT prod_id integer, OUT title varchar(50), OUT price numeric) AS $$
SELECT prod_id, title, price
FROM products
WHERE prod_id = show_prod_sql.prod_id;
$$ LANGUAGE SQL;

SELECT * FROM show_prod_sql(2);

CREATE OR REPLACE FUNCTION show_prod_plpgsql(INOUT prod_id integer, OUT title varchar(50), OUT price numeric) RETURNS RECORD AS $$
BEGIN
SELECT P.prod_id, P.title, P.price INTO show_prod_plpgsql.prod_id, show_prod_plpgsql.title, show_prod_plpgsql.price
FROM products P
WHERE P.prod_id = show_prod_plpgsql.prod_id;
END;
$$ LANGUAGE PLPGSQL;

SELECT * FROM show_prod_plpgsql(2);
