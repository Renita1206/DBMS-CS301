DELIMITER $$
CREATE TRIGGER devanahalliPatient
BEFORE insert
ON Patient_331 for each ROW
BEGIN
DECLARE error_msg VARCHAR(255);
SET error_msg = ('Area not servicable');
IF new.locality='Devanahalli' THEN
 SIGNAL SQLSTATE '45000'
 SET MESSAGE_TEXT = error_msg;
END IF;
END $$
DELIMITER ;