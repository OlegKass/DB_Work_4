CREATE OR REPLACE PACKAGE laureat_pkg IS
    TYPE laureat_row IS RECORD (
        laureat_id      laureat.laureat_id%TYPE,
        reward_year     laureat.reward_year%TYPE,
        city_of_org     laureat.city_of_org%TYPE,
        category_name   laureat.category_name%TYPE
    );
    TYPE laureat_table IS
        TABLE OF laureat_row;
    FUNCTION laureat_info_per_category_year (
        category_name_v   category.category_name%TYPE,
        reward_year_v     year_of_award.reward_year%TYPE
    ) RETURN laureat_table
        PIPELINED;

    PROCEDURE update_laureat_country (
        country_name_v   VARCHAR,
        city_name_v      VARCHAR,
        laureat_id_v     NUMBER
    );

END laureat_pkg;
/

CREATE OR REPLACE PACKAGE BODY laureat_pkg IS


    FUNCTION LAUREAT_INFO_PER_CATEGORY_YEAR (
        category_name_v   category.category_name%TYPE,
        reward_year_v     year_of_award.reward_year%TYPE
    ) RETURN laureat_table
        PIPELINED
    IS

        CURSOR cur_laureat IS
        SELECT
            laureat_id,
            reward_year,
            city_of_org,
            category_name
        FROM
            laureat
        WHERE
            category_name = category_name_v
            AND reward_year = reward_year_v;
    BEGIN
        FOR laur_row IN cur_laureat LOOP
            PIPE ROW ( laur_row );
        END LOOP;
    END;
    
    PROCEDURE update_laureat_country (
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
END;



