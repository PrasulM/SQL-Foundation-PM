SELECT   c.CustomerId,
         c.firstname,
         c.lastname,
         ---c.firstname + ' ' + c.LastName AS CUSTOMERNAME,
        CONCAT(c.firstname, ' ', c.LastName) AS CUSTOMERNAME,
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
c.FirstName, 
c.LastName,
CONCAT(c.FirstName , ' ' , c.LastName) AS CustomerName,
         SUM(i.Total) AS [Invoice Total],
         COUNT(*) AS NumberofInvoices
FROM     Invoice AS i 
JOIN Customer AS c ON i.CustomerId = c.CustomerId
GROUP BY i.CustomerId, c.FirstName, c.LastName, CONCAT(c.FirstName , ' ' , c.LastName)
ORDER BY i.CustomerId;



INVOICE ANALYSIS ALTERNATIVE

SELECT IBC.CustomerId,
       c.FirstName,
       c.LastName,
       CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
       IBC.InvoiceTotal,
       IBC.NumberOfInvoices
FROM   (SELECT   i.CustomerId,
                 SUM(i.Total) AS InvoiceTotal,
                 COUNT(*) AS NumberOfInvoices
        FROM     Invoice AS i
        GROUP BY i.CustomerId) AS IBC
       INNER JOIN
       Customer AS c
       ON IBC.CustomerId = c.CustomerId;


       ---CUSTOMERS AND EMPLOYEES

       SELECT 
       ---e.EmployeeId,
       ---e.FirstName,
       e.LastName,
       CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName,
       CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName
FROM   Employee AS e
JOIN Customer c ON e.EmployeeId = c.SupportRepId


SELECT
       ibc.CustomerId,
       ---c.FirstName,
       ---c.LastName,
       CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
       CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName,
       ibc.InvoiceTotal,
       ibc.NumberOfInvoices
FROM   (SELECT   i.CustomerId,
                 SUM(i.Total) AS InvoiceTotal,
                 COUNT(*) AS NumberOfInvoices
        FROM     Invoice AS i
        GROUP BY i.CustomerId) AS ibc
       INNER JOIN
       Customer AS c
       ON ibc.CustomerId = c.CustomerId
       JOIN Employee AS e ON c.SupportRepId = e.EmployeeId