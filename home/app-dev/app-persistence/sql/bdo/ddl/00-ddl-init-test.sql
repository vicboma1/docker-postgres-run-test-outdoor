DO $$
    BEGIN
        IF NOT EXISTS (SELECT 1 FROM information_schema.schemata WHERE schema_name = 'test') THEN
            EXECUTE 'CREATE SCHEMA test';
        END IF;

        CREATE TABLE IF NOT EXISTS test.base (
                                                 id SERIAL PRIMARY KEY,
                                                 name VARCHAR(100) NOT NULL
        );

    END $$;
