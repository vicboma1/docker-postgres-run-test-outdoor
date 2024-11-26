DO $$
    BEGIN
        IF NOT EXISTS (SELECT 1 FROM test.base WHERE name = '1') THEN
            INSERT INTO test.base (name) VALUES ('1');
        END IF;

        IF NOT EXISTS (SELECT 1 FROM test.base WHERE name = '2') THEN
            INSERT INTO test.base (name) VALUES ('2');
        END IF;

        IF NOT EXISTS (SELECT 1 FROM test.base WHERE name = '3') THEN
            INSERT INTO test.base (name) VALUES ('3');
        END IF;
    END $$;
