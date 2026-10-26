-- High Pressure Tooling Set - Coning Tool products (36) + filter values. Run AFTER the info file.
-- Facets: Type / Pressure Rating / Tube Size.
DECLARE @SeriesName nvarchar(100) = N'High Pressure Tooling Set - Coning Tool';
DECLARE @CategoryId int = (SELECT CategoryId FROM Categories WHERE Name = @SeriesName);

INSERT INTO Filters (Name) SELECT v.Name FROM (VALUES (N'Type'),(N'Pressure Rating'),(N'Tube Size')) AS v(Name)
WHERE NOT EXISTS (SELECT 1 FROM Filters f WHERE f.Name = v.Name);

INSERT INTO CategoryFilters (CategoryId, FilterId, SortOrder)
SELECT @CategoryId, f.FilterId, v.SortOrder
FROM (VALUES (N'Type',0),(N'Pressure Rating',1),(N'Tube Size',2)) AS v(FilterName, SortOrder)
JOIN Filters f ON f.Name = v.FilterName
WHERE NOT EXISTS (SELECT 1 FROM CategoryFilters cf WHERE cf.CategoryId=@CategoryId AND cf.FilterId=f.FilterId);

INSERT INTO CatalogProducts (PartNumber, CategoryId, ProductStatus, FamilyDescription, DetailDescription, ImageUrl, Price) VALUES
(N'CT-LF4', @CategoryId, N'Active', N'Hiflux High Pressure Tooling', N'Hiflux High Pressure Tooling - Coning Tools Set - 20,000 psi - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tooling.png', 366.00),
(N'CT-LF6', @CategoryId, N'Active', N'Hiflux High Pressure Tooling', N'Hiflux High Pressure Tooling - Coning Tools Set - 20,000 psi - 3/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tooling.png', 366.00),
(N'CT-LF9', @CategoryId, N'Active', N'Hiflux High Pressure Tooling', N'Hiflux High Pressure Tooling - Coning Tools Set - 20,000 psi - 9/16"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tooling.png', 454.80),
(N'CT-HF4', @CategoryId, N'Active', N'Hiflux High Pressure Tooling', N'Hiflux High Pressure Tooling - Coning Tools Set - 60,000 psi - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tooling.png', 366.00),
(N'CT-HF6', @CategoryId, N'Active', N'Hiflux High Pressure Tooling', N'Hiflux High Pressure Tooling - Coning Tools Set - 60,000 psi - 3/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tooling.png', 366.00),
(N'CT-HF9', @CategoryId, N'Active', N'Hiflux High Pressure Tooling', N'Hiflux High Pressure Tooling - Coning Tools Set - 60,000 psi - 9/16"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tooling.png', 454.80),
(N'CT-LF4L', @CategoryId, N'Active', N'Hiflux High Pressure Tooling', N'Hiflux High Pressure Tooling - Coning Cutter - 20,000 psi - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tooling.png', 140.00),
(N'CT-LF6L', @CategoryId, N'Active', N'Hiflux High Pressure Tooling', N'Hiflux High Pressure Tooling - Coning Cutter - 20,000 psi - 3/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tooling.png', 140.00),
(N'CT-LF9L', @CategoryId, N'Active', N'Hiflux High Pressure Tooling', N'Hiflux High Pressure Tooling - Coning Cutter - 20,000 psi - 9/16"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tooling.png', 140.00),
(N'CT-HF4L', @CategoryId, N'Active', N'Hiflux High Pressure Tooling', N'Hiflux High Pressure Tooling - Coning Cutter - 60,000 psi - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tooling.png', 140.00),
(N'CT-HF6L', @CategoryId, N'Active', N'Hiflux High Pressure Tooling', N'Hiflux High Pressure Tooling - Coning Cutter - 60,000 psi - 3/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tooling.png', 140.00),
(N'CT-HF9L', @CategoryId, N'Active', N'Hiflux High Pressure Tooling', N'Hiflux High Pressure Tooling - Coning Cutter - 60,000 psi - 9/16"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tooling.png', 140.00),
(N'CT-LF4P', @CategoryId, N'Active', N'Hiflux High Pressure Tooling', N'Hiflux High Pressure Tooling - Coning Collet - 20,000 psi - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tooling.png', 81.60),
(N'CT-LF6P', @CategoryId, N'Active', N'Hiflux High Pressure Tooling', N'Hiflux High Pressure Tooling - Coning Collet - 20,000 psi - 3/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tooling.png', 81.60),
(N'CT-LF9P', @CategoryId, N'Active', N'Hiflux High Pressure Tooling', N'Hiflux High Pressure Tooling - Coning Collet - 20,000 psi - 9/16"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tooling.png', 81.60),
(N'CT-HF4P', @CategoryId, N'Active', N'Hiflux High Pressure Tooling', N'Hiflux High Pressure Tooling - Coning Collet - 60,000 psi - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tooling.png', 81.60),
(N'CT-HF6P', @CategoryId, N'Active', N'Hiflux High Pressure Tooling', N'Hiflux High Pressure Tooling - Coning Collet - 60,000 psi - 3/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tooling.png', 81.60),
(N'CT-HF9P', @CategoryId, N'Active', N'Hiflux High Pressure Tooling', N'Hiflux High Pressure Tooling - Coning Collet - 60,000 psi - 9/16"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tooling.png', 81.60),
(N'CT-MLF4', @CategoryId, N'Active', N'Hiflux High Pressure Tooling', N'Hiflux High Pressure Tooling - Threading Tool Set - 20,000 psi - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tooling.png', 234.00),
(N'CT-MLF6', @CategoryId, N'Active', N'Hiflux High Pressure Tooling', N'Hiflux High Pressure Tooling - Threading Tool Set - 20,000 psi - 3/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tooling.png', 234.00),
(N'CT-MLF9', @CategoryId, N'Active', N'Hiflux High Pressure Tooling', N'Hiflux High Pressure Tooling - Threading Tool Set - 20,000 psi - 9/16"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tooling.png', 234.00),
(N'CT-MHF4', @CategoryId, N'Active', N'Hiflux High Pressure Tooling', N'Hiflux High Pressure Tooling - Threading Tool Set - 60,000 psi - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tooling.png', 234.00),
(N'CT-MHF6', @CategoryId, N'Active', N'Hiflux High Pressure Tooling', N'Hiflux High Pressure Tooling - Threading Tool Set - 60,000 psi - 3/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tooling.png', 234.00),
(N'CT-MHF9', @CategoryId, N'Active', N'Hiflux High Pressure Tooling', N'Hiflux High Pressure Tooling - Threading Tool Set - 60,000 psi - 9/16"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tooling.png', 234.00),
(N'CT-MLF4P', @CategoryId, N'Active', N'Hiflux High Pressure Tooling', N'Hiflux High Pressure Tooling - Threading Guide Busing - 20,000 psi - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tooling.png', 40.80),
(N'CT-MLF6P', @CategoryId, N'Active', N'Hiflux High Pressure Tooling', N'Hiflux High Pressure Tooling - Threading Guide Busing - 20,000 psi - 3/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tooling.png', 40.80),
(N'CT-MLF9P', @CategoryId, N'Active', N'Hiflux High Pressure Tooling', N'Hiflux High Pressure Tooling - Threading Guide Busing - 20,000 psi - 9/16"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tooling.png', 40.80),
(N'CT-MHF4P', @CategoryId, N'Active', N'Hiflux High Pressure Tooling', N'Hiflux High Pressure Tooling - Threading Guide Busing - 60,000 psi - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tooling.png', 40.80),
(N'CT-MHF6P', @CategoryId, N'Active', N'Hiflux High Pressure Tooling', N'Hiflux High Pressure Tooling - Threading Guide Busing - 60,000 psi - 3/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tooling.png', 40.80),
(N'CT-MHF9P', @CategoryId, N'Active', N'Hiflux High Pressure Tooling', N'Hiflux High Pressure Tooling - Threading Guide Busing - 60,000 psi - 9/16"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tooling.png', 40.80),
(N'RTLF4', @CategoryId, N'Active', N'Hiflux High Pressure Tooling', N'Hiflux High Pressure Tooling - Reseating Tools - 20,000 psi - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tooling.png', 81.60),
(N'RTLF6', @CategoryId, N'Active', N'Hiflux High Pressure Tooling', N'Hiflux High Pressure Tooling - Reseating Tools - 20,000 psi - 3/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tooling.png', 94.80),
(N'RTLF9', @CategoryId, N'Active', N'Hiflux High Pressure Tooling', N'Hiflux High Pressure Tooling - Reseating Tools - 20,000 psi - 9/16"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tooling.png', 118.80),
(N'RTHF4', @CategoryId, N'Active', N'Hiflux High Pressure Tooling', N'Hiflux High Pressure Tooling - Reseating Tools - 60,000 psi - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tooling.png', 81.60),
(N'RTHF6', @CategoryId, N'Active', N'Hiflux High Pressure Tooling', N'Hiflux High Pressure Tooling - Reseating Tools - 60,000 psi - 3/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tooling.png', 94.80),
(N'RTHF9', @CategoryId, N'Active', N'Hiflux High Pressure Tooling', N'Hiflux High Pressure Tooling - Reseating Tools - 60,000 psi - 9/16"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tooling.png', 118.80);

INSERT INTO ProductFilterValues (ProductId, CategoryId, FilterId, Value)
SELECT p.ProductId, p.CategoryId, f.FilterId, v.Value
FROM CatalogProducts p
JOIN (VALUES
  (N'CT-LF4',N'Type',N'Coning Tools Set'),(N'CT-LF4',N'Pressure Rating',N'20,000 psi'),(N'CT-LF4',N'Tube Size',N'1/4"'),
  (N'CT-LF6',N'Type',N'Coning Tools Set'),(N'CT-LF6',N'Pressure Rating',N'20,000 psi'),(N'CT-LF6',N'Tube Size',N'3/8"'),
  (N'CT-LF9',N'Type',N'Coning Tools Set'),(N'CT-LF9',N'Pressure Rating',N'20,000 psi'),(N'CT-LF9',N'Tube Size',N'9/16"'),
  (N'CT-HF4',N'Type',N'Coning Tools Set'),(N'CT-HF4',N'Pressure Rating',N'60,000 psi'),(N'CT-HF4',N'Tube Size',N'1/4"'),
  (N'CT-HF6',N'Type',N'Coning Tools Set'),(N'CT-HF6',N'Pressure Rating',N'60,000 psi'),(N'CT-HF6',N'Tube Size',N'3/8"'),
  (N'CT-HF9',N'Type',N'Coning Tools Set'),(N'CT-HF9',N'Pressure Rating',N'60,000 psi'),(N'CT-HF9',N'Tube Size',N'9/16"'),
  (N'CT-LF4L',N'Type',N'Coning Cutter'),(N'CT-LF4L',N'Pressure Rating',N'20,000 psi'),(N'CT-LF4L',N'Tube Size',N'1/4"'),
  (N'CT-LF6L',N'Type',N'Coning Cutter'),(N'CT-LF6L',N'Pressure Rating',N'20,000 psi'),(N'CT-LF6L',N'Tube Size',N'3/8"'),
  (N'CT-LF9L',N'Type',N'Coning Cutter'),(N'CT-LF9L',N'Pressure Rating',N'20,000 psi'),(N'CT-LF9L',N'Tube Size',N'9/16"'),
  (N'CT-HF4L',N'Type',N'Coning Cutter'),(N'CT-HF4L',N'Pressure Rating',N'60,000 psi'),(N'CT-HF4L',N'Tube Size',N'1/4"'),
  (N'CT-HF6L',N'Type',N'Coning Cutter'),(N'CT-HF6L',N'Pressure Rating',N'60,000 psi'),(N'CT-HF6L',N'Tube Size',N'3/8"'),
  (N'CT-HF9L',N'Type',N'Coning Cutter'),(N'CT-HF9L',N'Pressure Rating',N'60,000 psi'),(N'CT-HF9L',N'Tube Size',N'9/16"'),
  (N'CT-LF4P',N'Type',N'Coning Collet'),(N'CT-LF4P',N'Pressure Rating',N'20,000 psi'),(N'CT-LF4P',N'Tube Size',N'1/4"'),
  (N'CT-LF6P',N'Type',N'Coning Collet'),(N'CT-LF6P',N'Pressure Rating',N'20,000 psi'),(N'CT-LF6P',N'Tube Size',N'3/8"'),
  (N'CT-LF9P',N'Type',N'Coning Collet'),(N'CT-LF9P',N'Pressure Rating',N'20,000 psi'),(N'CT-LF9P',N'Tube Size',N'9/16"'),
  (N'CT-HF4P',N'Type',N'Coning Collet'),(N'CT-HF4P',N'Pressure Rating',N'60,000 psi'),(N'CT-HF4P',N'Tube Size',N'1/4"'),
  (N'CT-HF6P',N'Type',N'Coning Collet'),(N'CT-HF6P',N'Pressure Rating',N'60,000 psi'),(N'CT-HF6P',N'Tube Size',N'3/8"'),
  (N'CT-HF9P',N'Type',N'Coning Collet'),(N'CT-HF9P',N'Pressure Rating',N'60,000 psi'),(N'CT-HF9P',N'Tube Size',N'9/16"'),
  (N'CT-MLF4',N'Type',N'Threading Tool Set'),(N'CT-MLF4',N'Pressure Rating',N'20,000 psi'),(N'CT-MLF4',N'Tube Size',N'1/4"'),
  (N'CT-MLF6',N'Type',N'Threading Tool Set'),(N'CT-MLF6',N'Pressure Rating',N'20,000 psi'),(N'CT-MLF6',N'Tube Size',N'3/8"'),
  (N'CT-MLF9',N'Type',N'Threading Tool Set'),(N'CT-MLF9',N'Pressure Rating',N'20,000 psi'),(N'CT-MLF9',N'Tube Size',N'9/16"'),
  (N'CT-MHF4',N'Type',N'Threading Tool Set'),(N'CT-MHF4',N'Pressure Rating',N'60,000 psi'),(N'CT-MHF4',N'Tube Size',N'1/4"'),
  (N'CT-MHF6',N'Type',N'Threading Tool Set'),(N'CT-MHF6',N'Pressure Rating',N'60,000 psi'),(N'CT-MHF6',N'Tube Size',N'3/8"'),
  (N'CT-MHF9',N'Type',N'Threading Tool Set'),(N'CT-MHF9',N'Pressure Rating',N'60,000 psi'),(N'CT-MHF9',N'Tube Size',N'9/16"'),
  (N'CT-MLF4P',N'Type',N'Threading Guide Busing'),(N'CT-MLF4P',N'Pressure Rating',N'20,000 psi'),(N'CT-MLF4P',N'Tube Size',N'1/4"'),
  (N'CT-MLF6P',N'Type',N'Threading Guide Busing'),(N'CT-MLF6P',N'Pressure Rating',N'20,000 psi'),(N'CT-MLF6P',N'Tube Size',N'3/8"'),
  (N'CT-MLF9P',N'Type',N'Threading Guide Busing'),(N'CT-MLF9P',N'Pressure Rating',N'20,000 psi'),(N'CT-MLF9P',N'Tube Size',N'9/16"'),
  (N'CT-MHF4P',N'Type',N'Threading Guide Busing'),(N'CT-MHF4P',N'Pressure Rating',N'60,000 psi'),(N'CT-MHF4P',N'Tube Size',N'1/4"'),
  (N'CT-MHF6P',N'Type',N'Threading Guide Busing'),(N'CT-MHF6P',N'Pressure Rating',N'60,000 psi'),(N'CT-MHF6P',N'Tube Size',N'3/8"'),
  (N'CT-MHF9P',N'Type',N'Threading Guide Busing'),(N'CT-MHF9P',N'Pressure Rating',N'60,000 psi'),(N'CT-MHF9P',N'Tube Size',N'9/16"'),
  (N'RTLF4',N'Type',N'Reseating Tools'),(N'RTLF4',N'Pressure Rating',N'20,000 psi'),(N'RTLF4',N'Tube Size',N'1/4"'),
  (N'RTLF6',N'Type',N'Reseating Tools'),(N'RTLF6',N'Pressure Rating',N'20,000 psi'),(N'RTLF6',N'Tube Size',N'3/8"'),
  (N'RTLF9',N'Type',N'Reseating Tools'),(N'RTLF9',N'Pressure Rating',N'20,000 psi'),(N'RTLF9',N'Tube Size',N'9/16"'),
  (N'RTHF4',N'Type',N'Reseating Tools'),(N'RTHF4',N'Pressure Rating',N'60,000 psi'),(N'RTHF4',N'Tube Size',N'1/4"'),
  (N'RTHF6',N'Type',N'Reseating Tools'),(N'RTHF6',N'Pressure Rating',N'60,000 psi'),(N'RTHF6',N'Tube Size',N'3/8"'),
  (N'RTHF9',N'Type',N'Reseating Tools'),(N'RTHF9',N'Pressure Rating',N'60,000 psi'),(N'RTHF9',N'Tube Size',N'9/16"')
) AS v(PartNumber, FilterName, Value) ON v.PartNumber = p.PartNumber
JOIN Filters f ON f.Name = v.FilterName WHERE p.CategoryId=@CategoryId;

SELECT COUNT(*) AS Products FROM CatalogProducts WHERE CategoryId=@CategoryId;
SELECT COUNT(*) AS FilterValues FROM ProductFilterValues WHERE CategoryId=@CategoryId;
