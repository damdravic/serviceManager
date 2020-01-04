


CREATE TABLE service_users(
user_id int NOT NULL AUTO_INCREMENT,
user_first_name varchar(20) NOT NULL,
user_last_name varchar(20) NOT NULL,
user_email varchar(40) NOT NULL,
user_password varchar(30) NOT NULL,
user_key_secure varchar(10) NOT NULL,
user_role varchar(10)NOT NULL,
user_active boolean NOT NULL,
PRIMARY KEY(user_id)
);

CREATE TABLE service_case(
case_id int NOT NULL AUTO_INCREMENT,
case_car_id int NOT NULL,
case_workshop_id int,
case_active boolean,
case_insurer_id int,
case_work_order int,
case_entry_date date,
FOREIGN KEY(case_car_id) REFERENCES car(car_id),
FOREIGN KEY(case_workshop_id) REFERENCES workshop (workshop_id),
FOREIGN KEY(case_insurer_id) REFERENCES insurers(insurer_id),
PRIMARY KEY(case_id)
);


CREATE TABLE insurers(
insurer_id int NOT NULL AUTO_INCREMENT,
insurer_name varchar(20),
insurer_active boolean,
PRIMARY KEY(insurer_id)
);

CREATE TABLE car_brand(
car_brand_id int NOT NULL AUTO_INCREMENT,
car_brand_name varchar(20),
car_brand_active boolean,
PRIMARY KEY(car_brand_id)
);


CREATE TABLE car_model(
car_model_id int NOT NULL AUTO_INCREMENT,
car_model_name varchar(20);
car_model_active boolean,
car_model_brand int,
PRIMARY KEY(car_model_id),
FOREIGN KEY(car_model_brand) REFERENCES car_brand(car_brand_id)
);

CREATE TABLE car (
  car_id int(11) NOT NULL AUTO_INCREMENT,
  licence_plate varchar(10) NOT NULL,
  brand varchar(10) DEFAULT NULL,
  model  varchar(10) DEFAULT NULL,
  owner varchar(20) DEFAULT NULL,
  active boolean NOT NULL
);



