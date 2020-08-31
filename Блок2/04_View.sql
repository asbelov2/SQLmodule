USE Belov_ASproductsdb;

GO
CREATE VIEW SellersSummary AS
SELECT Sellers.Id,
		Sellers.LastName,
		Sellers.FirstName,
		Sellers.Patronymic,
		Sellers.Commission,
		ISNULL(SUM(Orders.Sum)*Sellers.Commission, 0) AS CommissionSummary
FROM Sellers LEFT JOIN Orders ON Sellers.Id = Orders.SellerId
GROUP BY Sellers.Id, Sellers.FirstName, Sellers.LastName, Sellers.Patronymic, Sellers.Commission