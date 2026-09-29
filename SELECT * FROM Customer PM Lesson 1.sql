SELECT   c.CustomerId,
         c.firstname,
         c.lastname,
         c.city,
         c.Company
FROM     Customer AS c
WHERE    c.Company IS NOT NULL
--WHERE  c.city IN ('London', 'Paris', 'Rome', 'Berlin')
--WHERE    c.LastName LIKE '%R'
ORDER BY c.Company ASC;

SELECT   c.country,
         COUNT(*) AS NumberOfCustomers
FROM     Customer AS C
GROUP BY c.Country
ORDER BY NumberOfCustomers DESC;

--INVOICE ANALYSIS

SELECT i.InvoiceId,
       i.InvoiceDate,
       i.CustomerId,
       i.Total
FROM   Invoice AS i
ORDER BY i.CustomerId;

SELECT   i.CustomerId,
         SUM(i.Total) AS [Invoice Total]
FROM     Invoice AS i
GROUP BY i.CustomerId
ORDER BY i.CustomerId;