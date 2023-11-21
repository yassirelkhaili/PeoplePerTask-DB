-- Schema/DB:

CREATE SCHEMA `sys3` ;

-- users table:

CREATE TABLE `sys3`.`users` (
  `userID` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(50) NOT NULL,
  `passwordHash` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `phoneNumber` VARCHAR(20) NOT NULL,
  `dob` DATE NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP DEFAULT NULL,
  `edited_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`userID`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE,
  UNIQUE INDEX `passwordHash_UNIQUE` (`passwordHash` ASC) VISIBLE,
  UNIQUE INDEX `Userscol_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `phoneNumber_UNIQUE` (`phoneNumber` ASC) VISIBLE);

-- category table:

CREATE TABLE `sys3`.`categories` (
  `categoryID` INT NOT NULL AUTO_INCREMENT,
  `categoryName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`categoryID`),
  UNIQUE INDEX `categorieID_UNIQUE` (`categoryID` ASC) VISIBLE,
  UNIQUE INDEX `categoryName_UNIQUE` (`categoryName` ASC) VISIBLE);

-- sub_categories table:

CREATE TABLE `sys3`.`sub_categories` (
  `sub_categoryID` INT NOT NULL AUTO_INCREMENT,
  `sub_categoryName` VARCHAR(45) NOT NULL,
  `categoryID` INT NOT NULL,
  PRIMARY KEY (`sub_categoryID`),
  UNIQUE INDEX `sub_categoryID_UNIQUE` (`sub_categoryID` ASC) VISIBLE,
  UNIQUE INDEX `sub_categoryName_UNIQUE` (`sub_categoryName` ASC) VISIBLE,
  INDEX `categoryID_INDEX` (`categoryID` ASC) VISIBLE,
  CONSTRAINT `categoryID`
    FOREIGN KEY (`categoryID`)
    REFERENCES `sys3`.`categories` (`categoryID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- projects table:

CREATE TABLE `sys3`.`projects` (
  `projectID` INT NOT NULL AUTO_INCREMENT,
  `projectTitle` VARCHAR(50) NOT NULL,
  `projectDesc` VARCHAR(255) NOT NULL,
  `categoryID` INT NOT NULL,
  `sub_categoryID` INT NOT NULL,
  `userID` INT NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP DEFAULT NULL,
  `edited_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`projectID`),
  UNIQUE INDEX `projectID_UNIQUE` (`projectID` ASC) VISIBLE,
  INDEX `categoryID_INDEX` (`categoryID` ASC) VISIBLE,
  INDEX `sub_categoryID_INDEX` (`sub_categoryID` ASC) VISIBLE,
  UNIQUE INDEX `userID_UNIQUE` (`userID` ASC) VISIBLE,
    FOREIGN KEY (`categoryID`)
    REFERENCES `sys3`.`categories` (`categoryID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `sub_categoryID`
    FOREIGN KEY (`sub_categoryID`)
    REFERENCES `sys3`.`sub_categories` (`sub_categoryID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `userID`
    FOREIGN KEY (`userID`)
    REFERENCES `sys3`.`users` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- freelance table:

CREATE TABLE `sys3`.`freelance` (
  `freelanceID` INT NOT NULL AUTO_INCREMENT,
  `freelanceName` VARCHAR(45) NOT NULL,
  `skills` VARCHAR(45) NOT NULL,
  `userID` INT NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP DEFAULT NULL,
  `edited_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`freelanceID`),
  UNIQUE INDEX `freelanceID_UNIQUE` (`freelanceID` ASC) VISIBLE,
  UNIQUE INDEX `freelanceName_UNIQUE` (`freelanceName` ASC) VISIBLE,
  UNIQUE INDEX `userID_UNIQUE` (`userID` ASC) VISIBLE,
  CONSTRAINT `userIDfreelance`
    FOREIGN KEY (`userID`)
    REFERENCES `sys3`.`users` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- offers table:

CREATE TABLE `sys3`.`offers` (
  `offersID` int NOT NULL AUTO_INCREMENT,
  `amount` float NOT NULL,
  `delay` datetime NOT NULL,
  `freelanceID` int NOT NULL,
  `projectID` int NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP DEFAULT NULL,
  `edited_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`offersID`),
  UNIQUE KEY `offersID_UNIQUE` (`offersID`),
  UNIQUE KEY `freelanceID_UNIQUE` (`freelanceID`),
  UNIQUE KEY `projectID_UNIQUE` (`projectID`),
  CONSTRAINT `freelanceID` FOREIGN KEY (`freelanceID`) REFERENCES `freelance` (`freelanceID`),
  CONSTRAINT `projectID` FOREIGN KEY (`projectID`) REFERENCES `projects` (`projectID`)
);

-- testimonials table:

CREATE TABLE `sys3`.`testimonials` (
  `tastimonialID` INT NOT NULL AUTO_INCREMENT,
  `comments` VARCHAR(255) NOT NULL,
  `userID` INT NOT NULL,
  PRIMARY KEY (`tastimonialID`),
  UNIQUE INDEX `tastimonialID_UNIQUE` (`tastimonialID` ASC) VISIBLE,
  UNIQUE INDEX `userID_UNIQUE` (`userID` ASC) VISIBLE,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP DEFAULT NULL,
  `edited_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT `userIDtestimonials`
    FOREIGN KEY (`userID`)
    REFERENCES `sys3`.`users` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

INSERT INTO `sys3`.`users` (username, passwordHash, email, phoneNumber, dob, city)
VALUES
    ('JohnDoe', 'hashed_password_1', 'john.doe@email.com', '1234567890', '1990-01-15', 'New York'),
    ('JaneSmith', 'hashed_password_2', 'jane.smith@email.com', '9876543210', '1985-05-20', 'Los Angeles'),
    ('AliceJones', 'hashed_password_3', 'alice.jones@email.com', '5551234567', '1992-09-08', 'Chicago'),
    ('BobMiller', 'hashed_password_4', 'bob.miller@email.com', '9998887777', '1988-03-25', 'Houston'),
    ('EvaWilliams', 'hashed_password_5', 'eva.williams@email.com', '4445556666', '1995-11-12', 'Miami'),
    ('CharlieBrown', 'hashed_password_6', 'charlie.brown@email.com', '1239874560', '1982-07-30', 'San Francisco'),
    ('GraceTaylor', 'hashed_password_7', 'grace.taylor@email.com', '7896541230', '1993-04-18', 'Seattle'),
    ('DavidClark', 'hashed_password_8', 'david.clark@email.com', '3216549870', '1987-12-05', 'Denver'),
    ('SophieBaker', 'hashed_password_9', 'sophie.baker@email.com', '4567890123', '1998-02-22', 'Boston'),
    ('RyanCarter', 'hashed_password_10', 'ryan.carter@email.com', '9870123456', '1984-06-10', 'Atlanta'),
    ('OliviaHill', 'hashed_password_11', 'olivia.hill@email.com', '6547890123', '1991-08-28', 'Phoenix'),
    ('WilliamWard', 'hashed_password_12', 'william.ward@email.com', '2345678901', '1989-10-15', 'Dallas'),
    ('EmmaFisher', 'hashed_password_13', 'emma.fisher@email.com', '8765432109', '1997-01-03', 'Detroit'),
    ('MichaelWright', 'hashed_password_14', 'michael.wright@email.com', '1357924680', '1986-09-20', 'Philadelphia'),
    ('AvaMartin', 'hashed_password_15', 'ava.martin@email.com', '6789012345', '1994-07-07', 'Minneapolis');

    INSERT INTO `sys3`.`testimonials` (comments, userID)
VALUES
    ('Great user!', 1),
    ('Amazing person to work with!', 2),
    ('Very satisfied with the service.', 3),
    ('Always delivers exceptional work.', 4),
    ('Pleasure to have as a user.', 5),
    ('Consistently exceeds expectations.', 6),
    ('Highly recommend working with.', 7),
    ('Great communication and collaboration.', 8),
    ('A valuable member of our community.', 9),
    ('Reliable and dedicated.', 10),
    ('Exceptional skills and professionalism.', 11),
    ('Always completes tasks on time.', 12),
    ('Very knowledgeable and helpful.', 13),
    ('Consistently delivers high-quality work.', 14),
    ('A pleasure to work with.', 15);

    INSERT INTO `sys3`.`freelance` (freelanceName, skills, userID)
VALUES
    ('Freelancer 4d', 'Mobile App Development', 4),
    ('Freelancer 5', 'Content Writing', 5),
    ('Freelancer 6', 'SEO Optimization', 6),
    ('Freelancer 7', 'Data Entry', 7),
    ('Freelancer 8', 'Video Editing', 8),
    ('Freelancer 9', 'UI/UX Design', 9),
    ('Freelancer 10', 'Social Media Management', 10),
    ('Freelancer 11', 'Photography', 11),
    ('Freelancer 12', 'Illustration', 12),
    ('Freelancer 13', 'Copywriting', 13),
    ('Freelancer 14', 'E-commerce Development', 14),
    ('Freelancer 15', 'Project Management', 15);

    INSERT INTO `sys3`.`categories` (categoryName)
VALUES
    ('Category 1'),
    ('Category 2'),
    ('Category 3'),
    ('Category 4'),
    ('Category 5'),
    ('Category 6'),
    ('Category 7'),
    ('Category 8'),
    ('Category 9'),
    ('Category 10'),
    ('Category 11'),
    ('Category 12'),
    ('Category 13'),
    ('Category 14'),
    ('Category 15');

INSERT INTO `sys3`.`sub_categories` (sub_categoryName, categoryID)
VALUES
    ('SubCategory 1', 1),
    ('SubCategory 2', 1),
    ('SubCategory 3', 2),
    ('SubCategory 4', 2),
    ('SubCategory 5', 3),
    ('SubCategory 6', 3),
    ('SubCategory 7', 4),
    ('SubCategory 8', 4),
    ('SubCategory 9', 5),
    ('SubCategory 10', 5),
    ('SubCategory 11', 6),
    ('SubCategory 12', 6),
    ('SubCategory 13', 7),
    ('SubCategory 14', 7),
    ('SubCategory 15', 8),
    ('SubCategory 16', 8),
    ('SubCategory 17', 9),
    ('SubCategory 18', 9),
    ('SubCategory 19', 10),
    ('SubCategory 20', 10);

INSERT INTO `sys3`.`projects` (projectTitle, projectDesc, categoryID, sub_categoryID, userID) 
VALUES
    ('Project 1', 'Description for Project 1', 1, 1, 1),
    ('Project 2', 'Description for Project 2', 2, 1, 2),
    ('Project 3', 'Description for Project 3', 3, 2, 3),
    ('Project 4', 'Description for Project 4', 1, 2, 4),
    ('Project 5', 'Description for Project 5', 2, 1, 5),
    ('Project 6', 'Description for Project 6', 3, 2, 6),
    ('Project 7', 'Description for Project 7', 1, 1, 7),
    ('Project 8', 'Description for Project 8', 2, 2, 8),
    ('Project 9', 'Description for Project 9', 3, 1, 9),
    ('Project 10', 'Description for Project 10', 1, 2, 10),
    ('Project 11', 'Description for Project 11', 2, 1, 11),
    ('Project 12', 'Description for Project 12', 3, 2, 12),
    ('Project 13', 'Description for Project 13', 1, 1, 13),
    ('Project 14', 'Description for Project 14', 2, 2, 14),
    ('Project 15', 'Description for Project 15', 3, 1, 15);

INSERT INTO `sys3`.`offers` (amount, delay, freelanceID, projectID)
VALUES
    ('1000', '2023-12-01 12:00:00', 1, 2),
    ('1500', '2023-12-05 15:30:00', 2, 6),
    ('800', '2023-12-10 09:45:00', 3, 7),
    ('1200', '2023-12-15 18:20:00', 4, 8),
    ('2000', '2023-12-20 14:10:00', 5, 9),
    ('900', '2023-12-25 10:00:00', 8, 10),
    ('1800', '2023-12-30 16:45:00', 9, 11),
    ('600', '2024-01-05 11:30:00', 10, 12),
    ('1300', '2024-01-10 20:15:00', 11, 13),
    ('1700', '2024-01-15 13:40:00', 12, 14);