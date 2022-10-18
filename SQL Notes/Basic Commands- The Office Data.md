CREATE TABLE employee (
  emp_id INT PRIMARY KEY,
  first_name VARCHAR(40),
  last_name VARCHAR(40),
  birth_day DATE,
  gender VARCHAR(1),
  salary INT,
  super_id INT,
  branch_id INT
);

CREATE TABLE branch (
  branch_id INT PRIMARY KEY,
  branch_name VARCHAR(40),
  mgr_id INT,
  mgr_start_date DATE,
  FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
);

ALTER TABLE employee
ADD FOREIGN KEY(branch_id)
REFERENCES branch(branch_id)
ON DELETE SET NULL;

ALTER TABLE employee
ADD FOREIGN KEY(super_id)
REFERENCES employee(emp_id)
ON DELETE SET NULL;

CREATE TABLE client (
  client_id INT PRIMARY KEY,
  client_name VARCHAR(40),
  branch_id INT,
  FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);

CREATE TABLE works_with (
  emp_id INT,
  client_id INT,
  total_sales INT,
  PRIMARY KEY(emp_id, client_id),
  FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
  FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
);

CREATE TABLE branch_supplier (
  branch_id INT,
  supplier_name VARCHAR(40),
  supply_type VARCHAR(40),
  PRIMARY KEY(branch_id, supplier_name),
  FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);


--------------------------------------------------------------------------

-- Corporate
INSERT INTO employee VALUES(100, 'David', 'Wallace', '1967-11-17', 'M', 250000, NULL, NULL);

INSERT INTO branch VALUES(1, 'Corporate', 100, '2006-02-09');

UPDATE employee
SET branch_id = 1
WHERE emp_id = 100;

INSERT INTO employee VALUES(101, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 100, 1);

-- Scranton
INSERT INTO employee VALUES(102, 'Michael', 'Scott', '1964-03-15', 'M', 75000, 100, NULL);

INSERT INTO branch VALUES(2, 'Scranton', 102, '1992-04-06');

UPDATE employee
SET branch_id = 2
WHERE emp_id = 102;

INSERT INTO employee VALUES(103, 'Angela', 'Martin', '1971-06-25', 'F', 63000, 102, 2);
INSERT INTO employee VALUES(104, 'Kelly', 'Kapoor', '1980-02-05', 'F', 55000, 102, 2);
INSERT INTO employee VALUES(105, 'Stanley', 'Hudson', '1958-02-19', 'M', 69000, 102, 2);

-- Stamford
INSERT INTO employee VALUES(106, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 100, NULL);

INSERT INTO branch VALUES(3, 'Stamford', 106, '1998-02-13');

UPDATE employee
SET branch_id = 3
WHERE emp_id = 106;

INSERT INTO employee VALUES(107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 106, 3);
INSERT INTO employee VALUES(108, 'Jim', 'Halpert', '1978-10-01', 'M', 71000, 106, 3);


-- BRANCH SUPPLIER
INSERT INTO branch_supplier VALUES(2, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Patriot Paper', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'J.T. Forms & Labels', 'Custom Forms');
INSERT INTO branch_supplier VALUES(3, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(3, 'Stamford Labels', 'Custom Forms');

-- CLIENT
INSERT INTO client VALUES(400, 'Dunmore Highschool', 2);
INSERT INTO client VALUES(401, 'Lackawana Country', 2);
INSERT INTO client VALUES(402, 'FedEx', 3);
INSERT INTO client VALUES(403, 'John Daly Law, LLC', 3);
INSERT INTO client VALUES(404, 'Scranton Whitepages', 2);
INSERT INTO client VALUES(405, 'Times Newspaper', 3);
INSERT INTO client VALUES(406, 'FedEx', 2);

-- WORKS_WITH
INSERT INTO works_with VALUES(105, 400, 55000);
INSERT INTO works_with VALUES(102, 401, 267000);
INSERT INTO works_with VALUES(108, 402, 22500);
INSERT INTO works_with VALUES(107, 403, 5000);
INSERT INTO works_with VALUES(108, 403, 12000);
INSERT INTO works_with VALUES(105, 404, 33000);
INSERT INTO works_with VALUES(107, 405, 26000);
INSERT INTO works_with VALUES(102, 406, 15000);
INSERT INTO works_with VALUES(105, 406, 130000);

--------------------------------------------------------------------------


- Find all employees
 ![image](https://user-images.githubusercontent.com/66276711/196480829-0469eef4-8d6f-4988-8d59-ed96af282878.png)


- Find all clients
 ![image](https://user-images.githubusercontent.com/66276711/196480882-5b59fa20-5cf9-4294-8b1f-b5785f943e23.png)  
 
- Find all employees ordered by salary
 ![image](https://user-images.githubusercontent.com/66276711/196480943-1770c880-b8d9-491c-b798-9a46392eca8a.png)


- Find all employees ordered by gender then name
 ![image](https://user-images.githubusercontent.com/66276711/196480988-d97fb44c-95b6-4a96-9878-25ac62e6e4fa.png)



- Find the first 5 employees in the table
 ![image](https://user-images.githubusercontent.com/66276711/196481024-c7312f1e-9173-437e-bf32-69c35f354489.png)



- Find the first and last names of all employees
 ![image](https://user-images.githubusercontent.com/66276711/196481077-ab8c130b-8881-4f40-91ee-5fd8bd6c7ef2.png)


- Find the firstname and surnames names of all Employees
 ![image](https://user-images.githubusercontent.com/66276711/196481117-bfea5dc9-b81f-4ad4-bd89-362b0ee4f1dc.png)



- Find out all the different genders
 ![image](https://user-images.githubusercontent.com/66276711/196481188-78638ded-52f3-4297-8bf5-8b3f9096a445.png)



- Find all male employees
 ![image](https://user-images.githubusercontent.com/66276711/196481242-c9b89fb2-7a91-4f0b-87dd-6094b6dd4a67.png)



- Find all employees at branch 2 
![image](https://user-images.githubusercontent.com/66276711/196481210-ead8dcc2-3f95-403a-b6d9-c1d2bca85c88.png)


- Find all employee's id's and names who were born after 1969
 ![image](https://user-images.githubusercontent.com/66276711/196481283-50f7d330-9805-4d45-8e51-5e5f0b04b5a0.png)



- Find all female employees at branch 2
 ![image](https://user-images.githubusercontent.com/66276711/196481325-eb36d5d8-e06a-4f29-8e70-42efa37148fe.png)



- Find all employees who are female & born after 1969 or who make over 80000
![image](https://user-images.githubusercontent.com/66276711/196481363-c3bde705-c0e3-4423-9056-81a1b9bf2f9b.png)
 


- Find all employees born between 1970 and 1975
 ![image](https://user-images.githubusercontent.com/66276711/196481392-abd06e7b-64ae-461d-9f8d-3ac9bc20e344.png)



- Find all employees named Jim, Michael, Johnny or David
 ![image](https://user-images.githubusercontent.com/66276711/196481435-43355f31-534a-4ea1-aea6-7e52b537707e.png)



- Find the number of employees
 ![image](https://user-images.githubusercontent.com/66276711/196481461-d9e2ff53-872b-45ed-a4c1-27b04472271b.png)



- Find the average of all employee's salaries
 ![image](https://user-images.githubusercontent.com/66276711/196481505-548e7566-3711-4527-b715-7a7bac21b534.png)



- Find the sum of all employee's salaries
 ![image](https://user-images.githubusercontent.com/66276711/196481546-4a2b1af5-0397-435e-a1e3-655d87f06a9c.png)



- Find out how many males and females there are
 ![image](https://user-images.githubusercontent.com/66276711/196481593-b361566e-d69b-4fc7-b9be-b77d73ecefe3.png)



- Find the total sales of each salesman
 ![image](https://user-images.githubusercontent.com/66276711/196481640-4851ad70-6e71-4c40-b27c-2d913f1ec851.png)



- Find the total amount of money spent by each client
![image](https://user-images.githubusercontent.com/66276711/196481681-1964017a-4c79-4c04-8040-175966fc570f.png)
 


- Client’s type ==LLC
 ![image](https://user-images.githubusercontent.com/66276711/196481720-398dcebe-a904-4a58-877b-66f57910c107.png)


- Branch suppliers in Label business
 ![image](https://user-images.githubusercontent.com/66276711/196481801-8d950799-c8b1-4ec5-9186-d96909f5b552.png)


-	Employees born on 10th day of the month
 ![image](https://user-images.githubusercontent.com/66276711/196481844-f38b9bff-ce7f-4271-8e61-f75e897b6c59.png)



-	Clients who are schools
![image](https://user-images.githubusercontent.com/66276711/196481894-6e005099-b2ca-486f-91bf-de7c1ef8b07c.png)


- List of branch and employee names
![image](https://user-images.githubusercontent.com/66276711/196482047-e9de8609-dcaa-4a3b-867a-f243a54a31a5.png)


- List of client names and branch suppliers
![image](https://user-images.githubusercontent.com/66276711/196482178-653ebbef-1e70-416d-9aeb-6323befd0095.png)

-	Branch and manager name
 ![image](https://user-images.githubusercontent.com/66276711/196483127-f671441e-6ff9-425f-9756-2697ba9645a6.png)


- Right join 
![image](https://user-images.githubusercontent.com/66276711/196483159-0efb061a-b578-459f-b53c-d46da030d190.png)


-	Nested Join
![image](https://user-images.githubusercontent.com/66276711/196483181-3d735b72-3682-4ed9-a465-a382e80c1047.png)


- Find all clients handled by the branch that Michael scott manages
![image](https://user-images.githubusercontent.com/66276711/196483233-6c4c7667-7c48-4f2e-af1f-c5043b3eb461.png)
![image](https://user-images.githubusercontent.com/66276711/196483435-cd8b9320-844e-4897-9c14-37ffd2947510.png)


-	Find the names of employees who work with clients handled by Scranton branch
![image](https://user-images.githubusercontent.com/66276711/196483468-1da4a1c3-919f-432c-a9b4-14c86365aaf9.png)


-	Names of all clients who have spent more than 100,000 dollars
 ![image](https://user-images.githubusercontent.com/66276711/196483530-92e9e1d0-863c-46d5-8acc-c6a3c4614598.png)


-	Create new table with all employees from branch 3
![image](https://user-images.githubusercontent.com/66276711/196483571-5666ef57-adb7-4aa0-adb2-68feff04306f.png)



- Increase salary of employees of branch by 20%
![image](https://user-images.githubusercontent.com/66276711/196483596-92e7693a-5a73-43d3-a71a-58001102e126.png)


- Employees with no supervisor
![image](https://user-images.githubusercontent.com/66276711/196483633-b264b935-c0f1-4a7b-b488-dea2291f5c48.png)


- Create user   
    ->create user 'Renita'@'localhost' identified by '1206';

- Grant all privileges to user – Renita
 ![image](https://user-images.githubusercontent.com/66276711/196483669-947ba9bb-a1fd-4b61-a60b-aaa3409e8b21.png)


- Grant all privileges for a specific table in a database
![image](https://user-images.githubusercontent.com/66276711/196483702-9f80bf22-6588-49e8-893b-56ca84780109.png)


- Grant all privileges for a specific database  
    ->grant select on office.* to 'username'@'localhost' ;


- Revoke
![image](https://user-images.githubusercontent.com/66276711/196483791-76d78126-84ed-4410-bae5-1e9c14c316ea.png)


- View -> to store queries
    Create a view to find total sales of each salesman
 ![image](https://user-images.githubusercontent.com/66276711/196483833-636fef29-1d70-402d-9629-dac4344d3f49.png)


- Triggers
![image](https://user-images.githubusercontent.com/66276711/196483882-18bfc5c7-46c2-493d-b109-a8d387b177b6.png)


- Cursor
 ![image](https://user-images.githubusercontent.com/66276711/196483899-ccc1db1d-8abd-4c0e-8a40-a1558afbb14a.png)




 




