CREATE SCHEMA IF NOT EXISTS `hr`;

CREATE TABLE IF NOT EXISTS `hr`.`jobs` (
    job_id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    job_title VARCHAR(35) UNIQUE NOT NULL,
    min_salary DECIMAL(8.2),
    max_salary DECIMAL(8.2)
);

CREATE TABLE IF NOT EXISTS `hr`.`regions` (
    region_id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    region_name VARCHAR(25)
);

CREATE TABLE IF NOT EXISTS `hr`.`countries` (
    country_id CHAR(2) NOT NULL PRIMARY KEY,
    country_name VARCHAR(40),
    region_id INT(11) NOT NULL,
    CONSTRAINT FOREIGN KEY (`region_id`) REFERENCES `hr`.`regions` (`region_id`)
);

CREATE TABLE IF NOT EXISTS `hr`.`locations` (
    location_id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    street_address VARCHAR(40),
    postal_code VARCHAR(12),
    city VARCHAR(30) NOT NULL UNIQUE,
    state_province VARCHAR(25),
    country_id CHAR(2) NOT NULL,
    CONSTRAINT `countryidconstraint` FOREIGN KEY (`country_id`) REFERENCES `hr`.`countries` (`country_id`) ON UPDATE NO ACTION ON DELETE NO ACTION,
    UNIQUE INDEX `country_id_UNIQUE` (`country_id` ASC) VISIBLE,
    INDEX `country_id_INDEX` (`country_id` ASC) VISIBLE
);

CREATE TABLE IF NOT EXISTS `hr`.`departments` (
    department_id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(30) NOT NULL UNIQUE,
    location_id INT(11),
    UNIQUE KEY (`department_name`),
    CONSTRAINT `location_id` FOREIGN KEY (`location_id`) REFERENCES `hr`.`locations` (`location_id`)
);

CREATE TABLE IF NOT EXISTS `hr`.`employees` (
    employee_id INT(11) NOT NULL PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(25) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone_number VARCHAR(20),
    hire_date DATE NOT NULL UNIQUE,
    job_id INT(11) NOT NULL,
    salary DECIMAL (8.2) NOT NULL UNIQUE,
    manager_id INT(11),
    department_id INT(11),
    CONSTRAINT FOREIGN KEY (`job_id`) REFERENCES `hr`.`jobs` (`job_id`),
    CONSTRAINT FOREIGN KEY (`department_id`) REFERENCES `hr`.`departments` (`department_id`),
    CONSTRAINT FOREIGN KEY (`manager_id`) REFERENCES `hr`.`employees` (`employee_id`)
);

CREATE TABLE IF NOT EXISTS `hr`.`dependents` (
    dependent_id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR(50) NOT NULL UNIQUE,
    last_name VARCHAR(50) NOT NULL UNIQUE,
    relationship VARCHAR(25) NOT NULL UNIQUE,
    employee_id INT(11) NOT NULL,
    CONSTRAINT FOREIGN KEY (`employee_id`) REFERENCES `hr`.`employees` (`employee_id`)
);