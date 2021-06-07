--EX4
CREATE OR REPLACE FUNCTION show_name_sql(id integer, OUT first varchar, OUT last varchar) AS $$
SELECT firstname, lastname FROM customers
WHERE customerid = id;
$$ LANGUAGE SQL;

SELECT show_name_sql(2);

SELECT first, last FROM show_name_sql(2);

CREATE OR REPLACE FUNCTION  show_name_plpgsql(id integer, OUT first varchar, OUT last varchar) AS $$
BEGIN
SELECT firstname, lastname INTO first, last FROM customers
WHERE customerid = id;
END;
$$ LANGUAGE PLPGSQL;

SELECT show_name_plpgsql(2);

SELECT first, last FROM show_name_plpgsql(2);
