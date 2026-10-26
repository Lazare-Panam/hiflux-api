-- High Pressure Tube Support - 3 Line products (10) + filter values. Run AFTER the info file.
-- Facets: Lines / Tube Size.
DECLARE @SeriesName nvarchar(100) = N'High Pressure Tube Support - 3 Line';
DECLARE @CategoryId int = (SELECT CategoryId FROM Categories WHERE Name = @SeriesName);

INSERT INTO Filters (Name) SELECT v.Name FROM (VALUES (N'Lines'),(N'Tube Size')) AS v(Name)
WHERE NOT EXISTS (SELECT 1 FROM Filters f WHERE f.Name = v.Name);

INSERT INTO CategoryFilters (CategoryId, FilterId, SortOrder)
SELECT @CategoryId, f.FilterId, v.SortOrder
FROM (VALUES (N'Lines',0),(N'Tube Size',1)) AS v(FilterName, SortOrder)
JOIN Filters f ON f.Name = v.FilterName
WHERE NOT EXISTS (SELECT 1 FROM CategoryFilters cf WHERE cf.CategoryId=@CategoryId AND cf.FilterId=f.FilterId);

INSERT INTO CatalogProducts (PartNumber, CategoryId, ProductStatus, FamilyDescription, DetailDescription, ImageUrl, Price) VALUES
(N'TS08L1', @CategoryId, N'Active', N'Hiflux High Pressure Tube Support', N'Hiflux High Pressure Tube Support - 1 Line - 1/2"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tube-support.png', NULL),
(N'TS09L1', @CategoryId, N'Active', N'Hiflux High Pressure Tube Support', N'Hiflux High Pressure Tube Support - 1 Line - 9/16"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tube-support.png', NULL),
(N'TS04L2', @CategoryId, N'Active', N'Hiflux High Pressure Tube Support', N'Hiflux High Pressure Tube Support - 2 Line - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tube-support.png', NULL),
(N'TS06L2', @CategoryId, N'Active', N'Hiflux High Pressure Tube Support', N'Hiflux High Pressure Tube Support - 2 Line - 3/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tube-support.png', NULL),
(N'TS08L2', @CategoryId, N'Active', N'Hiflux High Pressure Tube Support', N'Hiflux High Pressure Tube Support - 2 Line - 1/2"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tube-support.png', NULL),
(N'TS09L2', @CategoryId, N'Active', N'Hiflux High Pressure Tube Support', N'Hiflux High Pressure Tube Support - 2 Line - 9/16"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tube-support.png', NULL),
(N'TS04L3', @CategoryId, N'Active', N'Hiflux High Pressure Tube Support', N'Hiflux High Pressure Tube Support - 3 Line - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tube-support.png', NULL),
(N'TS06L3', @CategoryId, N'Active', N'Hiflux High Pressure Tube Support', N'Hiflux High Pressure Tube Support - 3 Line - 3/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tube-support.png', NULL),
(N'TS08L3', @CategoryId, N'Active', N'Hiflux High Pressure Tube Support', N'Hiflux High Pressure Tube Support - 3 Line - 1/2"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tube-support.png', NULL),
(N'TS09L3', @CategoryId, N'Active', N'Hiflux High Pressure Tube Support', N'Hiflux High Pressure Tube Support - 3 Line - 9/16"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tube-support.png', NULL);

INSERT INTO ProductFilterValues (ProductId, CategoryId, FilterId, Value)
SELECT p.ProductId, p.CategoryId, f.FilterId, v.Value
FROM CatalogProducts p
JOIN (VALUES
  (N'TS08L1',N'Lines',N'1 Line'),(N'TS08L1',N'Tube Size',N'1/2"'),
  (N'TS09L1',N'Lines',N'1 Line'),(N'TS09L1',N'Tube Size',N'9/16"'),
  (N'TS04L2',N'Lines',N'2 Line'),(N'TS04L2',N'Tube Size',N'1/4"'),
  (N'TS06L2',N'Lines',N'2 Line'),(N'TS06L2',N'Tube Size',N'3/8"'),
  (N'TS08L2',N'Lines',N'2 Line'),(N'TS08L2',N'Tube Size',N'1/2"'),
  (N'TS09L2',N'Lines',N'2 Line'),(N'TS09L2',N'Tube Size',N'9/16"'),
  (N'TS04L3',N'Lines',N'3 Line'),(N'TS04L3',N'Tube Size',N'1/4"'),
  (N'TS06L3',N'Lines',N'3 Line'),(N'TS06L3',N'Tube Size',N'3/8"'),
  (N'TS08L3',N'Lines',N'3 Line'),(N'TS08L3',N'Tube Size',N'1/2"'),
  (N'TS09L3',N'Lines',N'3 Line'),(N'TS09L3',N'Tube Size',N'9/16"')
) AS v(PartNumber, FilterName, Value) ON v.PartNumber = p.PartNumber
JOIN Filters f ON f.Name = v.FilterName WHERE p.CategoryId=@CategoryId;

SELECT COUNT(*) AS Products FROM CatalogProducts WHERE CategoryId=@CategoryId;
SELECT COUNT(*) AS FilterValues FROM ProductFilterValues WHERE CategoryId=@CategoryId;
