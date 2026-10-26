-- High Pressure Adapter - Bulkhead Union products (18) + filter values. Run AFTER the info file. Source: Mongo product_variants.
DECLARE @SeriesName nvarchar(100) = N'High Pressure Adapter - Bulkhead Union';
DECLARE @CategoryId int = (SELECT CategoryId FROM Categories WHERE Name = @SeriesName);

INSERT INTO Filters (Name) SELECT v.Name FROM (VALUES (N'Pressure Rating'),(N'Tube Size')) AS v(Name)
WHERE NOT EXISTS (SELECT 1 FROM Filters f WHERE f.Name = v.Name);

INSERT INTO CategoryFilters (CategoryId, FilterId, SortOrder)
SELECT @CategoryId, f.FilterId, v.SortOrder
FROM (VALUES (N'Pressure Rating',0),(N'Tube Size',1)) AS v(FilterName, SortOrder)
JOIN Filters f ON f.Name = v.FilterName
WHERE NOT EXISTS (SELECT 1 FROM CategoryFilters cf WHERE cf.CategoryId=@CategoryId AND cf.FilterId=f.FilterId);

INSERT INTO CatalogProducts (PartNumber, CategoryId, ProductStatus, FamilyDescription, DetailDescription, ImageUrl, Price) VALUES
(N'A020F4-020F4-B', @CategoryId, N'Active', N'Hiflux High Pressure Bulkhead Adapter', N'Hiflux High Pressure Bulkhead Adapter - 20,000 psi / 1/4"', N'https://pblol2.blob.core.windows.net/hiflux/union-adapters/ba-60k.png', 112.80),
(N'A020F6-020F6-B', @CategoryId, N'Active', N'Hiflux High Pressure Bulkhead Adapter', N'Hiflux High Pressure Bulkhead Adapter - 20,000 psi / 3/8"', N'https://pblol2.blob.core.windows.net/hiflux/union-adapters/ba-60k.png', 134.40),
(N'A020F9-020F9-B', @CategoryId, N'Active', N'Hiflux High Pressure Bulkhead Adapter', N'Hiflux High Pressure Bulkhead Adapter - 20,000 psi / 9/16"', N'https://pblol2.blob.core.windows.net/hiflux/union-adapters/ba-60k.png', 175.20),
(N'A060F4-060F4-B', @CategoryId, N'Active', N'Hiflux High Pressure Bulkhead Adapter', N'Hiflux High Pressure Bulkhead Adapter - 60,000 psi / 1/4"', N'https://pblol2.blob.core.windows.net/hiflux/union-adapters/ba-60k.png', 98.40),
(N'A060F6-060F6-B', @CategoryId, N'Active', N'Hiflux High Pressure Bulkhead Adapter', N'Hiflux High Pressure Bulkhead Adapter - 60,000 psi / 3/8"', N'https://pblol2.blob.core.windows.net/hiflux/union-adapters/ba-60k.png', 120.00),
(N'A060F9-060F9-B', @CategoryId, N'Active', N'Hiflux High Pressure Bulkhead Adapter', N'Hiflux High Pressure Bulkhead Adapter - 60,000 psi / 9/16"', N'https://pblol2.blob.core.windows.net/hiflux/union-adapters/ba-60k.png', 157.20),
(N'A015F2-015F2-B', @CategoryId, N'Active', N'Hiflux High Pressure Bulkhead Adapter', N'Hiflux High Pressure Bulkhead Adapter - 15,000 psi / 1/8"', N'https://pblol2.blob.core.windows.net/hiflux/union-adapters/ba-60k.png', NULL),
(N'A015F4-015F4-B', @CategoryId, N'Active', N'Hiflux High Pressure Bulkhead Adapter', N'Hiflux High Pressure Bulkhead Adapter - 15,000 psi / 1/4"', N'https://pblol2.blob.core.windows.net/hiflux/union-adapters/ba-60k.png', NULL),
(N'A015F6-015F6-B', @CategoryId, N'Active', N'Hiflux High Pressure Bulkhead Adapter', N'Hiflux High Pressure Bulkhead Adapter - 15,000 psi / 3/8"', N'https://pblol2.blob.core.windows.net/hiflux/union-adapters/ba-60k.png', NULL),
(N'A010F8-010F8-B', @CategoryId, N'Active', N'Hiflux High Pressure Bulkhead Adapter', N'Hiflux High Pressure Bulkhead Adapter - 15,000 psi / 1/2"', N'https://pblol2.blob.core.windows.net/hiflux/union-adapters/ba-60k.png', NULL),
(N'A020F12-020F12-B', @CategoryId, N'Active', N'Hiflux High Pressure Bulkhead Adapter', N'Hiflux High Pressure Bulkhead Adapter - 20,000 psi / 3/4"', N'https://pblol2.blob.core.windows.net/hiflux/union-adapters/ba-60k.png', NULL),
(N'A020F16-020F16-B', @CategoryId, N'Active', N'Hiflux High Pressure Bulkhead Adapter', N'Hiflux High Pressure Bulkhead Adapter - 20,000 psi / 1"', N'https://pblol2.blob.core.windows.net/hiflux/union-adapters/ba-60k.png', NULL),
(N'ANPTF2-NPTF2-B', @CategoryId, N'Active', N'Hiflux High Pressure Bulkhead Adapter', N'Hiflux High Pressure Bulkhead Adapter - 15,000 psi NPT / 1/8"', N'https://pblol2.blob.core.windows.net/hiflux/union-adapters/ba-60k.png', NULL),
(N'ANPTF4-NPTF4-B', @CategoryId, N'Active', N'Hiflux High Pressure Bulkhead Adapter', N'Hiflux High Pressure Bulkhead Adapter - 15,000 psi NPT / 1/4"', N'https://pblol2.blob.core.windows.net/hiflux/union-adapters/ba-60k.png', NULL),
(N'ANPTF6-NPTF6-B', @CategoryId, N'Active', N'Hiflux High Pressure Bulkhead Adapter', N'Hiflux High Pressure Bulkhead Adapter - 15,000 psi NPT / 3/8"', N'https://pblol2.blob.core.windows.net/hiflux/union-adapters/ba-60k.png', NULL),
(N'ANPTF8-NPTF8-B', @CategoryId, N'Active', N'Hiflux High Pressure Bulkhead Adapter', N'Hiflux High Pressure Bulkhead Adapter - 15,000 psi NPT / 1/2"', N'https://pblol2.blob.core.windows.net/hiflux/union-adapters/ba-60k.png', NULL),
(N'ANPTF12-NPTF12-B', @CategoryId, N'Active', N'Hiflux High Pressure Bulkhead Adapter', N'Hiflux High Pressure Bulkhead Adapter - 10,000 psi NPT / 3/4"', N'https://pblol2.blob.core.windows.net/hiflux/union-adapters/ba-60k.png', NULL),
(N'ANPTF16-NPTF16-B', @CategoryId, N'Active', N'Hiflux High Pressure Bulkhead Adapter', N'Hiflux High Pressure Bulkhead Adapter - 10,000 psi NPT / 1"', N'https://pblol2.blob.core.windows.net/hiflux/union-adapters/ba-60k.png', NULL);

INSERT INTO ProductFilterValues (ProductId, CategoryId, FilterId, Value)
SELECT p.ProductId, p.CategoryId, f.FilterId, v.Value
FROM CatalogProducts p
JOIN (VALUES
  (N'A020F4-020F4-B',N'Pressure Rating',N'20,000 psi'),(N'A020F4-020F4-B',N'Tube Size',N'1/4"'),
  (N'A020F6-020F6-B',N'Pressure Rating',N'20,000 psi'),(N'A020F6-020F6-B',N'Tube Size',N'3/8"'),
  (N'A020F9-020F9-B',N'Pressure Rating',N'20,000 psi'),(N'A020F9-020F9-B',N'Tube Size',N'9/16"'),
  (N'A060F4-060F4-B',N'Pressure Rating',N'60,000 psi'),(N'A060F4-060F4-B',N'Tube Size',N'1/4"'),
  (N'A060F6-060F6-B',N'Pressure Rating',N'60,000 psi'),(N'A060F6-060F6-B',N'Tube Size',N'3/8"'),
  (N'A060F9-060F9-B',N'Pressure Rating',N'60,000 psi'),(N'A060F9-060F9-B',N'Tube Size',N'9/16"'),
  (N'A015F2-015F2-B',N'Pressure Rating',N'15,000 psi'),(N'A015F2-015F2-B',N'Tube Size',N'1/8"'),
  (N'A015F4-015F4-B',N'Pressure Rating',N'15,000 psi'),(N'A015F4-015F4-B',N'Tube Size',N'1/4"'),
  (N'A015F6-015F6-B',N'Pressure Rating',N'15,000 psi'),(N'A015F6-015F6-B',N'Tube Size',N'3/8"'),
  (N'A010F8-010F8-B',N'Pressure Rating',N'15,000 psi'),(N'A010F8-010F8-B',N'Tube Size',N'1/2"'),
  (N'A020F12-020F12-B',N'Pressure Rating',N'20,000 psi'),(N'A020F12-020F12-B',N'Tube Size',N'3/4"'),
  (N'A020F16-020F16-B',N'Pressure Rating',N'20,000 psi'),(N'A020F16-020F16-B',N'Tube Size',N'1"'),
  (N'ANPTF2-NPTF2-B',N'Pressure Rating',N'15,000 psi NPT'),(N'ANPTF2-NPTF2-B',N'Tube Size',N'1/8"'),
  (N'ANPTF4-NPTF4-B',N'Pressure Rating',N'15,000 psi NPT'),(N'ANPTF4-NPTF4-B',N'Tube Size',N'1/4"'),
  (N'ANPTF6-NPTF6-B',N'Pressure Rating',N'15,000 psi NPT'),(N'ANPTF6-NPTF6-B',N'Tube Size',N'3/8"'),
  (N'ANPTF8-NPTF8-B',N'Pressure Rating',N'15,000 psi NPT'),(N'ANPTF8-NPTF8-B',N'Tube Size',N'1/2"'),
  (N'ANPTF12-NPTF12-B',N'Pressure Rating',N'10,000 psi NPT'),(N'ANPTF12-NPTF12-B',N'Tube Size',N'3/4"'),
  (N'ANPTF16-NPTF16-B',N'Pressure Rating',N'10,000 psi NPT'),(N'ANPTF16-NPTF16-B',N'Tube Size',N'1"')
) AS v(PartNumber, FilterName, Value) ON v.PartNumber = p.PartNumber
JOIN Filters f ON f.Name = v.FilterName WHERE p.CategoryId=@CategoryId;

SELECT COUNT(*) AS Products FROM CatalogProducts WHERE CategoryId=@CategoryId;
SELECT COUNT(*) AS FilterValues FROM ProductFilterValues WHERE CategoryId=@CategoryId;
