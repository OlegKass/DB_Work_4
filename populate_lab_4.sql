INSERT INTO country(country_name)
VALUES ('Germany');
INSERT INTO country(country_name)
VALUES ('Netherlands');
INSERT INTO country(country_name)
VALUES ('Russia');


INSERT INTO city(city_name, country_name)
VALUES ('Berlin','Germany');
INSERT INTO city(city_name, country_name)
VALUES ('Leiden','Netherlands');
INSERT INTO city(city_name, country_name)
VALUES ('St. Petersburg','Russia');


INSERT INTO category(category_name)
VALUES ('Medicine');
INSERT INTO category(category_name)
VALUES ('Physics');
INSERT INTO category(category_name)
VALUES ('Chemistry');


INSERT INTO birth(birth_date)
VALUES (TO_DATE('1852-08-30', 'YYYY-MM-DD'));
INSERT INTO birth(birth_date)
VALUES (TO_DATE('1853-07-18', 'YYYY-MM-DD'));
INSERT INTO birth(birth_date)
VALUES (TO_DATE('1849-09-14', 'YYYY-MM-DD'));


INSERT INTO year_of_award(reward_year) 
VALUES (1901);
INSERT INTO year_of_award(reward_year) 
VALUES (1902);
INSERT INTO year_of_award(reward_year) 
VALUES (1904);


INSERT INTO laureat(laureat_id, category_name, city_of_org, reward_year, birth_date) 
VALUES (160, 'Chemistry', 'Berlin', 1901, TO_DATE('1852-08-30', 'YYYY-MM-DD'));
INSERT INTO Laureat(laureat_id, category_name, city_of_org, reward_year, birth_date) 
VALUES (2, 'Physics', 'Leiden', 1902, TO_DATE('1853-07-18', 'YYYY-MM-DD'));
INSERT INTO Laureat(laureat_id, category_name, city_of_org, reward_year, birth_date) 
VALUES (296, 'Medicine', 'St. Petersburg', 1904, TO_DATE('1849-09-14', 'YYYY-MM-DD'));


INSERT INTO specialist(full_name, laureat_id, city_of_birth, city_of_death) 
VALUES ('Jacobus Henricus vant Hoff1', 160, 'Berlin', 'Berlin');
INSERT INTO specialist(full_name, laureat_id, city_of_birth, city_of_death) 
VALUES ('Hendrik Antoon Lorentz', 2, 'Leiden', 'Leiden');
INSERT INTO specialist(full_name, laureat_id, city_of_birth, city_of_death) 
VALUES ('Ivan Petrovich Pavlov', 296, 'St. Petersburg', 'St. Petersburg');


INSERT INTO speciality(speciality_name) 
VALUES ('Medicine');
INSERT INTO speciality(speciality_name) 
VALUES ('Physics');
INSERT INTO speciality(speciality_name) 
VALUES ('Chemistry');
INSERT INTO speciality(speciality_name) 
VALUES ('Boilogy');


INSERT INTO specialist_fk(full_name, speciality_name) 
VALUES ('Jacobus Henricus vant Hoff1', 'Chemistry');
INSERT INTO specialist_fk(full_name, speciality_name) 
VALUES ('Hendrik Antoon Lorentz', 'Physics');
INSERT INTO specialist_fk(full_name, speciality_name) 
VALUES ('Ivan Petrovich Pavlov', 'Medicine');
INSERT INTO specialist_fk(full_name, speciality_name) 
VALUES ('Ivan Petrovich Pavlov', 'Boilogy');
