
--Ques 1- Who is the senior most employee based on job title 
select * from employee
order by levels desc
limit 1

--second method to find the same result 
select * from employee
where title = 'Senior General Manager'

--Third method to find the same result 
select * from employee
where levels = 'L7'

--Ques 2- Which countries have most invoices 
select  Count(*) as c, billing_country from invoice
group by billing_country
order by c desc
--or 
select  * from invoice
order by total desc

--Ques 3- What are top three values of total vlaues
select  total from invoice
order by total desc 
LIMIT 3

-- Ques 4 - Which city has the best customers ? we would like to throw a promotion music festival 
--in the city we made the most money write a query that return one city that has the highest sum of invoice totals Return both 
--city name and sum of all invoice totals 

select  sum(total) as invoice_total , billing_city from invoice
group by billing_city
order by invoice_total desc 

--Ques 5- Who is the best customer ? the customer who has spent the most money will be declared the best customer write a query 
--that returns the person who has spent the most money 


select c.first_name , c.last_name,sum(i.total) as t 
from customer as c 
join invoice as i 
on c.customer_id = i.invoice_id 
group by c.customer_id , c.first_name , c.last_name
order by t desc 



-- both the queries are same 

select customer.customer_id,customer.first_name,customer.last_name,SUM(invoice.total) as total
from customer
JOIN invoice ON customer.customer_id = invoice.customer_id
group by customer.customer_id , customer.first_name,customer.last_name
order by total desc


--Ques 6- Write a query to return the email ,first name , last name , and genere off all rock music listerners 
--Write a query the return your list ordered alphabetically by email starting with A
select * from invoice 
select * from invoice_line
select * from track
select * from genere


select Distinct c.email,c.first_name,c.last_name
from customer as c 
join invoice  as i 
on c.customer_id = i.customer_id
join invoice_line as il
on i.invoice_id = il.invoice_id
where track_id IN (
	Select track_id from track
	Join genere On track.genre_id = genere.genre_id
	where genere.name Like 'Rock'
)
Order By email


--Ques 7 - Lets invite the artists who have written the most rock music in our dataset write a query that returns the artist name
---and total track count of the top rock bands 