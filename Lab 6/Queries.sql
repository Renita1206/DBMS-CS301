--Lab 6 - Aggregate Functions
-- Renita Kurian - PES1UG20CS331

-- Question 1 - Find the average distance between subsequent stations for every train
select train_no, avg(distance) from route_331 group by train_no; 

-- Question 2 - Find the average distance between subsequent stations for every train and display them in descending order of distance
select train_no, avg(distance) as dist from route_331 group by train_no order by dist desc;        

-- Question 3 - Display the list of train numbers and the total distance travelled by each in descending order
--              of the distance travelled
select train_no, sum(distance) as total_distance from route_331 group by train_no order by total_distance desc; 

-- Question 4 - List those trains that have maximum and minimum number compartments and also display number of compartments they have
-- max
select train_no, count(*) from compartment_331 group by train_no order by count(*) desc limit 1; 
-- min
select train_no, count(*) from compartment_331 group by train_no order by count(*) limit 1; 

-- Question 5 - Display the number of phone numbers corresponding to the user_id(s) ADM_001, USR_006, USR_10
select userID, count_no from (select userID, count(phoneNo) as count_no from Phone_331 group by userID) as PhoneCount 
    where PhoneCount.userID in ('ADM_001', 'USR_006', 'USR_010');

-- Question 6 - Find the average fare per km for each train type specified and display the train type and 
--              corresponding average fare per km as ‘Avg_Fare’ in decreasing order of Avg_Fare
select trainType, avg(farePerKm) as avg_fare from fare_table_331 group by trainType;

-- Question 7 - Retrieve all details of the oldest passenger
select * from passenger_331 order by age desc limit 1;

-- Question 8 - Count the number of passengers whose name consists of ‘Ullal’
select * from passenger_331 where name like '%ULLAL%';