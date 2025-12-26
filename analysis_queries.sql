SELECT *
FROM employee
ORDER BY levels DESC
LIMIT 1;

SELECT billing_country, COUNT(*) AS invoice_count
FROM invoice
GROUP BY billing_country
ORDER BY invoice_count DESC;

SELECT total
FROM invoice
ORDER BY total DESC
LIMIT 3;

SELECT billing_city, SUM(total) AS total_revenue
FROM invoice
GROUP BY billing_city
ORDER BY total_revenue DESC
LIMIT 1;

SELECT c.customerid, c.firstname, c.lastname, SUM(i.total) AS total_spent
FROM customer c
JOIN invoice i ON c.customerid = i.customerid
GROUP BY c.customerid
ORDER BY total_spent DESC
LIMIT 1;

SELECT DISTINCT c.email, c.firstname, c.lastname
FROM customer c
JOIN invoice i ON c.customerid = i.customerid
JOIN invoice_line il ON i.invoiceid = il.invoiceid
JOIN track t ON il.trackid = t.trackid
JOIN genre g ON t.genreid = g.genreid
WHERE g.name = 'Rock';

SELECT ar.name AS artist_name, COUNT(t.trackid) AS track_count
FROM artist ar
JOIN album al ON ar.artistid = al.artistid
JOIN track t ON al.albumid = t.albumid
JOIN genre g ON t.genreid = g.genreid
WHERE g.name = 'Rock'
GROUP BY ar.name
ORDER BY track_count DESC
LIMIT 10;

SELECT name, milliseconds
FROM track
WHERE milliseconds >
      (SELECT AVG(milliseconds) FROM track)
ORDER BY milliseconds DESC;

WITH artist_sales AS (
    SELECT
        il.invoiceid,
        ar.artistid,
        ar.name AS artist_name,
        il.unitprice * il.quantity AS revenue
    FROM invoice_line il
    JOIN track t ON il.trackid = t.trackid
    JOIN album al ON t.albumid = al.albumid
    JOIN artist ar ON al.artistid = ar.artistid
)
SELECT
    c.firstname,
    c.lastname,
    a.artist_name,
    SUM(a.revenue) AS total_spent
FROM customer c
JOIN invoice i ON c.customerid = i.customerid
JOIN artist_sales a ON i.invoiceid = a.invoiceid
GROUP BY c.firstname, c.lastname, a.artist_name
ORDER BY total_spent DESC;


WITH genre_rank AS (
    SELECT
        i.billing_country,
        g.name AS genre,
        COUNT(*) AS purchases,
        RANK() OVER (
            PARTITION BY i.billing_country
            ORDER BY COUNT(*) DESC
        ) AS rnk
    FROM invoice i
    JOIN invoice_line il ON i.invoiceid = il.invoiceid
    JOIN track t ON il.trackid = t.trackid
    JOIN genre g ON t.genreid = g.genreid
    GROUP BY i.billing_country, g.name
)
SELECT billing_country, genre, purchases
FROM genre_rank
WHERE rnk = 1;


WITH customer_spend AS (
    SELECT
        i.billing_country,
        c.customerid,
        c.firstname,
        c.lastname,
        SUM(i.total) AS total_spent,
        RANK() OVER (
            PARTITION BY i.billing_country
            ORDER BY SUM(i.total) DESC
        ) AS rnk
    FROM customer c
    JOIN invoice i ON c.customerid = i.customerid
    GROUP BY i.billing_country, c.customerid
)
SELECT billing_country, firstname, lastname, total_spent
FROM customer_spend
WHERE rnk = 1;
