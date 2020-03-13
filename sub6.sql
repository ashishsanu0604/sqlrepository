create database subm;

create table Orders(OrderID INT NOT NULL,CustomerID INT NOT NULL,OrderDate Date,PRIMARY KEY(OrderID)
FO
);

create table Customer(CustomerID INT NOT NULL,CustomerName VARCHAR(20),ContactName VARCHAR(20),Country VARCHAR(15) );

 insert into Customer values(45,"Frank","Alice","Brazil"); 
 insert into Customer values(12,"Tom","Tam","Laos");
 insert into Customer values(34,"Jill","Jww","USA");
 insert into Customer values(67,"John","Boy","USA");
 insert into Customer values(16,"Fred","Comn","Brazil");
 insert into Customer values(56,"Tim","Democ","Laos");
 insert into Customer values(38,"Hank","Repub","USA");
 insert into Customer values(51,"Bob","fra","Chile");
 insert into Customer values(59,"Gill","joh","Argentina");
insert into Customer values(11,"Ron","col","Argentina");
 insert into Customer values(53,"Marie","cze","USA");


insert into Orders values(1,45,DATE '2019-12-17');
insert into Orders values(6,12,DATE '2019-02-10');
insert into Orders values(9,12,DATE '2019-02-15');
insert into Orders values(19,12,DATE '2019-01-07');
insert into Orders values(9,16,DATE '2019-02-15');
insert into Orders values(8,16,DATE '2019-02-15');
insert into Orders values(2,34,DATE '2017-10-05');
insert into Orders values(5,34,DATE '2019-02-15');
insert into Orders values(12,34,DATE '2017-10-05');
insert into Orders values(17,38,DATE '2017-09-05');
insert into Orders values(25,56,DATE '2016-09-15');
insert into Orders values(29,56,DATE '2016-09-16');
insert into Orders values(31,56,DATE '2016-09-24');
insert into Orders values(32,67,DATE '2016-09-24');
insert into Orders values(34,16,DATE '2016-09-24');

insert into Customer values(59,"Gill","joh","Argentina");
insert into Customer values(11,"Ron","col","Argentina");

#Operations
select C.CustomerName,C.Country,O.OrderID from Customer as C left join Orders as O on O.CustomerID=C.CustomerID; #left join

select * from Customer as C left join Orders as O on O.CustomerID=C.CustomerID union select * from Customer as C right join Orders as O on O.CustomerID=C.CustomerID; #full outer join

select * from Customer as C cross join Orders as O on O.CustomerID=C.CustomerID; #cross join but essentially inner join due to where condition

#with inner join
select C.CustomerID,C.CustomerName,C.Country,Count(OrderID) from Orders as O join Customer as C on C.CustomerID=O.CustomerID group by O.CustomerID;	#count orders of each customer 

select C.CustomerID,C.CustomerName,C.Country,Count(OrderID) from Orders as O join Customer as C on C.CustomerID=O.CustomerID group by O.CustomerID order by count(OrderID) desc; # ordering previous one

 select C.CustomerID,C.CustomerName,C.Country,O.OrderDate,count(C.CustomerID) from Orders as O join Customer as C on C.CustomerID=O.CustomerID group by O.OrderDate order by O.OrderDate;	#getting number of orders made on particular date 


 select avg(custcount),min(custcount),max(custcount),sum(custcount) from (select O.OrderDate,count(C.CustomerID) custcount from Orders as O join Customer as C on C.CustomerID=O.CustomerID group by O.OrderDate order by O.OrderDate) as st1; #average(and the other aggregate function values) no of orders on particular day


 select C1.Country,Count(C1.CustomerID) from Customer as C1 group by C1.Country having count(C1.CustomerID)=(select max(ccountvar) from (select *,count(C.CustomerID) as ccountvar from Customer as C group by C.Country) as st2); #select country with most customers

 select C1.Country,Count(C1.CustomerID) from Customer as C1 group by C1.Country having count(C1.CustomerID)=(select min(ccountvar) from (select *,count(C.CustomerID) as ccountvar from Customer as C group by C.Country) as st2);#similarly for country with minimum no of customers