
INSERT INTO Category(Category_name)
VALUES('Chemistry');
INSERT INTO Category(Category_name)
VALUES('Literature');
INSERT INTO Category(Category_name)
VALUES('Medicine');
INSERT INTO Category(Category_name)
VALUES('Peace');
INSERT INTO Category(Category_name)
VALUES('Physics');


INSERT INTO Country(country_name)
VALUES('Germany');
INSERT INTO Country(country_name)
VALUES('Netherlands');
INSERT INTO Country(country_name)
VALUES('Russia');


INSERT INTO City(city_name, country_name)
VALUES('Berlin', 'Germany');
INSERT INTO City(city_name, country_name)
VALUES('Leiden', 'Netherlands');
INSERT INTO City(city_name, country_name)
VALUES('St. Petersburg', 'Russia');


INSERT INTO Birth(birth_date)
VALUES(TO_Date('1853-08-30', 'YYYY-MM-DD'));
INSERT INTO Birth(birth_date)
VALUES(TO_Date('1853-07-18', 'YYYY-MM-DD'));
INSERT INTO Birth(birth_date)
VALUES(TO_Date('1849-09-14', 'YYYY-MM-DD'));


INSERT INTO Laureat(laureat_id, reward_year, category_name, city_of_org)
VALUES(160, 1901, 'Chemistry', 'Berlin');
INSERT INTO Laureat(laureat_id, reward_year, category_name, city_of_org)
VALUES(2, 1902, 'Physics', 'Leiden');
INSERT INTO Laureat(laureat_id, reward_year, category_name, city_of_org)
VALUES(296, 1904, 'Medicine', 'St. Petersburg');


INSERT INTO Specialist(full_name, sex, laureat_id, city_of_death, city_of_birth, birth_date)
VALUES('Jacobus Henricus vant Hoff1', 'Male', 160, 'Berlin', 'Berlin', TO_Date('1849-09-14', 'YYYY-MM-DD'));
INSERT INTO Specialist(full_name, sex, laureat_id, city_of_death, city_of_birth, birth_date)
VALUES('Hendrik Antoon Lorentz', 'Male', 2, 'Leiden', 'Leiden', TO_Date('1853-07-18', 'YYYY-MM-DD'));
INSERT INTO Specialist(full_name, sex, laureat_id, city_of_death, city_of_birth, birth_date)
VALUES('Ivan Petrovich Pavlov', 'Male', 296, 'St. Petersburg', 'St. Petersburg', TO_Date('1849-09-14', 'YYYY-MM-DD'));


INSERT INTO Speciality(SPECIALITY_NAME)
VALUES ('Chemistry');
INSERT INTO Speciality(SPECIALITY_NAME)
VALUES ('Physics');
INSERT INTO Speciality(SPECIALITY_NAME)
VALUES ('Medicine');
INSERT INTO Speciality(SPECIALITY_NAME)
VALUES ('Biology');


INSERT INTO SPECIALIST_SPECIALITY_FK(FULL_NAME, SPECIALITY_NAME)
VALUES ('Ivan Petrovich Pavlov', 'Medicine');
INSERT INTO SPECIALIST_SPECIALITY_FK(FULL_NAME, SPECIALITY_NAME)
VALUES ('Hendrik Antoon Lorentz', 'Physics');
INSERT INTO SPECIALIST_SPECIALITY_FK(FULL_NAME, SPECIALITY_NAME)
VALUES ('Jacobus Henricus vant Hoff1', 'Chemistry');

