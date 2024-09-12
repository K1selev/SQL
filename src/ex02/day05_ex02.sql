CREATE INDEX idx_person_name ON person USING btree (UPPER(name));

SET enable_seqscan = OFF;
EXPLAIN ANALYSE
SELECT name
  FROM person
 ORDER BY (UPPER(name));
