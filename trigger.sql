CREATE OR REPLACE TRIGGER check_age
BEFORE INSERT
    ON laureat
    FOR EACH ROW
BEGIN
    IF (:new.reward_year - extract(year from  :new.birth_date) < 35 ) THEN
        RAISE_APPLICATION_ERROR(-20002, 'Too young');
    END IF;
END;
