/*login table*/
CREATE SCHEMA `regalapp` ;
use regalapp;
select * from login;
INSERT INTO `regalapp`.`login` (`loginid`, `username`, `password`) VALUES ('1', 'sanika', 'sanika@123');
INSERT INTO `regalapp`.`login` (`username`, `password`) VALUES ('tajas', 'tejas@123');

/*main info table*/
CREATE TABLE `regalapp`.`new_student` (
  `stdid` INT NOT NULL AUTO_INCREMENT,
  `fname` VARCHAR(20) NOT NULL,
  `lname` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `birthdate` DATE NOT NULL,
  `localaddress` VARCHAR(45) NOT NULL,
  `permanentaddress` VARCHAR(45) NOT NULL,
  `gender` CHAR(1) NOT NULL,
  PRIMARY KEY (`stdid`));
  select * from new_student;
  
  /*hometown table*/
  CREATE TABLE `regalapp`.`hometown_table` (
  `hometownid` INT NOT NULL AUTO_INCREMENT,
  `hometownname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`hometownid`));
  select * from hometown_table;
  ALTER TABLE `regalapp`.`new_student` 
ADD CONSTRAINT `hometownid`
  FOREIGN KEY (`stdid`)
  REFERENCES `regalapp`.`hometown_table` (`hometownid`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;
  ALTER TABLE `regalapp`.`new_student` 
DROP FOREIGN KEY `hometownid`;
alter table regalapp.new_student
drop column hometownid;
describe new_student;
  alter table new_student add column hometownid int;
  alter table new_student add foreign key (hometownid) references hometown_table(hometownid);
  
  /*collage table*/
CREATE TABLE `regalapp`.`collage` (
  `collageid` INT NOT NULL AUTO_INCREMENT,
  `collagename` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`collageid`));
  alter table new_student add column collageid int;
  alter table new_student add foreign key (collageid) references collage(collageid);
  desc collage;
  
  /*course table*/
  create table course (
  courseid int not null auto_increment,
  C int ,
  CPP int,
  DSA int,
  ADS int,
  JAVA int,
  primary key(courseid));
  select * from course;
  describe course;
  alter table course add column stdid int ;
  alter table course add foreign key (stdid) references new_student(stdid);
  alter table course  drop primary key ;