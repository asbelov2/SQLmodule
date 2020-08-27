SELECT FirstName, LastName,
        ISNULL(Phone, '�� ����������') AS Phone,
        ISNULL(Email, '����������') AS Email
FROM Clients

SELECT FirstName, LastName,
        COALESCE(Phone, Email, '�� ����������') AS Contacts
FROM Clients