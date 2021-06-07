--EX2
CREATE TYPE return_before_after AS (before int, after int);

CREATE OR REPLACE FUNCTION del_under18_2() RETURNS return_before_after AS $$
DECLARE
	before integer;
	after integer;
BEGIN
SELECT 	COUNT(*) INTO before FROM customers;
DELETE FROM customers WHERE age < 18;
SELECT COUNT(*) INTO after FROM customers;
RETURN (before, after);
END;
$$ LANGUAGE PLPGSQL;

SELECT del_under18_2();

SELECT * FROM del_under18_2();
