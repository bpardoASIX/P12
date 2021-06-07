--EX10
CREATE OR REPLACE FUNCTION show_prod_cat_sql(category integer) RETURNS SETOF integer AS $$
SELECT prod_id
FROM products
WHERE category = $1;
$$ LANGUAGE SQL;

SELECT COUNT(*) FROM show_prod_cat_sql(1);

CREATE OR REPLACE FUNCTION show_prod_cat_plpgsql(category integer) RETURNS SETOF integer AS $$
BEGIN
RETURN QUERY SELECT prod_id
FROM products P
WHERE P.category = $1;
END;
$$ LANGUAGE PLPGSQL;

SELECT COUNT(*) FROM show_prod_cat_plpgsql(1);
