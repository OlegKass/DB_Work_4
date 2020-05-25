CREATE OR REPLACE PROCEDURE add_laureat_country (
    country_name_v   VARCHAR,
    city_name_v      VARCHAR,
    laureat_id_v     NUMBER
) IS
    laureat_status   NUMBER;
    country_status   NUMBER;
    no_info EXCEPTION;
BEGIN
    SELECT
        COUNT(*)
    INTO laureat_status
    FROM
        laureat
    WHERE
        laureat_id = laureat_id_v;

    SELECT
        COUNT(*)
    INTO country_status
    FROM
        country
    WHERE
        country_name = (
            SELECT
                country_name
            FROM
                laureat
                JOIN city ON laureat.city_of_org = city.city_name
            WHERE
                laureat_id = laureat_id_v
        );

    IF ( laureat_status = 1 ) AND ( country_status = 1 ) THEN
        EXECUTE IMMEDIATE 'alter table city disable constraint city_country_fk';
        EXECUTE IMMEDIATE 'alter table laureat disable constraint laureat_city_fk';
        EXECUTE IMMEDIATE 'alter table SPECIALIST disable constraint SPECIALIST_CITY_FK';
        EXECUTE IMMEDIATE 'alter table SPECIALIST disable constraint SPECIALIST_CITY_FKV2';
        UPDATE country
        SET
            country_name = country_name_v
        WHERE
            country_name = (
                SELECT
                    country_name
                FROM
                    laureat
                    JOIN city ON laureat.city_of_org = city.city_name
                WHERE
                    laureat_id = laureat_id_v
            );

        UPDATE city
        SET
            city_name = city_name_v,
            country_name = country_name_v
        WHERE
            city_name = (
                SELECT
                    city_of_org
                FROM
                    laureat
            )
            AND country_name = (
                SELECT
                    country_name
                FROM
                    laureat
                    JOIN city ON laureat.city_of_org = city.city_name
                WHERE
                    laureat_id = laureat_id_v
            );

        UPDATE laureat
        SET
            city_of_org = city_name_v
        WHERE
            laureat_id = laureat_id_v;

        EXECUTE IMMEDIATE 'alter table city enable constraint city_country_fk';
        EXECUTE IMMEDIATE 'alter table laureat enable  constraint laureat_city_fk';
    ELSE
        RAISE no_info;
    END IF;

EXCEPTION
    WHEN no_info THEN
        dbms_output.put_line('No  data about laureat or country');
END;