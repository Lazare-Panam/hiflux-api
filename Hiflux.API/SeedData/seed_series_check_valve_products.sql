-- High Pressure Check Valve - Ultra High Pressure products (36, all priced) + filter values. Run AFTER the info file.
-- Facets from the Mongo specs; 4 legacy CVN* rows that exactly duplicated a CV<pressure>* facet combo were dropped.
DECLARE @SeriesName nvarchar(100) = N'High Pressure Check Valve - Ultra High Pressure';
DECLARE @CategoryId int = (SELECT CategoryId FROM Categories WHERE Name = @SeriesName);

INSERT INTO Filters (Name) SELECT v.Name FROM (VALUES (N'Pressure Rating'),(N'Tube Size'),(N'Sealing Type')) AS v(Name)
WHERE NOT EXISTS (SELECT 1 FROM Filters f WHERE f.Name = v.Name);

INSERT INTO CategoryFilters (CategoryId, FilterId, SortOrder)
SELECT @CategoryId, f.FilterId, v.SortOrder
FROM (VALUES (N'Pressure Rating',0),(N'Tube Size',1),(N'Sealing Type',2)) AS v(FilterName, SortOrder)
JOIN Filters f ON f.Name = v.FilterName
WHERE NOT EXISTS (SELECT 1 FROM CategoryFilters cf WHERE cf.CategoryId=@CategoryId AND cf.FilterId=f.FilterId);

INSERT INTO CatalogProducts (PartNumber, CategoryId, ProductStatus, FamilyDescription, DetailDescription, ImageUrl, Price) VALUES
(N'CV15BS04', @CategoryId, N'Active', N'Hiflux High Pressure Check Valve', N'Hiflux Check Valve - 15,000 psi - 1/4" - Ball', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/check-valve.png', 165.60),
(N'CV15BS06', @CategoryId, N'Active', N'Hiflux High Pressure Check Valve', N'Hiflux Check Valve - 15,000 psi - 3/8" - Ball', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/check-valve.png', 175.20),
(N'CVNBS08', @CategoryId, N'Active', N'Hiflux High Pressure Check Valve', N'Hiflux Check Valve - 15,000 psi - 1/2" - Ball', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/check-valve.png', 230.40),
(N'CVNBS12', @CategoryId, N'Active', N'Hiflux High Pressure Check Valve', N'Hiflux Check Valve - 10,000 psi - 3/4" - Ball', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/check-valve.png', 493.20),
(N'CVNBS16', @CategoryId, N'Active', N'Hiflux High Pressure Check Valve', N'Hiflux Check Valve - 10,000 psi - 1" - Ball', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/check-valve.png', 712.80),
(N'CV15OS04', @CategoryId, N'Active', N'Hiflux High Pressure Check Valve', N'Hiflux Check Valve - 15,000 psi - 1/4" - O-Ring', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/check-valve.png', 165.60),
(N'CV15OS06', @CategoryId, N'Active', N'Hiflux High Pressure Check Valve', N'Hiflux Check Valve - 15,000 psi - 3/8" - O-Ring', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/check-valve.png', 175.20),
(N'CVNOS08', @CategoryId, N'Active', N'Hiflux High Pressure Check Valve', N'Hiflux Check Valve - 15,000 psi - 1/2" - O-Ring', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/check-valve.png', 199.20),
(N'CVNOS12', @CategoryId, N'Active', N'Hiflux High Pressure Check Valve', N'Hiflux Check Valve - 10,000 psi - 3/4" - O-Ring', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/check-valve.png', 517.20),
(N'CVNOS16', @CategoryId, N'Active', N'Hiflux High Pressure Check Valve', N'Hiflux Check Valve - 10,000 psi - 1" - O-Ring', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/check-valve.png', 772.80),
(N'CV15BS02', @CategoryId, N'Active', N'Hiflux High Pressure Check Valve', N'Hiflux Check Valve - 15,000 psi - 1/8" - Ball', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/check-valve.png', 171.60),
(N'CV15OS02', @CategoryId, N'Active', N'Hiflux High Pressure Check Valve', N'Hiflux Check Valve - 15,000 psi - 1/8" - O-Ring', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/check-valve.png', 171.60),
(N'CV20BS04', @CategoryId, N'Active', N'Hiflux High Pressure Check Valve', N'Hiflux Check Valve - 20,000 psi - 1/4" - Ball', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/check-valve.png', 153.60),
(N'CV20BS06', @CategoryId, N'Active', N'Hiflux High Pressure Check Valve', N'Hiflux Check Valve - 20,000 psi - 3/8" - Ball', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/check-valve.png', 159.60),
(N'CV20BS09', @CategoryId, N'Active', N'Hiflux High Pressure Check Valve', N'Hiflux Check Valve - 20,000 psi - 9/16" - Ball', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/check-valve.png', 216.00),
(N'CV20BS12', @CategoryId, N'Active', N'Hiflux High Pressure Check Valve', N'Hiflux Check Valve - 20,000 psi - 3/4" - Ball', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/check-valve.png', 616.80),
(N'CV20BS16', @CategoryId, N'Active', N'Hiflux High Pressure Check Valve', N'Hiflux Check Valve - 20,000 psi - 1" - Ball', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/check-valve.png', 980.40),
(N'CV20OS04', @CategoryId, N'Active', N'Hiflux High Pressure Check Valve', N'Hiflux Check Valve - 20,000 psi - 1/4" - O-Ring', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/check-valve.png', 163.20),
(N'CV20OS06', @CategoryId, N'Active', N'Hiflux High Pressure Check Valve', N'Hiflux Check Valve - 20,000 psi - 3/8" - O-Ring', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/check-valve.png', 176.40),
(N'CV20OS09', @CategoryId, N'Active', N'Hiflux High Pressure Check Valve', N'Hiflux Check Valve - 20,000 psi - 9/16" - O-Ring', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/check-valve.png', 214.80),
(N'CV20OS12', @CategoryId, N'Active', N'Hiflux High Pressure Check Valve', N'Hiflux Check Valve - 20,000 psi - 3/4" - O-Ring', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/check-valve.png', 614.40),
(N'CV20OS16', @CategoryId, N'Active', N'Hiflux High Pressure Check Valve', N'Hiflux Check Valve - 20,000 psi - 1" - O-Ring', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/check-valve.png', 939.60),
(N'CV30BS16', @CategoryId, N'Active', N'Hiflux High Pressure Check Valve', N'Hiflux Check Valve - 30,000 psi - 1" - Ball', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/check-valve.png', 1027.20),
(N'CV60BS04', @CategoryId, N'Active', N'Hiflux High Pressure Check Valve', N'Hiflux Check Valve - 60,000 psi - 1/4" - Ball', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/check-valve.png', 159.60),
(N'CV60BS06', @CategoryId, N'Active', N'Hiflux High Pressure Check Valve', N'Hiflux Check Valve - 60,000 psi - 3/8" - Ball', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/check-valve.png', 201.60),
(N'CV60BS09', @CategoryId, N'Active', N'Hiflux High Pressure Check Valve', N'Hiflux Check Valve - 60,000 psi - 9/16" - Ball', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/check-valve.png', 248.40),
(N'CV30OS02', @CategoryId, N'Active', N'Hiflux High Pressure Check Valve', N'Hiflux Check Valve - 30,000 psi - 1/8" - O-Ring', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/check-valve.png', 181.20),
(N'CV30OS04', @CategoryId, N'Active', N'Hiflux High Pressure Check Valve', N'Hiflux Check Valve - 30,000 psi - 1/4" - O-Ring', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/check-valve.png', 163.20),
(N'CV30OS06', @CategoryId, N'Active', N'Hiflux High Pressure Check Valve', N'Hiflux Check Valve - 30,000 psi - 3/8" - O-Ring', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/check-valve.png', 184.80),
(N'CV30OS09', @CategoryId, N'Active', N'Hiflux High Pressure Check Valve', N'Hiflux Check Valve - 30,000 psi - 9/16" - O-Ring', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/check-valve.png', 216.00),
(N'CV30OS16', @CategoryId, N'Active', N'Hiflux High Pressure Check Valve', N'Hiflux Check Valve - 30,000 psi - 1" - O-Ring', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/check-valve.png', 1038.00),
(N'CV60OS04', @CategoryId, N'Active', N'Hiflux High Pressure Check Valve', N'Hiflux Check Valve - 60,000 psi - 1/4" - O-Ring', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/check-valve.png', 193.20),
(N'CV60OS06', @CategoryId, N'Active', N'Hiflux High Pressure Check Valve', N'Hiflux Check Valve - 60,000 psi - 3/8" - O-Ring', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/check-valve.png', 214.80),
(N'CV60OS09', @CategoryId, N'Active', N'Hiflux High Pressure Check Valve', N'Hiflux Check Valve - 60,000 psi - 9/16" - O-Ring', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/check-valve.png', 256.80),
(N'CV100BS04', @CategoryId, N'Active', N'Hiflux High Pressure Check Valve', N'Hiflux Check Valve - 100,000 psi - 1/4" - Ball', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/check-valve.png', 400.80),
(N'CV150BS04', @CategoryId, N'Active', N'Hiflux High Pressure Check Valve', N'Hiflux Check Valve - 150,000 psi - 3/8" - Ball', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/check-valve.png', 678.00);

INSERT INTO ProductFilterValues (ProductId, CategoryId, FilterId, Value)
SELECT p.ProductId, p.CategoryId, f.FilterId, v.Value
FROM CatalogProducts p
JOIN (VALUES
  (N'CV15BS04',N'Pressure Rating',N'15,000 psi'),(N'CV15BS04',N'Tube Size',N'1/4"'),(N'CV15BS04',N'Sealing Type',N'Ball'),
  (N'CV15BS06',N'Pressure Rating',N'15,000 psi'),(N'CV15BS06',N'Tube Size',N'3/8"'),(N'CV15BS06',N'Sealing Type',N'Ball'),
  (N'CVNBS08',N'Pressure Rating',N'15,000 psi'),(N'CVNBS08',N'Tube Size',N'1/2"'),(N'CVNBS08',N'Sealing Type',N'Ball'),
  (N'CVNBS12',N'Pressure Rating',N'10,000 psi'),(N'CVNBS12',N'Tube Size',N'3/4"'),(N'CVNBS12',N'Sealing Type',N'Ball'),
  (N'CVNBS16',N'Pressure Rating',N'10,000 psi'),(N'CVNBS16',N'Tube Size',N'1"'),(N'CVNBS16',N'Sealing Type',N'Ball'),
  (N'CV15OS04',N'Pressure Rating',N'15,000 psi'),(N'CV15OS04',N'Tube Size',N'1/4"'),(N'CV15OS04',N'Sealing Type',N'O-Ring'),
  (N'CV15OS06',N'Pressure Rating',N'15,000 psi'),(N'CV15OS06',N'Tube Size',N'3/8"'),(N'CV15OS06',N'Sealing Type',N'O-Ring'),
  (N'CVNOS08',N'Pressure Rating',N'15,000 psi'),(N'CVNOS08',N'Tube Size',N'1/2"'),(N'CVNOS08',N'Sealing Type',N'O-Ring'),
  (N'CVNOS12',N'Pressure Rating',N'10,000 psi'),(N'CVNOS12',N'Tube Size',N'3/4"'),(N'CVNOS12',N'Sealing Type',N'O-Ring'),
  (N'CVNOS16',N'Pressure Rating',N'10,000 psi'),(N'CVNOS16',N'Tube Size',N'1"'),(N'CVNOS16',N'Sealing Type',N'O-Ring'),
  (N'CV15BS02',N'Pressure Rating',N'15,000 psi'),(N'CV15BS02',N'Tube Size',N'1/8"'),(N'CV15BS02',N'Sealing Type',N'Ball'),
  (N'CV15OS02',N'Pressure Rating',N'15,000 psi'),(N'CV15OS02',N'Tube Size',N'1/8"'),(N'CV15OS02',N'Sealing Type',N'O-Ring'),
  (N'CV20BS04',N'Pressure Rating',N'20,000 psi'),(N'CV20BS04',N'Tube Size',N'1/4"'),(N'CV20BS04',N'Sealing Type',N'Ball'),
  (N'CV20BS06',N'Pressure Rating',N'20,000 psi'),(N'CV20BS06',N'Tube Size',N'3/8"'),(N'CV20BS06',N'Sealing Type',N'Ball'),
  (N'CV20BS09',N'Pressure Rating',N'20,000 psi'),(N'CV20BS09',N'Tube Size',N'9/16"'),(N'CV20BS09',N'Sealing Type',N'Ball'),
  (N'CV20BS12',N'Pressure Rating',N'20,000 psi'),(N'CV20BS12',N'Tube Size',N'3/4"'),(N'CV20BS12',N'Sealing Type',N'Ball'),
  (N'CV20BS16',N'Pressure Rating',N'20,000 psi'),(N'CV20BS16',N'Tube Size',N'1"'),(N'CV20BS16',N'Sealing Type',N'Ball'),
  (N'CV20OS04',N'Pressure Rating',N'20,000 psi'),(N'CV20OS04',N'Tube Size',N'1/4"'),(N'CV20OS04',N'Sealing Type',N'O-Ring'),
  (N'CV20OS06',N'Pressure Rating',N'20,000 psi'),(N'CV20OS06',N'Tube Size',N'3/8"'),(N'CV20OS06',N'Sealing Type',N'O-Ring'),
  (N'CV20OS09',N'Pressure Rating',N'20,000 psi'),(N'CV20OS09',N'Tube Size',N'9/16"'),(N'CV20OS09',N'Sealing Type',N'O-Ring'),
  (N'CV20OS12',N'Pressure Rating',N'20,000 psi'),(N'CV20OS12',N'Tube Size',N'3/4"'),(N'CV20OS12',N'Sealing Type',N'O-Ring'),
  (N'CV20OS16',N'Pressure Rating',N'20,000 psi'),(N'CV20OS16',N'Tube Size',N'1"'),(N'CV20OS16',N'Sealing Type',N'O-Ring'),
  (N'CV30BS16',N'Pressure Rating',N'30,000 psi'),(N'CV30BS16',N'Tube Size',N'1"'),(N'CV30BS16',N'Sealing Type',N'Ball'),
  (N'CV60BS04',N'Pressure Rating',N'60,000 psi'),(N'CV60BS04',N'Tube Size',N'1/4"'),(N'CV60BS04',N'Sealing Type',N'Ball'),
  (N'CV60BS06',N'Pressure Rating',N'60,000 psi'),(N'CV60BS06',N'Tube Size',N'3/8"'),(N'CV60BS06',N'Sealing Type',N'Ball'),
  (N'CV60BS09',N'Pressure Rating',N'60,000 psi'),(N'CV60BS09',N'Tube Size',N'9/16"'),(N'CV60BS09',N'Sealing Type',N'Ball'),
  (N'CV30OS02',N'Pressure Rating',N'30,000 psi'),(N'CV30OS02',N'Tube Size',N'1/8"'),(N'CV30OS02',N'Sealing Type',N'O-Ring'),
  (N'CV30OS04',N'Pressure Rating',N'30,000 psi'),(N'CV30OS04',N'Tube Size',N'1/4"'),(N'CV30OS04',N'Sealing Type',N'O-Ring'),
  (N'CV30OS06',N'Pressure Rating',N'30,000 psi'),(N'CV30OS06',N'Tube Size',N'3/8"'),(N'CV30OS06',N'Sealing Type',N'O-Ring'),
  (N'CV30OS09',N'Pressure Rating',N'30,000 psi'),(N'CV30OS09',N'Tube Size',N'9/16"'),(N'CV30OS09',N'Sealing Type',N'O-Ring'),
  (N'CV30OS16',N'Pressure Rating',N'30,000 psi'),(N'CV30OS16',N'Tube Size',N'1"'),(N'CV30OS16',N'Sealing Type',N'O-Ring'),
  (N'CV60OS04',N'Pressure Rating',N'60,000 psi'),(N'CV60OS04',N'Tube Size',N'1/4"'),(N'CV60OS04',N'Sealing Type',N'O-Ring'),
  (N'CV60OS06',N'Pressure Rating',N'60,000 psi'),(N'CV60OS06',N'Tube Size',N'3/8"'),(N'CV60OS06',N'Sealing Type',N'O-Ring'),
  (N'CV60OS09',N'Pressure Rating',N'60,000 psi'),(N'CV60OS09',N'Tube Size',N'9/16"'),(N'CV60OS09',N'Sealing Type',N'O-Ring'),
  (N'CV100BS04',N'Pressure Rating',N'100,000 psi'),(N'CV100BS04',N'Tube Size',N'1/4"'),(N'CV100BS04',N'Sealing Type',N'Ball'),
  (N'CV150BS04',N'Pressure Rating',N'150,000 psi'),(N'CV150BS04',N'Tube Size',N'3/8"'),(N'CV150BS04',N'Sealing Type',N'Ball')
) AS v(PartNumber, FilterName, Value) ON v.PartNumber = p.PartNumber
JOIN Filters f ON f.Name = v.FilterName WHERE p.CategoryId=@CategoryId;

SELECT COUNT(*) AS Products FROM CatalogProducts WHERE CategoryId=@CategoryId;
SELECT COUNT(*) AS FilterValues FROM ProductFilterValues WHERE CategoryId=@CategoryId;
