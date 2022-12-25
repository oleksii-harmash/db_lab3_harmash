DROP TABLE IF EXISTS details_copy;
SELECT * FROM details;
CREATE TABLE details_copy AS SELECT * FROM details; 
DELETE FROM details_copy;
SELECT * FROM details_copy;


DO $$
 DECLARE
 	invoice details_copy.invoice%TYPE;
	item_num details_copy.item_num%TYPE;
	quantity details_copy.quantity%TYPE;
	cost details_copy.cost%TYPE;
	retail details_copy.retail%TYPE;

 BEGIN
 	invoice := 'S29198800001';
	item_num := 24350378;
	quantity := 2;
	cost := 16.31;
	retail := 12.99;
	 
     FOR counter IN 1..5
         LOOP
            INSERT INTO details_copy(invoice, item_num, quantity, cost, retail)
             VALUES (invoice || counter, counter * (1000000 + counter) + 24350378, counter + quantity, counter + cost, counter * 2 + retail);
         END LOOP;
 END;
 $$