Place all the php file into C:\xampp\htdocs by creating a folder as per your choice(ex:blob)
executing by running xampp server.
type following url in browser: ( i have created blob folder for all files so using blob after localhost so choose proper folder name.
http://localhost/blob/

Schema for blob example:

create database blob;

create table images(
id int(11) primary key auto_increment,
image longblob,
name text,
type varchar(11));