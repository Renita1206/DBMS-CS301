-- Renita Kurian - PES1UG20CS331
-- Lab 7 - Union, Intersection and Minus

--Q1
select UserID,PNR, Fname, Lname from (ticket_331 NATURAL JOIN User_331) where arrival='Chennai' and departure='Bengaluru' and MONTH(TravelDate)=10 and YEAR(TravelDate)=2021
     UNION (select UserID,PNR, Fname, Lname from (ticket_331 NATURAL JOIN User_331) where arrival='Chennai' and departure='Bengaluru' and MONTH(TravelDate)=8 and YEAR(TravelDate)=2022);  


--Q2
select UserID,PNR, Fname, Lname from (ticket_331 NATURAL JOIN User_331) where arrival='Chennai' and departure='Bengaluru' and MONTH(TravelDate)=10 and YEAR(TravelDate)=2021
    INTERSECT
    select UserID,PNR, Fname, Lname from (ticket_331 NATURAL JOIN User_331) where arrival='Chennai' and departure='Bengaluru' and MONTH(TravelDate)=8 and YEAR(TravelDate)=2022;


--Q3
select UserID,PNR, Fname, Lname from (ticket_331 NATURAL JOIN User_331) where arrival='Chennai' and departure='Bengaluru' and MONTH(TravelDate)=8 and YEAR(TravelDate)=2022
     EXCEPT
    (select UserID,PNR, Fname, Lname from (ticket_331 NATURAL JOIN User_331) where arrival='Chennai' and departure='Bengaluru' and MONTH(TravelDate)=10 and YEAR(TravelDate)=2021);

--q4
select u.UserID, U_Type, FName, LName from ticket_344 as t, user_344 as u where t.UserID = u.UserID and t.Departure = 'Bengaluru' and t.Arrival = 'Chennai'
AND EXISTS (select pnr from ticket_344 as ti where t.UserID = ti.UserID and ti.Departure = 'Chennai' and ti.Arrival = 'Bengaluru' and (DATEDIFF(ti.TravelDate,t.TravelDate) BETWEEN 0 and 7));


--Q5
select UserID, U_TYPE, Fname, Lname from (ticket_331 NATURAL JOIN User_331) where arrival='Chennai' and departure='Bengaluru'
    EXCEPT
   select UserID, U_TYPE, Fname, Lname from (ticket_331 NATURAL JOIN User_331) where arrival='Bengaluru' and departure='Chennai';
