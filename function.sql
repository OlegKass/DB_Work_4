CREATE OR REPLACE TYPE laureat_row___ IS OBJECT (
    full_name       VARCHAR(115),
    city_of_birth   VARCHAR(115),
    reward_year     NUMBER(38),
    category_name   VARCHAR2(115)
);

CREATE OR REPLACE TYPE laureat_table IS
    TABLE OF laureat_row___;

CREATE OR REPLACE FUNCTION laureat_info_per_category_year (
    category_name_v   VARCHAR2,
    reward_year_v     INTEGER
) RETURN laureat_table
    PIPELINED
IS

    CURSOR cur IS
    ( SELECT
        full_name,
        city_of_birth,
        reward_year,
        category_name
    FROM
        specialist
        JOIN laureat ON specialist.laureat_id = laureat.laureat_id
    WHERE
        category_name = category_name_v
        AND reward_year = reward_year_v
    );

    my_row laureat_row__;
BEGIN
    FOR iter IN cur LOOP
        my_row.full_name := iter.full_name;
        my_row.city_of_birth := iter.city_of_birth;
        my_row.reward_year := iter.reward_year;
        my_row.category_name := iter.category_name;
        PIPE ROW ( iter );
    END LOOP;
END;

SELECT
    full_name,
    city_of_birth,
    reward_year,
    category_name
FROM
    specialist
    JOIN laureat ON specialist.laureat_id = laureat.laureat_id
WHERE
    category_name = 'Chemistry'
    AND reward_year = 1901
