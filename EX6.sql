--EX6
CREATE OR REPLACE FUNCTION show_cust_sql(id integer) RETURNS customers AS $$
SELECT * FROM customers
WHERE customerid = $1;
$$ LANGUAGE SQL;

SELECT * FROM show_cust_sql(2);
SELECT (show_cust_sql(2)).firstname;

CREATE OR REPLACE FUNCTION show_cust_plpgsql(id integer) RETURNS customers AS $$
DECLARE
cust customers;
BEGIN
SELECT * INTO cust FROM customers
WHERE customerid = $1;
RETURN cust;
END;
$$ LANGUAGE PLPGSQL;

SELECT * FROM show_cust_plpgsql(2);
SELECT (show_cust_plpgsql(2)).firstname;
