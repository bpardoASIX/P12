--EX12
CREATE OR REPLACE FUNCTION show_prod_cat3_plpgsql(catid integer) RETURNS SETOF products AS $$
DECLARE
	curs_prod products;
BEGIN
FOR curs_prod IN
	        SELECT * FROM products WHERE category = $1
	LOOP
	        return next curs_prod;
END LOOP;
END;
$$ LANGUAGE PLPGSQL;

SELECT COUNT(*) FROM show_prod_cat3_plpgsql(1);
