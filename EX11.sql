--EX11
CREATE OR REPLACE FUNCTION show_prod_cat2_plpgsql(catid integer) RETURNS TABLE(
prod_id integer,
category integer,
title character varying(50),
actor character varying(50),
price numeric(12,2),
special smallint,
common_prod_id integer
) AS $$
BEGIN
RETURN QUERY SELECT *
FROM products P
WHERE P.category = $1;
END;
$$ LANGUAGE PLPGSQL;

SELECT COUNT(*) FROM show_prod_cat2_plpgsql(1);
