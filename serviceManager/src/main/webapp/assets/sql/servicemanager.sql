

CREATE TABLE case( 
case_id int NOT NULL AUTO_INCREMENT, 
car_id int, 
workshop_id int,
active boolean, 
FOREIGN KEY(car_id) REFERENCES car(car_id) , 
FOREIGN KEY (workshop_id) REFERENCES workshop(workshop_id), 
PRIMARY KEY (case_id) 
) ;


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






