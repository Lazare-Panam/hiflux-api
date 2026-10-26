-- ABPR (Air Operating Back Pressure Regulator) products (4) + filter values. Run AFTER the info file. Source: Mongo product_variants.
DECLARE @SeriesName nvarchar(100) = N'ABPR (Air Operating Back Pressure Regulator)';
DECLARE @CategoryId int = (SELECT CategoryId FROM Categories WHERE Name = @SeriesName);

INSERT INTO Filters (Name) SELECT v.Name FROM (VALUES (N'Tube Size'),(N'Config')) AS v(Name)
WHERE NOT EXISTS (SELECT 1 FROM Filters f WHERE f.Name = v.Name);

INSERT INTO CategoryFilters (CategoryId, FilterId, SortOrder)
SELECT @CategoryId, f.FilterId, v.SortOrder
FROM (VALUES (N'Tube Size',0),(N'Config',1)) AS v(FilterName, SortOrder)
JOIN Filters f ON f.Name = v.FilterName
WHERE NOT EXISTS (SELECT 1 FROM CategoryFilters cf WHERE cf.CategoryId=@CategoryId AND cf.FilterId=f.FilterId);

INSERT INTO CatalogProducts (PartNumber, CategoryId, ProductStatus, FamilyDescription, DetailDescription, ImageUrl, Price) VALUES
(N'ABPR-10000-04-S', @CategoryId, N'Active', N'Hiflux Air Operated Back Pressure Regulator', N'Hiflux Air Operated Back Pressure Regulator - 1/4 inch / S', N'https://pblol2.blob.core.windows.net/hiflux/regulators/abpr.png', NULL),
(N'ABPR-10000-06-S', @CategoryId, N'Active', N'Hiflux Air Operated Back Pressure Regulator', N'Hiflux Air Operated Back Pressure Regulator - 3/8 inch / S', N'https://pblol2.blob.core.windows.net/hiflux/regulators/abpr.png', NULL),
(N'ABPR-10000-08-S', @CategoryId, N'Active', N'Hiflux Air Operated Back Pressure Regulator', N'Hiflux Air Operated Back Pressure Regulator - 1/2 inch / S', N'https://pblol2.blob.core.windows.net/hiflux/regulators/abpr.png', NULL),
(N'ABPR-10000-04-H', @CategoryId, N'Active', N'Hiflux Air Operated Back Pressure Regulator', N'Hiflux Air Operated Back Pressure Regulator - 1/4 inch / H', N'https://pblol2.blob.core.windows.net/hiflux/regulators/abpr.png', NULL);

INSERT INTO ProductFilterValues (ProductId, CategoryId, FilterId, Value)
SELECT p.ProductId, p.CategoryId, f.FilterId, v.Value
FROM CatalogProducts p
JOIN (VALUES
  (N'ABPR-10000-04-S',N'Tube Size',N'1/4 inch'),(N'ABPR-10000-04-S',N'Config',N'S'),
  (N'ABPR-10000-06-S',N'Tube Size',N'3/8 inch'),(N'ABPR-10000-06-S',N'Config',N'S'),
  (N'ABPR-10000-08-S',N'Tube Size',N'1/2 inch'),(N'ABPR-10000-08-S',N'Config',N'S'),
  (N'ABPR-10000-04-H',N'Tube Size',N'1/4 inch'),(N'ABPR-10000-04-H',N'Config',N'H')
) AS v(PartNumber, FilterName, Value) ON v.PartNumber = p.PartNumber
JOIN Filters f ON f.Name = v.FilterName WHERE p.CategoryId=@CategoryId;

SELECT COUNT(*) AS Products FROM CatalogProducts WHERE CategoryId=@CategoryId;
SELECT COUNT(*) AS FilterValues FROM ProductFilterValues WHERE CategoryId=@CategoryId;
