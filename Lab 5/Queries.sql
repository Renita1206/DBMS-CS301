--Lab 5 - Join Functions
-- Renita Kurian - PES1UG20CS331

-- Question 1 - Update Ticket Price
create view compute_price as
select ticket_331.pnr, ticket_331.trainno, ticket_331.departure, ticket_331.arrival, route_331.distance, fare_table_331.farePerKm
from ticket_331, route_331, fare_table_331 where(ticket_331.trainno = route_331.train_no and
ticket_331.departure = route_331.fromname and ticket_331.arrival = route_331.toname and 
fare_table_331.traintype = ticket_331.traintype and fare_table_331.compartmenttype = ticket_331.compartmenttype);

-- Question 2 - Retrieve the all stations along route of the Trains along with the distance between the stations
select t.train_no, t.t_name, t.t_type, t.destination, t.arrival, r.fromname, r.toname, r.distance from train_331 as t NATURAL JOIN route_331 as r;

-- Question 3 - .Retrieve the Train no of train which is leaving Bengaluru and arriving at Chennai with compartments availability greater than 10 ??
select t.train_no from train_331 as T JOIN compartment_331 as C on t.train_no = c.train_no where t.arrival = 'Chennai' and t.destination = 'Bengaluru' and c.availability>10;

-- Question 4 - Retrieve first and last name of users who have booked a ticket with price greater than 500
-- creating view that shows price for each ticket from compute price
create view user_price as 
    select pnr, distance*farePerKm as price from compute_price;
select * from user_price;
-- Retrieving names 
select p.name from passenger_331 as P JOIN user_price as U on p.pnr = u.pnr where u.price>500;

-- Question 5 - Retrieve first name, last name, DOB and PNR if they've bought ticket for all users
-- users who have bought tickets
select u.userid, u.fname as user_fname, u.lname as user_lname, t.pnr, u.DOB from user_331 as u join ticket_331 as t on u.userid=t.userid;
-- users left join ticket
select u.userid, u.fname, u.lname,  t.pnr, u.DOB from user_331 as u left join ticket_331 as t on u.userid=t.userid where pnr = NULL;
select u.userid, u.fname, u.lname, t.pnr, u.DOB from user_331 as u left join ticket_331 as t on u.userid=t.userid where t.pnr like '%PNR%';

-- Question 6 - Retrieve the first name, last name,of the Users who have not bought a ticket
select u.userid, u.fname, u.lname from user_331 as u left join ticket_331 as t on u.userid=t.userid except 
    (select u.userid, u.fname, u.lname from user_331 as u join ticket_331 as t on u.userid=t.userid);

-- Question 7 -  Retrieve the ticket PNR, Train number, travel date and along with all users first name and last name
select t.pnr, t.trainno, t.travelDate, u.fname, u.lname from ticket_331 as t right join user_331 as u on t.userid=u.userid;

-- Question 8 -  Retrieve the user id if they’ve traveled in a train along with train id and name of all trains
 select  t.trainno, t1.t_Name, t.userid from ticket_331 as t right join train_331 as t1 on t.trainno=t1.train_no;

-- Question 9 - Retrieve the train no and name of trains whose destination is not Mangaluru and distance is not less than 100km and departure time is not 8:30:00 PM
select train_no, t_name from train_331 where train_no in (select t.train_no from train_331 as t join compute_price as c on t.train_no=c.trainno 
where t.destination=c.arrival and t.arrival = c.departure and c.distance>100) 
and destination!='Mangaluru' and train_no not in (select train_no from ticket_331 where departuretime='20:30:00');

-- Question 10 - Retrieve the User ID who has spent more ticket price than the average ticket price
select distinct userID from user_331 NATURAL JOIN ticket_331 where pnr in (select pnr from user_price where price>(select avg(price) from user_price));
