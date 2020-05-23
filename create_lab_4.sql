CREATE TABLE birth (
    birth_date DATE NOT NULL
);

ALTER TABLE birth ADD CONSTRAINT birth_pk PRIMARY KEY ( birth_date );

CREATE TABLE category (
    category_name VARCHAR2(50) NOT NULL
);

ALTER TABLE category ADD CONSTRAINT category_pk PRIMARY KEY ( category_name );

CREATE TABLE city (
    city_name     VARCHAR2(50) NOT NULL,
    country_name  VARCHAR2(50) NOT NULL
);

ALTER TABLE city ADD CONSTRAINT city_pk PRIMARY KEY ( city_name );

CREATE TABLE country (
    country_name VARCHAR2(50) NOT NULL
);

ALTER TABLE country ADD CONSTRAINT country_pk PRIMARY KEY ( country_name );

CREATE TABLE laureat (
    laureat_id     NUMBER NOT NULL,
    reward_year    NUMBER,
    category_name  VARCHAR2(50) NOT NULL,
    city_of_org    VARCHAR2(50) NOT NULL
);

ALTER TABLE laureat ADD CONSTRAINT laureat_pk PRIMARY KEY ( laureat_id );

CREATE TABLE specialist (
    full_name           VARCHAR2(50) NOT NULL,
    sex                 VARCHAR2(10),
    laureat_laureat_id  NUMBER NOT NULL,
    city_of_death       VARCHAR2(50) NOT NULL,
    city_of_birth       VARCHAR2(50) NOT NULL,
    birth_date          DATE NOT NULL
);

ALTER TABLE specialist ADD CONSTRAINT specialist_pk PRIMARY KEY ( full_name );

CREATE TABLE specialist_speciality_fk (
    full_name        VARCHAR2(50) NOT NULL,
    speciality_name  VARCHAR2(50) NOT NULL
);

ALTER TABLE specialist_speciality_fk ADD CONSTRAINT specialist_speciality_fk_pk PRIMARY KEY ( full_name,
                                                                                              speciality_name );

CREATE TABLE speciality (
    speciality_name VARCHAR2(50) NOT NULL
);

ALTER TABLE speciality ADD CONSTRAINT speciality_pk PRIMARY KEY ( speciality_name );

ALTER TABLE city
    ADD CONSTRAINT city_country_fk FOREIGN KEY ( country_name )
        REFERENCES country ( country_name );

ALTER TABLE laureat
    ADD CONSTRAINT laureat_category_fk FOREIGN KEY ( category_name )
        REFERENCES category ( category_name );

ALTER TABLE laureat
    ADD CONSTRAINT laureat_city_fk FOREIGN KEY ( city_of_org )
        REFERENCES city ( city_name );

ALTER TABLE specialist
    ADD CONSTRAINT specialist_birth_fk FOREIGN KEY ( birth_date )
        REFERENCES birth ( birth_date );

ALTER TABLE specialist
    ADD CONSTRAINT specialist_city_fk FOREIGN KEY ( city_of_birth )
        REFERENCES city ( city_name );

ALTER TABLE specialist
    ADD CONSTRAINT specialist_city_fkv2 FOREIGN KEY ( city_of_death )
        REFERENCES city ( city_name );

ALTER TABLE specialist_speciality_fk
    ADD CONSTRAINT specialist_fk FOREIGN KEY ( full_name )
        REFERENCES specialist ( full_name );

ALTER TABLE specialist
    ADD CONSTRAINT specialist_laureat_fk FOREIGN KEY ( laureat_laureat_id )
        REFERENCES laureat ( laureat_id );

ALTER TABLE specialist_speciality_fk
    ADD CONSTRAINT speciality_fk FOREIGN KEY ( speciality_name )
        REFERENCES speciality ( speciality_name );
