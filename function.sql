

create or replace TYPE laureat_row IS OBJECT (
    laureat_id      NUMBER,
    reward_year     NUMBER,
    city_of_org   VARCHAR2(50),
    category_name   VARCHAR2(50)
);

        
CREATE OR REPLACE TYPE laureat_table IS
    TABLE OF laureat_row;


CREATE OR REPLACE FUNCTION laureat_info_per_category_year (
    category_name_v   VARCHAR2,
    reward_year_v     NUMBER
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
    my_row laureat_row;
BEGIN
    FOR laur_row IN cur_laureat
    LOOP
        PIPE ROW ( laureat_row (laur_row.laureat_id, laur_row.reward_year, laur_row.city_of_org, laur_row.category_name) );
    END LOOP;
END;


        

    
