--users table:

CREATE TABLE `sys`.`users` (
  `userID` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(50) NOT NULL,
  `passwordHash` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `phoneNumber` VARCHAR(20) NOT NULL,
  `dob` DATE NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE,
  UNIQUE INDEX `passwordHash_UNIQUE` (`passwordHash` ASC) VISIBLE,
  UNIQUE INDEX `Userscol_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `phoneNumber_UNIQUE` (`phoneNumber` ASC) VISIBLE);

--category table:

CREATE TABLE `sys`.`categories` (
  `categoryID` INT NOT NULL AUTO_INCREMENT,
  `categoryName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`categoryID`),
  UNIQUE INDEX `categorieID_UNIQUE` (`categoryID` ASC) VISIBLE,
  UNIQUE INDEX `categoryName_UNIQUE` (`categoryName` ASC) VISIBLE);

--sub_categories table:

CREATE TABLE `sys`.`sub_categories` (
  `sub_categoryID` INT NOT NULL AUTO_INCREMENT,
  `sub_categoryName` VARCHAR(45) NOT NULL,
  `categoryID` INT NOT NULL,
  PRIMARY KEY (`sub_categoryID`),
  UNIQUE INDEX `sub_categoryID_UNIQUE` (`sub_categoryID` ASC) VISIBLE,
  UNIQUE INDEX `sub_categoryName_UNIQUE` (`sub_categoryName` ASC) VISIBLE,
  UNIQUE INDEX `categoryID_UNIQUE` (`categoryID` ASC) VISIBLE,
  CONSTRAINT `categoryID`
    FOREIGN KEY (`categoryID`)
    REFERENCES `sys`.`categories` (`categoryID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

--projects table:

CREATE TABLE `sys`.`projects` (
  `projectID` INT NOT NULL AUTO_INCREMENT,
  `projectTitle` VARCHAR(50) NOT NULL,
  `projectDesc` VARCHAR(255) NOT NULL,
  `categoryID` INT NOT NULL,
  `sub_categoryID` INT NOT NULL,
  `userID` INT NOT NULL,
  PRIMARY KEY (`projectID`),
  UNIQUE INDEX `projectID_UNIQUE` (`projectID` ASC) VISIBLE,
  UNIQUE INDEX `categoryID_UNIQUE` (`categoryID` ASC) VISIBLE,
  UNIQUE INDEX `sub_categoryID_UNIQUE` (`sub_categoryID` ASC) VISIBLE,
  UNIQUE INDEX `userID_UNIQUE` (`userID` ASC) VISIBLE,
    FOREIGN KEY (`categoryID`)
    REFERENCES `sys`.`categories` (`categoryID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `sub_categoryID`
    FOREIGN KEY (`sub_categoryID`)
    REFERENCES `sys`.`sub_categories` (`sub_categoryID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `userID`
    FOREIGN KEY (`userID`)
    REFERENCES `sys`.`users` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

--freelance table:

CREATE TABLE `sys`.`freelance` (
  `freelanceID` INT NOT NULL AUTO_INCREMENT,
  `freelanceName` VARCHAR(45) NOT NULL,
  `skills` VARCHAR(45) NOT NULL,
  `userID` INT NOT NULL,
  PRIMARY KEY (`freelanceID`),
  UNIQUE INDEX `freelanceID_UNIQUE` (`freelanceID` ASC) VISIBLE,
  UNIQUE INDEX `freelanceName_UNIQUE` (`freelanceName` ASC) VISIBLE,
  UNIQUE INDEX `userID_UNIQUE` (`userID` ASC) VISIBLE,
  CONSTRAINT `userIDfreelance`
    FOREIGN KEY (`userID`)
    REFERENCES `sys`.`users` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

--offers table:

CREATE TABLE `offers` (
  `offersID` int NOT NULL AUTO_INCREMENT,
  `amount` varchar(45) NOT NULL,
  `delay` datetime NOT NULL,
  `freelanceID` int NOT NULL,
  `projectID` int NOT NULL,
  PRIMARY KEY (`offersID`),
  UNIQUE KEY `offersID_UNIQUE` (`offersID`),
  UNIQUE KEY `freelanceID_UNIQUE` (`freelanceID`),
  UNIQUE KEY `projectID_UNIQUE` (`projectID`),
  CONSTRAINT `freelanceID` FOREIGN KEY (`freelanceID`) REFERENCES `freelance` (`freelanceID`),
  CONSTRAINT `projectID` FOREIGN KEY (`projectID`) REFERENCES `projects` (`projectID`)
);

--testimonials table:

CREATE TABLE `sys`.`testimonials` (
  `tastimonialID` INT NOT NULL AUTO_INCREMENT,
  `comments` VARCHAR(255) NOT NULL,
  `userID` INT NOT NULL,
  PRIMARY KEY (`tastimonialID`),
  UNIQUE INDEX `tastimonialID_UNIQUE` (`tastimonialID` ASC) VISIBLE,
  UNIQUE INDEX `userID_UNIQUE` (`userID` ASC) VISIBLE,
  CONSTRAINT `userIDtestimonials`
    FOREIGN KEY (`userID`)
    REFERENCES `sys`.`users` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE `sys`.`users`
ADD COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN deleted_at TIMESTAMP DEFAULT NULL,
ADD COLUMN edited_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

ALTER TABLE `sys`.`freelance`
ADD COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN deleted_at TIMESTAMP DEFAULT NULL,
ADD COLUMN edited_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

ALTER TABLE `sys`.`offers`
ADD COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN deleted_at TIMESTAMP DEFAULT NULL,
ADD COLUMN edited_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

ALTER TABLE `sys`.`projects`
ADD COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN deleted_at TIMESTAMP DEFAULT NULL,
ADD COLUMN edited_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

ALTER TABLE `sys`.`testimonials`
ADD COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN deleted_at TIMESTAMP DEFAULT NULL,
ADD COLUMN edited_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;




