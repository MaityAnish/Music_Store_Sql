/*Question Set 1 - Easy*/
---select * from album
	select * from artist
	select * from customer
	  ---select * from employee
	  ---  select * from genre
       select * from invoice
		   select * from invoice_line
---1. Who is the senior most employee based on job title?
select first_name,last_name 
from employee 
order by levels desc
limit 1
---Ans: Mohan Mohan
---2. Which countries have the most Invoices?
select count(*) as c, billing_country
from invoice
group by billing_country
order by c desc
limit 1
---Ans:USA
---3What are top 3 values of total invoice?
select total 
from invoice
order by total desc
limit 3
---Ans:23.759999999999998
---    19.8
---    19.8
/*4 Which city has the best customers? We would like to throw a promotional Music
Festival in the city we made the most money. Write a query that returns one city that
has the highest sum of invoice totals. Return both the city name & sum of all invoice
totals*/
		   
 select billing_city,sum(total) as invoicetotal
from invoice 
group by billing_city
order by invoicetotal desc
limit 1
---Ans:"Prague"	273.24000000000007

/*Who is the best customer? The customer who has spent the most money will be
declared the best customer. Write a query that returns the person who has spent the
most money*/

select c.first_name,c.last_name,sum(i.total) as total_spending
from customer c  join invoice i
on c.customer_id=i.customer_id
group by c.customer_id
order by total_spending desc
limit 1
---Ans:"R"	"Madhav"	144.54000000000002
 
 
 /*Question Set 2 – Moderate*/
---1. Write query to return the email, first name, last name, & Genre of all Rock Music listeners.
--- Return your list ordered alphabetically by email starting with A
select distinct(email),first_name,last_name
from customer c 
		join invoice i on c.customer_id=i.customer_id 
		join invoice_line l on i.invoice_id=l.invoice_id 
		where track_id in (select track_id from track t join genre g on t.genre_id=g.genre_id
		                    where g.name like 'Rock')
order by email
---OR
select distinct(email),first_name,last_name
from customer c 
		join invoice i on c.customer_id=i.customer_id 
		join invoice_line l on i.invoice_id=l.invoice_id 
		join track t on t.track_id =l.track_id 
		join genre g on t.genre_id=g.genre_id
		                    where g.name like 'Rock'
order by email

/*2. Let's invite the artists who have written the most rock music in our dataset. Write a
query that returns the Artist name and total track count of the top 10 rock bands*/
 select a.artist_id,a.name,count(a.artist_id) as number_of_songs
from track t join album ab on ab.album_id=t.album_id
              join artist a on a.artist_id=ab.album_id
		      join genre g on g.genre_id=t.genre_id 
		      where g.name like 'Rock' 
		group by a.artist_id
		order by number_of_songs Desc
limit 10

/*3.Return all the track names that have a song length longer than the average song length.
Return the Name and Milliseconds for each track. Order by the song length with the
longest songs listed first*/
---select * from track
select name,milliseconds
		from track 
where milliseconds>(select avg(milliseconds) as avg_track_length from track)
order by milliseconds desc

---Question Set 3 – Advance
/*1. Find how much amount spent by each customer on artists? Write a query to return
customer name, artist name and total spent*/












/*2. We want to find out the most popular music Genre for each country. We determine the
most popular genre as the genre with the highest amount of purchases. Write a query
that returns each country along with the top Genre. For countries where the maximum
number of purchases is shared return all Genres*/







/*3. Write a query that determines the customer that has spent the most on music for each
country. Write a query that returns the country along with the top customer and how
much they spent. For countries where the top amount spent is shared, provide all
customers who spent this amount*/



