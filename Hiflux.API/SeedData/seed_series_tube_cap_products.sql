-- High Pressure Tube Cap - High Pressure products (12) + filter values. Run AFTER the info file.
-- Facets: Pressure Rating / Tube Size. Derived specs (port/orifice/dimensions) are not stored as filters.
DECLARE @SeriesName nvarchar(100) = N'High Pressure Tube Cap - High Pressure';
DECLARE @CategoryId int = (SELECT CategoryId FROM Categories WHERE Name = @SeriesName);

INSERT INTO Filters (Name) SELECT v.Name FROM (VALUES (N'Pressure Rating'),(N'Tube Size')) AS v(Name)
WHERE NOT EXISTS (SELECT 1 FROM Filters f WHERE f.Name = v.Name);

INSERT INTO CategoryFilters (CategoryId, FilterId, SortOrder)
SELECT @CategoryId, f.FilterId, v.SortOrder
FROM (VALUES (N'Pressure Rating',0),(N'Tube Size',1)) AS v(FilterName, SortOrder)
JOIN Filters f ON f.Name = v.FilterName
WHERE NOT EXISTS (SELECT 1 FROM CategoryFilters cf WHERE cf.CategoryId=@CategoryId AND cf.FilterId=f.FilterId);

INSERT INTO CatalogProducts (PartNumber, CategoryId, ProductStatus, FamilyDescription, DetailDescription, ImageUrl, Price) VALUES
(N'FATC15S02', @CategoryId, N'Active', N'Hiflux High Pressure Tube Cap', N'Hiflux High Pressure Tube Cap - 15,000 psi - 1/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tube-cap.png', NULL),
(N'FATC15S04', @CategoryId, N'Active', N'Hiflux High Pressure Tube Cap', N'Hiflux High Pressure Tube Cap - 15,000 psi - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tube-cap.png', NULL),
(N'FATC15S06', @CategoryId, N'Active', N'Hiflux High Pressure Tube Cap', N'Hiflux High Pressure Tube Cap - 15,000 psi - 3/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tube-cap.png', NULL),
(N'FATC10S08', @CategoryId, N'Active', N'Hiflux High Pressure Tube Cap', N'Hiflux High Pressure Tube Cap - 10,000 psi - 1/2"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tube-cap.png', NULL),
(N'FATC20S04', @CategoryId, N'Active', N'Hiflux High Pressure Tube Cap', N'Hiflux High Pressure Tube Cap - 20,000 psi - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tube-cap.png', NULL),
(N'FATC20S06', @CategoryId, N'Active', N'Hiflux High Pressure Tube Cap', N'Hiflux High Pressure Tube Cap - 20,000 psi - 3/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tube-cap.png', NULL),
(N'FATC20S09', @CategoryId, N'Active', N'Hiflux High Pressure Tube Cap', N'Hiflux High Pressure Tube Cap - 20,000 psi - 9/16"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tube-cap.png', NULL),
(N'FATC20S12', @CategoryId, N'Active', N'Hiflux High Pressure Tube Cap', N'Hiflux High Pressure Tube Cap - 20,000 psi - 3/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tube-cap.png', NULL),
(N'FATC20S16', @CategoryId, N'Active', N'Hiflux High Pressure Tube Cap', N'Hiflux High Pressure Tube Cap - 20,000 psi - 1"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tube-cap.png', NULL),
(N'FATC20S04-60K', @CategoryId, N'Active', N'Hiflux High Pressure Tube Cap', N'Hiflux High Pressure Tube Cap - 60,000 psi - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tube-cap.png', NULL),
(N'FATC20S06-60K', @CategoryId, N'Active', N'Hiflux High Pressure Tube Cap', N'Hiflux High Pressure Tube Cap - 60,000 psi - 3/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tube-cap.png', NULL),
(N'FATC20S09-60K', @CategoryId, N'Active', N'Hiflux High Pressure Tube Cap', N'Hiflux High Pressure Tube Cap - 60,000 psi - 9/16"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tube-cap.png', NULL);

INSERT INTO ProductFilterValues (ProductId, CategoryId, FilterId, Value)
SELECT p.ProductId, p.CategoryId, f.FilterId, v.Value
FROM CatalogProducts p
JOIN (VALUES
  (N'FATC15S02',N'Pressure Rating',N'15,000 psi'),(N'FATC15S02',N'Tube Size',N'1/8"'),
  (N'FATC15S04',N'Pressure Rating',N'15,000 psi'),(N'FATC15S04',N'Tube Size',N'1/4"'),
  (N'FATC15S06',N'Pressure Rating',N'15,000 psi'),(N'FATC15S06',N'Tube Size',N'3/8"'),
  (N'FATC10S08',N'Pressure Rating',N'10,000 psi'),(N'FATC10S08',N'Tube Size',N'1/2"'),
  (N'FATC20S04',N'Pressure Rating',N'20,000 psi'),(N'FATC20S04',N'Tube Size',N'1/4"'),
  (N'FATC20S06',N'Pressure Rating',N'20,000 psi'),(N'FATC20S06',N'Tube Size',N'3/8"'),
  (N'FATC20S09',N'Pressure Rating',N'20,000 psi'),(N'FATC20S09',N'Tube Size',N'9/16"'),
  (N'FATC20S12',N'Pressure Rating',N'20,000 psi'),(N'FATC20S12',N'Tube Size',N'3/4"'),
  (N'FATC20S16',N'Pressure Rating',N'20,000 psi'),(N'FATC20S16',N'Tube Size',N'1"'),
  (N'FATC20S04-60K',N'Pressure Rating',N'60,000 psi'),(N'FATC20S04-60K',N'Tube Size',N'1/4"'),
  (N'FATC20S06-60K',N'Pressure Rating',N'60,000 psi'),(N'FATC20S06-60K',N'Tube Size',N'3/8"'),
  (N'FATC20S09-60K',N'Pressure Rating',N'60,000 psi'),(N'FATC20S09-60K',N'Tube Size',N'9/16"')
) AS v(PartNumber, FilterName, Value) ON v.PartNumber = p.PartNumber
JOIN Filters f ON f.Name = v.FilterName WHERE p.CategoryId=@CategoryId;

SELECT COUNT(*) AS Products FROM CatalogProducts WHERE CategoryId=@CategoryId;
SELECT COUNT(*) AS FilterValues FROM ProductFilterValues WHERE CategoryId=@CategoryId;
