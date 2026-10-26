-- High Pressure Nipple - Ultra High Pressure products (30) + filter values. Run AFTER the info file.
-- Facets: Pressure Rating / Tube Size / Length.
DECLARE @SeriesName nvarchar(100) = N'High Pressure Nipple - Ultra High Pressure';
DECLARE @CategoryId int = (SELECT CategoryId FROM Categories WHERE Name = @SeriesName);

INSERT INTO Filters (Name) SELECT v.Name FROM (VALUES (N'Pressure Rating'),(N'Tube Size'),(N'Length')) AS v(Name)
WHERE NOT EXISTS (SELECT 1 FROM Filters f WHERE f.Name = v.Name);

INSERT INTO CategoryFilters (CategoryId, FilterId, SortOrder)
SELECT @CategoryId, f.FilterId, v.SortOrder
FROM (VALUES (N'Pressure Rating',0),(N'Tube Size',1),(N'Length',2)) AS v(FilterName, SortOrder)
JOIN Filters f ON f.Name = v.FilterName
WHERE NOT EXISTS (SELECT 1 FROM CategoryFilters cf WHERE cf.CategoryId=@CategoryId AND cf.FilterId=f.FilterId);

INSERT INTO CatalogProducts (PartNumber, CategoryId, ProductStatus, FamilyDescription, DetailDescription, ImageUrl, Price) VALUES
(N'N20S04-2.75IN', @CategoryId, N'Active', N'Hiflux High Pressure Nipple', N'Hiflux High Pressure Nipple - 20,000 psi - 1/4" - 2.75"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/nibul.png', 16.80),
(N'N20S04-6IN', @CategoryId, N'Active', N'Hiflux High Pressure Nipple', N'Hiflux High Pressure Nipple - 20,000 psi - 1/4" - 6"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/nibul.png', 22.80),
(N'N20S04-8IN', @CategoryId, N'Active', N'Hiflux High Pressure Nipple', N'Hiflux High Pressure Nipple - 20,000 psi - 1/4" - 8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/nibul.png', 24.00),
(N'N20S04-10IN', @CategoryId, N'Active', N'Hiflux High Pressure Nipple', N'Hiflux High Pressure Nipple - 20,000 psi - 1/4" - 10"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/nibul.png', 30.00),
(N'N20S04-12IN', @CategoryId, N'Active', N'Hiflux High Pressure Nipple', N'Hiflux High Pressure Nipple - 20,000 psi - 1/4" - 12"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/nibul.png', 36.00),
(N'N20S06-3IN', @CategoryId, N'Active', N'Hiflux High Pressure Nipple', N'Hiflux High Pressure Nipple - 20,000 psi - 3/8" - 3"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/nibul.png', 21.60),
(N'N20S06-6IN', @CategoryId, N'Active', N'Hiflux High Pressure Nipple', N'Hiflux High Pressure Nipple - 20,000 psi - 3/8" - 6"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/nibul.png', 31.20),
(N'N20S06-8IN', @CategoryId, N'Active', N'Hiflux High Pressure Nipple', N'Hiflux High Pressure Nipple - 20,000 psi - 3/8" - 8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/nibul.png', 36.00),
(N'N20S06-10IN', @CategoryId, N'Active', N'Hiflux High Pressure Nipple', N'Hiflux High Pressure Nipple - 20,000 psi - 3/8" - 10"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/nibul.png', 38.40),
(N'N20S06-12IN', @CategoryId, N'Active', N'Hiflux High Pressure Nipple', N'Hiflux High Pressure Nipple - 20,000 psi - 3/8" - 12"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/nibul.png', 43.20),
(N'N20S09-4IN', @CategoryId, N'Active', N'Hiflux High Pressure Nipple', N'Hiflux High Pressure Nipple - 20,000 psi - 9/16" - 4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/nibul.png', 36.00),
(N'N20S09-6IN', @CategoryId, N'Active', N'Hiflux High Pressure Nipple', N'Hiflux High Pressure Nipple - 20,000 psi - 9/16" - 6"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/nibul.png', 42.00),
(N'N20S09-8IN', @CategoryId, N'Active', N'Hiflux High Pressure Nipple', N'Hiflux High Pressure Nipple - 20,000 psi - 9/16" - 8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/nibul.png', 48.00),
(N'N20S09-10IN', @CategoryId, N'Active', N'Hiflux High Pressure Nipple', N'Hiflux High Pressure Nipple - 20,000 psi - 9/16" - 10"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/nibul.png', 58.80),
(N'N20S09-12IN', @CategoryId, N'Active', N'Hiflux High Pressure Nipple', N'Hiflux High Pressure Nipple - 20,000 psi - 9/16" - 12"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/nibul.png', 64.80),
(N'N60S04-2.75IN', @CategoryId, N'Active', N'Hiflux High Pressure Nipple', N'Hiflux High Pressure Nipple - 60,000 psi - 1/4" - 2.75"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/nibul.png', 16.80),
(N'N60S04-6IN', @CategoryId, N'Active', N'Hiflux High Pressure Nipple', N'Hiflux High Pressure Nipple - 60,000 psi - 1/4" - 6"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/nibul.png', 22.80),
(N'N60S04-8IN', @CategoryId, N'Active', N'Hiflux High Pressure Nipple', N'Hiflux High Pressure Nipple - 60,000 psi - 1/4" - 8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/nibul.png', 26.40),
(N'N60S04-10IN', @CategoryId, N'Active', N'Hiflux High Pressure Nipple', N'Hiflux High Pressure Nipple - 60,000 psi - 1/4" - 10"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/nibul.png', 32.40),
(N'N60S04-12IN', @CategoryId, N'Active', N'Hiflux High Pressure Nipple', N'Hiflux High Pressure Nipple - 60,000 psi - 1/4" - 12"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/nibul.png', 37.20),
(N'N60S06-3IN', @CategoryId, N'Active', N'Hiflux High Pressure Nipple', N'Hiflux High Pressure Nipple - 60,000 psi - 3/8" - 3"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/nibul.png', 22.80),
(N'N60S06-6IN', @CategoryId, N'Active', N'Hiflux High Pressure Nipple', N'Hiflux High Pressure Nipple - 60,000 psi - 3/8" - 6"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/nibul.png', 32.40),
(N'N60S06-8IN', @CategoryId, N'Active', N'Hiflux High Pressure Nipple', N'Hiflux High Pressure Nipple - 60,000 psi - 3/8" - 8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/nibul.png', 37.20),
(N'N60S06-10IN', @CategoryId, N'Active', N'Hiflux High Pressure Nipple', N'Hiflux High Pressure Nipple - 60,000 psi - 3/8" - 10"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/nibul.png', 39.60),
(N'N60S06-12IN', @CategoryId, N'Active', N'Hiflux High Pressure Nipple', N'Hiflux High Pressure Nipple - 60,000 psi - 3/8" - 12"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/nibul.png', 43.20),
(N'N60S09-4IN', @CategoryId, N'Active', N'Hiflux High Pressure Nipple', N'Hiflux High Pressure Nipple - 60,000 psi - 9/16" - 4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/nibul.png', 37.20),
(N'N60S09-6IN', @CategoryId, N'Active', N'Hiflux High Pressure Nipple', N'Hiflux High Pressure Nipple - 60,000 psi - 9/16" - 6"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/nibul.png', 44.40),
(N'N60S09-8IN', @CategoryId, N'Active', N'Hiflux High Pressure Nipple', N'Hiflux High Pressure Nipple - 60,000 psi - 9/16" - 8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/nibul.png', 46.80),
(N'N60S09-10IN', @CategoryId, N'Active', N'Hiflux High Pressure Nipple', N'Hiflux High Pressure Nipple - 60,000 psi - 9/16" - 10"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/nibul.png', 58.80),
(N'N60S09-12IN', @CategoryId, N'Active', N'Hiflux High Pressure Nipple', N'Hiflux High Pressure Nipple - 60,000 psi - 9/16" - 12"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/nibul.png', 66.00);

INSERT INTO ProductFilterValues (ProductId, CategoryId, FilterId, Value)
SELECT p.ProductId, p.CategoryId, f.FilterId, v.Value
FROM CatalogProducts p
JOIN (VALUES
  (N'N20S04-2.75IN',N'Pressure Rating',N'20,000 psi'),(N'N20S04-2.75IN',N'Tube Size',N'1/4"'),(N'N20S04-2.75IN',N'Length',N'2.75"'),
  (N'N20S04-6IN',N'Pressure Rating',N'20,000 psi'),(N'N20S04-6IN',N'Tube Size',N'1/4"'),(N'N20S04-6IN',N'Length',N'6"'),
  (N'N20S04-8IN',N'Pressure Rating',N'20,000 psi'),(N'N20S04-8IN',N'Tube Size',N'1/4"'),(N'N20S04-8IN',N'Length',N'8"'),
  (N'N20S04-10IN',N'Pressure Rating',N'20,000 psi'),(N'N20S04-10IN',N'Tube Size',N'1/4"'),(N'N20S04-10IN',N'Length',N'10"'),
  (N'N20S04-12IN',N'Pressure Rating',N'20,000 psi'),(N'N20S04-12IN',N'Tube Size',N'1/4"'),(N'N20S04-12IN',N'Length',N'12"'),
  (N'N20S06-3IN',N'Pressure Rating',N'20,000 psi'),(N'N20S06-3IN',N'Tube Size',N'3/8"'),(N'N20S06-3IN',N'Length',N'3"'),
  (N'N20S06-6IN',N'Pressure Rating',N'20,000 psi'),(N'N20S06-6IN',N'Tube Size',N'3/8"'),(N'N20S06-6IN',N'Length',N'6"'),
  (N'N20S06-8IN',N'Pressure Rating',N'20,000 psi'),(N'N20S06-8IN',N'Tube Size',N'3/8"'),(N'N20S06-8IN',N'Length',N'8"'),
  (N'N20S06-10IN',N'Pressure Rating',N'20,000 psi'),(N'N20S06-10IN',N'Tube Size',N'3/8"'),(N'N20S06-10IN',N'Length',N'10"'),
  (N'N20S06-12IN',N'Pressure Rating',N'20,000 psi'),(N'N20S06-12IN',N'Tube Size',N'3/8"'),(N'N20S06-12IN',N'Length',N'12"'),
  (N'N20S09-4IN',N'Pressure Rating',N'20,000 psi'),(N'N20S09-4IN',N'Tube Size',N'9/16"'),(N'N20S09-4IN',N'Length',N'4"'),
  (N'N20S09-6IN',N'Pressure Rating',N'20,000 psi'),(N'N20S09-6IN',N'Tube Size',N'9/16"'),(N'N20S09-6IN',N'Length',N'6"'),
  (N'N20S09-8IN',N'Pressure Rating',N'20,000 psi'),(N'N20S09-8IN',N'Tube Size',N'9/16"'),(N'N20S09-8IN',N'Length',N'8"'),
  (N'N20S09-10IN',N'Pressure Rating',N'20,000 psi'),(N'N20S09-10IN',N'Tube Size',N'9/16"'),(N'N20S09-10IN',N'Length',N'10"'),
  (N'N20S09-12IN',N'Pressure Rating',N'20,000 psi'),(N'N20S09-12IN',N'Tube Size',N'9/16"'),(N'N20S09-12IN',N'Length',N'12"'),
  (N'N60S04-2.75IN',N'Pressure Rating',N'60,000 psi'),(N'N60S04-2.75IN',N'Tube Size',N'1/4"'),(N'N60S04-2.75IN',N'Length',N'2.75"'),
  (N'N60S04-6IN',N'Pressure Rating',N'60,000 psi'),(N'N60S04-6IN',N'Tube Size',N'1/4"'),(N'N60S04-6IN',N'Length',N'6"'),
  (N'N60S04-8IN',N'Pressure Rating',N'60,000 psi'),(N'N60S04-8IN',N'Tube Size',N'1/4"'),(N'N60S04-8IN',N'Length',N'8"'),
  (N'N60S04-10IN',N'Pressure Rating',N'60,000 psi'),(N'N60S04-10IN',N'Tube Size',N'1/4"'),(N'N60S04-10IN',N'Length',N'10"'),
  (N'N60S04-12IN',N'Pressure Rating',N'60,000 psi'),(N'N60S04-12IN',N'Tube Size',N'1/4"'),(N'N60S04-12IN',N'Length',N'12"'),
  (N'N60S06-3IN',N'Pressure Rating',N'60,000 psi'),(N'N60S06-3IN',N'Tube Size',N'3/8"'),(N'N60S06-3IN',N'Length',N'3"'),
  (N'N60S06-6IN',N'Pressure Rating',N'60,000 psi'),(N'N60S06-6IN',N'Tube Size',N'3/8"'),(N'N60S06-6IN',N'Length',N'6"'),
  (N'N60S06-8IN',N'Pressure Rating',N'60,000 psi'),(N'N60S06-8IN',N'Tube Size',N'3/8"'),(N'N60S06-8IN',N'Length',N'8"'),
  (N'N60S06-10IN',N'Pressure Rating',N'60,000 psi'),(N'N60S06-10IN',N'Tube Size',N'3/8"'),(N'N60S06-10IN',N'Length',N'10"'),
  (N'N60S06-12IN',N'Pressure Rating',N'60,000 psi'),(N'N60S06-12IN',N'Tube Size',N'3/8"'),(N'N60S06-12IN',N'Length',N'12"'),
  (N'N60S09-4IN',N'Pressure Rating',N'60,000 psi'),(N'N60S09-4IN',N'Tube Size',N'9/16"'),(N'N60S09-4IN',N'Length',N'4"'),
  (N'N60S09-6IN',N'Pressure Rating',N'60,000 psi'),(N'N60S09-6IN',N'Tube Size',N'9/16"'),(N'N60S09-6IN',N'Length',N'6"'),
  (N'N60S09-8IN',N'Pressure Rating',N'60,000 psi'),(N'N60S09-8IN',N'Tube Size',N'9/16"'),(N'N60S09-8IN',N'Length',N'8"'),
  (N'N60S09-10IN',N'Pressure Rating',N'60,000 psi'),(N'N60S09-10IN',N'Tube Size',N'9/16"'),(N'N60S09-10IN',N'Length',N'10"'),
  (N'N60S09-12IN',N'Pressure Rating',N'60,000 psi'),(N'N60S09-12IN',N'Tube Size',N'9/16"'),(N'N60S09-12IN',N'Length',N'12"')
) AS v(PartNumber, FilterName, Value) ON v.PartNumber = p.PartNumber
JOIN Filters f ON f.Name = v.FilterName WHERE p.CategoryId=@CategoryId;

SELECT COUNT(*) AS Products FROM CatalogProducts WHERE CategoryId=@CategoryId;
SELECT COUNT(*) AS FilterValues FROM ProductFilterValues WHERE CategoryId=@CategoryId;
