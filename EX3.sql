--EX3
CREATE OR REPLACE FUNCTION insert_category1_sql(pcategory integer, pname varchar) RETURNS void AS $$
INSERT INTO categories VALUES (pcategory, pname);
$$ LANGUAGE SQL;

SELECT insert_category1_sql(21, 'category21');

CREATE OR REPLACE FUNCTION insert_category2_sql(integer, varchar) RETURNS void AS $$
INSERT INTO categories VALUES ($1, $2);
$$ LANGUAGE SQL;

SELECT insert_category2_sql(22, 'category22');

CREATE OR REPLACE FUNCTION insert_category3_sql(category integer, categoryname varchar) RETURNS void AS $$
INSERT INTO categories VALUES (insert_category3_sql.category, insert_category3_sql.categoryname);
$$ LANGUAGE SQL;

SELECT insert_category3_sql(23, 'category23');

CREATE OR REPLACE FUNCTION insert_category4_sql(pcategory categories) RETURNS void AS $$
INSERT INTO categories VALUES (pcategory.category, pcategory.categoryname);
$$ LANGUAGE SQL;

SELECT insert_category4_sql((24, 'category24'));
