-- Renita Kurian - PES1UG20CS331
-- Lab 9 - Triggers

-- Question 1
-- Write a trigger on insert to compartment table when a new compartment gets added to a train and make sure that
-- total number of compartments available in the train does not exceed more than 4.
DELIMITER $$
CREATE TRIGGER max4compartments
BEFORE insert
ON compartment_331 for each ROW
BEGIN
DECLARE error_msg VARCHAR(255);
declare x int;
SET error_msg = ('Cannot have more than four compartment');
IF (select count(*) from compartment_331 where Train_No = new.Train_No) >= 4 THEN
 SIGNAL SQLSTATE '45000'
 SET MESSAGE_TEXT = error_msg;
END IF;
END $$
DELIMITER ;

insert into compartment_331 values (58450,'S Class',30,3, 'S13');


-- Question 2
-- Create a trigger to add payment information to the backup table when we try to delete some information from the ticket table

-- Create Backup Table
CREATE TABLE PAYMENT_BACKUP_331 ( Transaction_ID varchar(30) PRIMARY KEY, Bank varchar(30), Card_No varchar(16), Price int, PNR varchar(10) NOT NULL);
-- Trigger for backup table
DELIMITER $$
CREATE TRIGGER paymentBackup
BEFORE DELETE
ON ticket_331 FOR EACH ROW
BEGIN
    Insert into PAYMENT_BACKUP_331 select * from payment_info_331 where PNR = old.PNR;
    delete from payment_info_331 where PNR = old.PNR;
    delete from passenger_331 where PNR = old.PNR;
END $$
DELIMITER ;