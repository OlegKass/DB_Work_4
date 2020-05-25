
BEGIN
  update_laureat_country('Ukraine', 'Nikopol', 2); 
  update_laureat_country('Ukraine', 'Nikopol', 4); 
END;




SELECT * FROM TABLE(laureat_info_per_category_year('Chemistry', 1901)); 
SELECT * FROM TABLE(laureat_info_per_category_year('Chemistry', 1902)); 



INSERT INTO year_of_award(reward_year) VALUES (1850);

INSERT INTO laureat VALUES (165, 'Chemistry','Berlin', 1850, TO_DATE('1849-09-14', 'YYYY-MM-DD') ); 
INSERT INTO laureat VALUES (163, 'Chemistry','Berlin', 2080, TO_DATE('1849-09-14', 'YYYY-MM-DD') ); 

