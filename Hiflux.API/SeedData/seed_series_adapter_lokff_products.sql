-- High Pressure Adapter - LOK(Female) to Female products (30) + filter values. Run AFTER the info file. Source: Mongo product_variants.
DECLARE @SeriesName nvarchar(100) = N'High Pressure Adapter - LOK(Female) to Female';
DECLARE @CategoryId int = (SELECT CategoryId FROM Categories WHERE Name = @SeriesName);

INSERT INTO Filters (Name) SELECT v.Name FROM (VALUES (N'LOK Tube Size'),(N'Female Port')) AS v(Name)
WHERE NOT EXISTS (SELECT 1 FROM Filters f WHERE f.Name = v.Name);

INSERT INTO CategoryFilters (CategoryId, FilterId, SortOrder)
SELECT @CategoryId, f.FilterId, v.SortOrder
FROM (VALUES (N'LOK Tube Size',0),(N'Female Port',1)) AS v(FilterName, SortOrder)
JOIN Filters f ON f.Name = v.FilterName
WHERE NOT EXISTS (SELECT 1 FROM CategoryFilters cf WHERE cf.CategoryId=@CategoryId AND cf.FilterId=f.FilterId);

INSERT INTO CatalogProducts (PartNumber, CategoryId, ProductStatus, FamilyDescription, DetailDescription, ImageUrl, Price) VALUES
(N'ALOKF02-020F04', @CategoryId, N'Active', N'Hiflux High Pressure LOK Adapter', N'Hiflux High Pressure LOK Adapter - 1/8" / 20,000 psi, 1/4" (H2004)', N'https://pblol2.blob.core.windows.net/hiflux/union-adapters/hpa-a-20k.png', NULL),
(N'ALOKF02-020F06', @CategoryId, N'Active', N'Hiflux High Pressure LOK Adapter', N'Hiflux High Pressure LOK Adapter - 1/8" / 20,000 psi, 3/8" (H2006)', N'https://pblol2.blob.core.windows.net/hiflux/union-adapters/hpa-a-20k.png', NULL),
(N'ALOKF02-020F09', @CategoryId, N'Active', N'Hiflux High Pressure LOK Adapter', N'Hiflux High Pressure LOK Adapter - 1/8" / 20,000 psi, 9/16" (H2009)', N'https://pblol2.blob.core.windows.net/hiflux/union-adapters/hpa-a-20k.png', NULL),
(N'ALOKF02-020F12', @CategoryId, N'Active', N'Hiflux High Pressure LOK Adapter', N'Hiflux High Pressure LOK Adapter - 1/8" / 20,000 psi, 3/4" (H2012)', N'https://pblol2.blob.core.windows.net/hiflux/union-adapters/hpa-a-20k.png', NULL),
(N'ALOKF02-020F16', @CategoryId, N'Active', N'Hiflux High Pressure LOK Adapter', N'Hiflux High Pressure LOK Adapter - 1/8" / 20,000 psi, 1" (H2016)', N'https://pblol2.blob.core.windows.net/hiflux/union-adapters/hpa-a-20k.png', NULL),
(N'ALOKF04-020F04', @CategoryId, N'Active', N'Hiflux High Pressure LOK Adapter', N'Hiflux High Pressure LOK Adapter - 1/4" / 20,000 psi, 1/4" (H2004)', N'https://pblol2.blob.core.windows.net/hiflux/union-adapters/hpa-a-20k.png', NULL),
(N'ALOKF04-020F06', @CategoryId, N'Active', N'Hiflux High Pressure LOK Adapter', N'Hiflux High Pressure LOK Adapter - 1/4" / 20,000 psi, 3/8" (H2006)', N'https://pblol2.blob.core.windows.net/hiflux/union-adapters/hpa-a-20k.png', NULL),
(N'ALOKF04-020F09', @CategoryId, N'Active', N'Hiflux High Pressure LOK Adapter', N'Hiflux High Pressure LOK Adapter - 1/4" / 20,000 psi, 9/16" (H2009)', N'https://pblol2.blob.core.windows.net/hiflux/union-adapters/hpa-a-20k.png', NULL),
(N'ALOKF04-020F12', @CategoryId, N'Active', N'Hiflux High Pressure LOK Adapter', N'Hiflux High Pressure LOK Adapter - 1/4" / 20,000 psi, 3/4" (H2012)', N'https://pblol2.blob.core.windows.net/hiflux/union-adapters/hpa-a-20k.png', NULL),
(N'ALOKF04-020F16', @CategoryId, N'Active', N'Hiflux High Pressure LOK Adapter', N'Hiflux High Pressure LOK Adapter - 1/4" / 20,000 psi, 1" (H2016)', N'https://pblol2.blob.core.windows.net/hiflux/union-adapters/hpa-a-20k.png', NULL),
(N'ALOKF06-020F04', @CategoryId, N'Active', N'Hiflux High Pressure LOK Adapter', N'Hiflux High Pressure LOK Adapter - 3/8" / 20,000 psi, 1/4" (H2004)', N'https://pblol2.blob.core.windows.net/hiflux/union-adapters/hpa-a-20k.png', NULL),
(N'ALOKF06-020F06', @CategoryId, N'Active', N'Hiflux High Pressure LOK Adapter', N'Hiflux High Pressure LOK Adapter - 3/8" / 20,000 psi, 3/8" (H2006)', N'https://pblol2.blob.core.windows.net/hiflux/union-adapters/hpa-a-20k.png', NULL),
(N'ALOKF06-020F09', @CategoryId, N'Active', N'Hiflux High Pressure LOK Adapter', N'Hiflux High Pressure LOK Adapter - 3/8" / 20,000 psi, 9/16" (H2009)', N'https://pblol2.blob.core.windows.net/hiflux/union-adapters/hpa-a-20k.png', NULL),
(N'ALOKF06-020F12', @CategoryId, N'Active', N'Hiflux High Pressure LOK Adapter', N'Hiflux High Pressure LOK Adapter - 3/8" / 20,000 psi, 3/4" (H2012)', N'https://pblol2.blob.core.windows.net/hiflux/union-adapters/hpa-a-20k.png', NULL),
(N'ALOKF06-020F16', @CategoryId, N'Active', N'Hiflux High Pressure LOK Adapter', N'Hiflux High Pressure LOK Adapter - 3/8" / 20,000 psi, 1" (H2016)', N'https://pblol2.blob.core.windows.net/hiflux/union-adapters/hpa-a-20k.png', NULL),
(N'ALOKF08-020F04', @CategoryId, N'Active', N'Hiflux High Pressure LOK Adapter', N'Hiflux High Pressure LOK Adapter - 1/2" / 20,000 psi, 1/4" (H2004)', N'https://pblol2.blob.core.windows.net/hiflux/union-adapters/hpa-a-20k.png', NULL),
(N'ALOKF08-020F06', @CategoryId, N'Active', N'Hiflux High Pressure LOK Adapter', N'Hiflux High Pressure LOK Adapter - 1/2" / 20,000 psi, 3/8" (H2006)', N'https://pblol2.blob.core.windows.net/hiflux/union-adapters/hpa-a-20k.png', NULL),
(N'ALOKF08-020F09', @CategoryId, N'Active', N'Hiflux High Pressure LOK Adapter', N'Hiflux High Pressure LOK Adapter - 1/2" / 20,000 psi, 9/16" (H2009)', N'https://pblol2.blob.core.windows.net/hiflux/union-adapters/hpa-a-20k.png', NULL),
(N'ALOKF08-020F12', @CategoryId, N'Active', N'Hiflux High Pressure LOK Adapter', N'Hiflux High Pressure LOK Adapter - 1/2" / 20,000 psi, 3/4" (H2012)', N'https://pblol2.blob.core.windows.net/hiflux/union-adapters/hpa-a-20k.png', NULL),
(N'ALOKF08-020F16', @CategoryId, N'Active', N'Hiflux High Pressure LOK Adapter', N'Hiflux High Pressure LOK Adapter - 1/2" / 20,000 psi, 1" (H2016)', N'https://pblol2.blob.core.windows.net/hiflux/union-adapters/hpa-a-20k.png', NULL),
(N'ALOKF12-020F04', @CategoryId, N'Active', N'Hiflux High Pressure LOK Adapter', N'Hiflux High Pressure LOK Adapter - 3/4" / 20,000 psi, 1/4" (H2004)', N'https://pblol2.blob.core.windows.net/hiflux/union-adapters/hpa-a-20k.png', NULL),
(N'ALOKF12-020F06', @CategoryId, N'Active', N'Hiflux High Pressure LOK Adapter', N'Hiflux High Pressure LOK Adapter - 3/4" / 20,000 psi, 3/8" (H2006)', N'https://pblol2.blob.core.windows.net/hiflux/union-adapters/hpa-a-20k.png', NULL),
(N'ALOKF12-020F09', @CategoryId, N'Active', N'Hiflux High Pressure LOK Adapter', N'Hiflux High Pressure LOK Adapter - 3/4" / 20,000 psi, 9/16" (H2009)', N'https://pblol2.blob.core.windows.net/hiflux/union-adapters/hpa-a-20k.png', NULL),
(N'ALOKF12-020F12', @CategoryId, N'Active', N'Hiflux High Pressure LOK Adapter', N'Hiflux High Pressure LOK Adapter - 3/4" / 20,000 psi, 3/4" (H2012)', N'https://pblol2.blob.core.windows.net/hiflux/union-adapters/hpa-a-20k.png', NULL),
(N'ALOKF12-020F16', @CategoryId, N'Active', N'Hiflux High Pressure LOK Adapter', N'Hiflux High Pressure LOK Adapter - 3/4" / 20,000 psi, 1" (H2016)', N'https://pblol2.blob.core.windows.net/hiflux/union-adapters/hpa-a-20k.png', NULL),
(N'ALOKF16-020F04', @CategoryId, N'Active', N'Hiflux High Pressure LOK Adapter', N'Hiflux High Pressure LOK Adapter - 1" / 20,000 psi, 1/4" (H2004)', N'https://pblol2.blob.core.windows.net/hiflux/union-adapters/hpa-a-20k.png', NULL),
(N'ALOKF16-020F06', @CategoryId, N'Active', N'Hiflux High Pressure LOK Adapter', N'Hiflux High Pressure LOK Adapter - 1" / 20,000 psi, 3/8" (H2006)', N'https://pblol2.blob.core.windows.net/hiflux/union-adapters/hpa-a-20k.png', NULL),
(N'ALOKF16-020F09', @CategoryId, N'Active', N'Hiflux High Pressure LOK Adapter', N'Hiflux High Pressure LOK Adapter - 1" / 20,000 psi, 9/16" (H2009)', N'https://pblol2.blob.core.windows.net/hiflux/union-adapters/hpa-a-20k.png', NULL),
(N'ALOKF16-020F12', @CategoryId, N'Active', N'Hiflux High Pressure LOK Adapter', N'Hiflux High Pressure LOK Adapter - 1" / 20,000 psi, 3/4" (H2012)', N'https://pblol2.blob.core.windows.net/hiflux/union-adapters/hpa-a-20k.png', NULL),
(N'ALOKF16-020F16', @CategoryId, N'Active', N'Hiflux High Pressure LOK Adapter', N'Hiflux High Pressure LOK Adapter - 1" / 20,000 psi, 1" (H2016)', N'https://pblol2.blob.core.windows.net/hiflux/union-adapters/hpa-a-20k.png', NULL);

INSERT INTO ProductFilterValues (ProductId, CategoryId, FilterId, Value)
SELECT p.ProductId, p.CategoryId, f.FilterId, v.Value
FROM CatalogProducts p
JOIN (VALUES
  (N'ALOKF02-020F04',N'LOK Tube Size',N'1/8"'),(N'ALOKF02-020F04',N'Female Port',N'20,000 psi, 1/4" (H2004)'),
  (N'ALOKF02-020F06',N'LOK Tube Size',N'1/8"'),(N'ALOKF02-020F06',N'Female Port',N'20,000 psi, 3/8" (H2006)'),
  (N'ALOKF02-020F09',N'LOK Tube Size',N'1/8"'),(N'ALOKF02-020F09',N'Female Port',N'20,000 psi, 9/16" (H2009)'),
  (N'ALOKF02-020F12',N'LOK Tube Size',N'1/8"'),(N'ALOKF02-020F12',N'Female Port',N'20,000 psi, 3/4" (H2012)'),
  (N'ALOKF02-020F16',N'LOK Tube Size',N'1/8"'),(N'ALOKF02-020F16',N'Female Port',N'20,000 psi, 1" (H2016)'),
  (N'ALOKF04-020F04',N'LOK Tube Size',N'1/4"'),(N'ALOKF04-020F04',N'Female Port',N'20,000 psi, 1/4" (H2004)'),
  (N'ALOKF04-020F06',N'LOK Tube Size',N'1/4"'),(N'ALOKF04-020F06',N'Female Port',N'20,000 psi, 3/8" (H2006)'),
  (N'ALOKF04-020F09',N'LOK Tube Size',N'1/4"'),(N'ALOKF04-020F09',N'Female Port',N'20,000 psi, 9/16" (H2009)'),
  (N'ALOKF04-020F12',N'LOK Tube Size',N'1/4"'),(N'ALOKF04-020F12',N'Female Port',N'20,000 psi, 3/4" (H2012)'),
  (N'ALOKF04-020F16',N'LOK Tube Size',N'1/4"'),(N'ALOKF04-020F16',N'Female Port',N'20,000 psi, 1" (H2016)'),
  (N'ALOKF06-020F04',N'LOK Tube Size',N'3/8"'),(N'ALOKF06-020F04',N'Female Port',N'20,000 psi, 1/4" (H2004)'),
  (N'ALOKF06-020F06',N'LOK Tube Size',N'3/8"'),(N'ALOKF06-020F06',N'Female Port',N'20,000 psi, 3/8" (H2006)'),
  (N'ALOKF06-020F09',N'LOK Tube Size',N'3/8"'),(N'ALOKF06-020F09',N'Female Port',N'20,000 psi, 9/16" (H2009)'),
  (N'ALOKF06-020F12',N'LOK Tube Size',N'3/8"'),(N'ALOKF06-020F12',N'Female Port',N'20,000 psi, 3/4" (H2012)'),
  (N'ALOKF06-020F16',N'LOK Tube Size',N'3/8"'),(N'ALOKF06-020F16',N'Female Port',N'20,000 psi, 1" (H2016)'),
  (N'ALOKF08-020F04',N'LOK Tube Size',N'1/2"'),(N'ALOKF08-020F04',N'Female Port',N'20,000 psi, 1/4" (H2004)'),
  (N'ALOKF08-020F06',N'LOK Tube Size',N'1/2"'),(N'ALOKF08-020F06',N'Female Port',N'20,000 psi, 3/8" (H2006)'),
  (N'ALOKF08-020F09',N'LOK Tube Size',N'1/2"'),(N'ALOKF08-020F09',N'Female Port',N'20,000 psi, 9/16" (H2009)'),
  (N'ALOKF08-020F12',N'LOK Tube Size',N'1/2"'),(N'ALOKF08-020F12',N'Female Port',N'20,000 psi, 3/4" (H2012)'),
  (N'ALOKF08-020F16',N'LOK Tube Size',N'1/2"'),(N'ALOKF08-020F16',N'Female Port',N'20,000 psi, 1" (H2016)'),
  (N'ALOKF12-020F04',N'LOK Tube Size',N'3/4"'),(N'ALOKF12-020F04',N'Female Port',N'20,000 psi, 1/4" (H2004)'),
  (N'ALOKF12-020F06',N'LOK Tube Size',N'3/4"'),(N'ALOKF12-020F06',N'Female Port',N'20,000 psi, 3/8" (H2006)'),
  (N'ALOKF12-020F09',N'LOK Tube Size',N'3/4"'),(N'ALOKF12-020F09',N'Female Port',N'20,000 psi, 9/16" (H2009)'),
  (N'ALOKF12-020F12',N'LOK Tube Size',N'3/4"'),(N'ALOKF12-020F12',N'Female Port',N'20,000 psi, 3/4" (H2012)'),
  (N'ALOKF12-020F16',N'LOK Tube Size',N'3/4"'),(N'ALOKF12-020F16',N'Female Port',N'20,000 psi, 1" (H2016)'),
  (N'ALOKF16-020F04',N'LOK Tube Size',N'1"'),(N'ALOKF16-020F04',N'Female Port',N'20,000 psi, 1/4" (H2004)'),
  (N'ALOKF16-020F06',N'LOK Tube Size',N'1"'),(N'ALOKF16-020F06',N'Female Port',N'20,000 psi, 3/8" (H2006)'),
  (N'ALOKF16-020F09',N'LOK Tube Size',N'1"'),(N'ALOKF16-020F09',N'Female Port',N'20,000 psi, 9/16" (H2009)'),
  (N'ALOKF16-020F12',N'LOK Tube Size',N'1"'),(N'ALOKF16-020F12',N'Female Port',N'20,000 psi, 3/4" (H2012)'),
  (N'ALOKF16-020F16',N'LOK Tube Size',N'1"'),(N'ALOKF16-020F16',N'Female Port',N'20,000 psi, 1" (H2016)')
) AS v(PartNumber, FilterName, Value) ON v.PartNumber = p.PartNumber
JOIN Filters f ON f.Name = v.FilterName WHERE p.CategoryId=@CategoryId;

SELECT COUNT(*) AS Products FROM CatalogProducts WHERE CategoryId=@CategoryId;
SELECT COUNT(*) AS FilterValues FROM ProductFilterValues WHERE CategoryId=@CategoryId;
