CREATE SEQUENCE seq_person_discounts START 1;
ALTER TABLE person_discounts ALTER id SET DEFAULT nextval('seq_person_discounts');
SELECT setval('seq_person_discounts', (SELECT COUNT(*) FROM person_discounts) + 1);