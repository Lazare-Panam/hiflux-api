-- High Pressure Tube - Ultra Pressure products (17) + filter values. Run AFTER the info file.
-- Facets: Pressure Rating / Tube Size / Length.
DECLARE @SeriesName nvarchar(100) = N'High Pressure Tube - Ultra Pressure';
DECLARE @CategoryId int = (SELECT CategoryId FROM Categories WHERE Name = @SeriesName);

INSERT INTO Filters (Name) SELECT v.Name FROM (VALUES (N'Pressure Rating'),(N'Tube Size'),(N'Length')) AS v(Name)
WHERE NOT EXISTS (SELECT 1 FROM Filters f WHERE f.Name = v.Name);

INSERT INTO CategoryFilters (CategoryId, FilterId, SortOrder)
SELECT @CategoryId, f.FilterId, v.SortOrder
FROM (VALUES (N'Pressure Rating',0),(N'Tube Size',1),(N'Length',2)) AS v(FilterName, SortOrder)
JOIN Filters f ON f.Name = v.FilterName
WHERE NOT EXISTS (SELECT 1 FROM CategoryFilters cf WHERE cf.CategoryId=@CategoryId AND cf.FilterId=f.FilterId);

INSERT INTO CatalogProducts (PartNumber, CategoryId, ProductStatus, FamilyDescription, DetailDescription, ImageUrl, Price) VALUES
(N'T100S04', @CategoryId, N'Active', N'Hiflux High Pressure Tube', N'Hiflux High Pressure Tube - 100,000 psi - 1/4" - 3M', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tube.png', NULL),
(N'T60S04', @CategoryId, N'Active', N'Hiflux High Pressure Tube', N'Hiflux High Pressure Tube - 60,000 psi - 1/4" - 3M', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tube.png', NULL),
(N'T60S06', @CategoryId, N'Active', N'Hiflux High Pressure Tube', N'Hiflux High Pressure Tube - 60,000 psi - 3/8" - 3M', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tube.png', NULL),
(N'T60S09', @CategoryId, N'Active', N'Hiflux High Pressure Tube', N'Hiflux High Pressure Tube - 60,000 psi - 9/16" - 3M', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tube.png', NULL),
(N'T11S04', @CategoryId, N'Active', N'Hiflux High Pressure Tube', N'Hiflux High Pressure Tube - 15,000 psi - 1/4" - 3M', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tube.png', NULL),
(N'T20S38', @CategoryId, N'Active', N'Hiflux High Pressure Tube', N'Hiflux High Pressure Tube - 20,000 psi - 3/8" - 3M', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tube.png', NULL),
(N'T20S34', @CategoryId, N'Active', N'Hiflux High Pressure Tube', N'Hiflux High Pressure Tube - 20,000 psi - 3/4" - 3M', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tube.png', NULL),
(N'T20S1', @CategoryId, N'Active', N'Hiflux High Pressure Tube', N'Hiflux High Pressure Tube - 20,000 psi - 1" - 4M', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tube.png', 818.89),
(N'T15S38', @CategoryId, N'Active', N'Hiflux High Pressure Tube', N'Hiflux High Pressure Tube - 15,000 psi - 3/8" - 3M', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tube.png', NULL),
(N'T11500S18', @CategoryId, N'Active', N'Hiflux High Pressure Tube', N'Hiflux High Pressure Tube - 11,500 psi - 1/8" - 3M', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tube.png', NULL),
(N'T20S04-6M', @CategoryId, N'Active', N'Hiflux High Pressure Tube', N'Hiflux High Pressure Tube - 20,000 psi - 1/4" - 6M', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tube.png', 266.93),
(N'T20S06-6M', @CategoryId, N'Active', N'Hiflux High Pressure Tube', N'Hiflux High Pressure Tube - 20,000 psi - 3/8" - 6M', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tube.png', 328.35),
(N'T20S09-6M', @CategoryId, N'Active', N'Hiflux High Pressure Tube', N'Hiflux High Pressure Tube - 20,000 psi - 9/16" - 6M', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tube.png', 519.69),
(N'T20S12-6M', @CategoryId, N'Active', N'Hiflux High Pressure Tube', N'Hiflux High Pressure Tube - 20,000 psi - 3/4" - 6M', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tube.png', 753.54),
(N'T60S04-6M', @CategoryId, N'Active', N'Hiflux High Pressure Tube', N'Hiflux High Pressure Tube - 60,000 psi - 1/4" - 6M', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tube.png', 259.84),
(N'T60S06-6M', @CategoryId, N'Active', N'Hiflux High Pressure Tube', N'Hiflux High Pressure Tube - 60,000 psi - 3/8" - 6M', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tube.png', 411.02),
(N'T60S09-6M', @CategoryId, N'Active', N'Hiflux High Pressure Tube', N'Hiflux High Pressure Tube - 60,000 psi - 9/16" - 6M', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/tube.png', 655.51);

INSERT INTO ProductFilterValues (ProductId, CategoryId, FilterId, Value)
SELECT p.ProductId, p.CategoryId, f.FilterId, v.Value
FROM CatalogProducts p
JOIN (VALUES
  (N'T100S04',N'Pressure Rating',N'100,000 psi'),(N'T100S04',N'Tube Size',N'1/4"'),(N'T100S04',N'Length',N'3M'),
  (N'T60S04',N'Pressure Rating',N'60,000 psi'),(N'T60S04',N'Tube Size',N'1/4"'),(N'T60S04',N'Length',N'3M'),
  (N'T60S06',N'Pressure Rating',N'60,000 psi'),(N'T60S06',N'Tube Size',N'3/8"'),(N'T60S06',N'Length',N'3M'),
  (N'T60S09',N'Pressure Rating',N'60,000 psi'),(N'T60S09',N'Tube Size',N'9/16"'),(N'T60S09',N'Length',N'3M'),
  (N'T11S04',N'Pressure Rating',N'15,000 psi'),(N'T11S04',N'Tube Size',N'1/4"'),(N'T11S04',N'Length',N'3M'),
  (N'T20S38',N'Pressure Rating',N'20,000 psi'),(N'T20S38',N'Tube Size',N'3/8"'),(N'T20S38',N'Length',N'3M'),
  (N'T20S34',N'Pressure Rating',N'20,000 psi'),(N'T20S34',N'Tube Size',N'3/4"'),(N'T20S34',N'Length',N'3M'),
  (N'T20S1',N'Pressure Rating',N'20,000 psi'),(N'T20S1',N'Tube Size',N'1"'),(N'T20S1',N'Length',N'4M'),
  (N'T15S38',N'Pressure Rating',N'15,000 psi'),(N'T15S38',N'Tube Size',N'3/8"'),(N'T15S38',N'Length',N'3M'),
  (N'T11500S18',N'Pressure Rating',N'11,500 psi'),(N'T11500S18',N'Tube Size',N'1/8"'),(N'T11500S18',N'Length',N'3M'),
  (N'T20S04-6M',N'Pressure Rating',N'20,000 psi'),(N'T20S04-6M',N'Tube Size',N'1/4"'),(N'T20S04-6M',N'Length',N'6M'),
  (N'T20S06-6M',N'Pressure Rating',N'20,000 psi'),(N'T20S06-6M',N'Tube Size',N'3/8"'),(N'T20S06-6M',N'Length',N'6M'),
  (N'T20S09-6M',N'Pressure Rating',N'20,000 psi'),(N'T20S09-6M',N'Tube Size',N'9/16"'),(N'T20S09-6M',N'Length',N'6M'),
  (N'T20S12-6M',N'Pressure Rating',N'20,000 psi'),(N'T20S12-6M',N'Tube Size',N'3/4"'),(N'T20S12-6M',N'Length',N'6M'),
  (N'T60S04-6M',N'Pressure Rating',N'60,000 psi'),(N'T60S04-6M',N'Tube Size',N'1/4"'),(N'T60S04-6M',N'Length',N'6M'),
  (N'T60S06-6M',N'Pressure Rating',N'60,000 psi'),(N'T60S06-6M',N'Tube Size',N'3/8"'),(N'T60S06-6M',N'Length',N'6M'),
  (N'T60S09-6M',N'Pressure Rating',N'60,000 psi'),(N'T60S09-6M',N'Tube Size',N'9/16"'),(N'T60S09-6M',N'Length',N'6M')
) AS v(PartNumber, FilterName, Value) ON v.PartNumber = p.PartNumber
JOIN Filters f ON f.Name = v.FilterName WHERE p.CategoryId=@CategoryId;

SELECT COUNT(*) AS Products FROM CatalogProducts WHERE CategoryId=@CategoryId;
SELECT COUNT(*) AS FilterValues FROM ProductFilterValues WHERE CategoryId=@CategoryId;
