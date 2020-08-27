SELECT FirstName, LastName,
        ISNULL(Phone, 'не определено') AS Phone,
        ISNULL(Email, 'неизвестно') AS Email
FROM Clients

SELECT FirstName, LastName,
        COALESCE(Phone, Email, 'не определено') AS Contacts
FROM Clients