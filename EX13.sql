--EX13
CREATE OR REPLACE FUNCTION mySum(num1 integer, num2 integer) RETURNS integer AS $$
SELECT ($1+$2)
$$ LANGUAGE SQL;

CREATE OR REPLACE FUNCTION mySum(num1 float, num2 integer) RETURNS float AS $$
SELECT ($1+$2)
$$ LANGUAGE SQL;

CREATE OR REPLACE FUNCTION mySum(num1 text, num2 text) RETURNS text AS $$
SELECT CONCAT($1,$2)
$$ LANGUAGE SQL;

SELECT mySum(1,1), mySum(1.1,1), mySum('1','1');
