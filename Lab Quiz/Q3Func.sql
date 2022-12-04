DELIMITER $$
CREATE FUNCTION getHealthStatus(disease varchar(255))
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
	DECLARE stat varchar(255);
    if (disease!='Nil' and disease!='NIL') THEN
        set stat = 'Fair';
    Else
        set stat='Good';
    END IF;
    return stat;
END; $$
DELIMITER ;

--UPDATE Donor_331 set HealthStatus = 'Good' where d_disease not in('NIL', 'Nil');
--UPDATE Donor_331 set HealthStatus = 'Fair' where d_disease is null;