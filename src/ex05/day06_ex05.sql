COMMENT ON TABLE person_discounts IS 'Personal discount for each clients';
COMMENT ON COLUMN person_discounts.discount IS 'Value of discount';
COMMENT ON COLUMN person_discounts.person_id IS 'Foreign key to person table';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Foreign key to pizzeria table';
COMMENT ON COLUMN person_discounts.id IS 'Primary key';