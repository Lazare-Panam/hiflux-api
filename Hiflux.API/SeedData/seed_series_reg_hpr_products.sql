-- HPR (High Pressure Regulator) products (10) + filter values. Run AFTER the info file. Source: Mongo product_variants.
DECLARE @SeriesName nvarchar(100) = N'HPR (High Pressure Regulator)';
DECLARE @CategoryId int = (SELECT CategoryId FROM Categories WHERE Name = @SeriesName);

INSERT INTO Filters (Name) SELECT v.Name FROM (VALUES (N'Gas'),(N'Pressure Rating')) AS v(Name)
WHERE NOT EXISTS (SELECT 1 FROM Filters f WHERE f.Name = v.Name);

INSERT INTO CategoryFilters (CategoryId, FilterId, SortOrder)
SELECT @CategoryId, f.FilterId, v.SortOrder
FROM (VALUES (N'Gas',0),(N'Pressure Rating',1)) AS v(FilterName, SortOrder)
JOIN Filters f ON f.Name = v.FilterName
WHERE NOT EXISTS (SELECT 1 FROM CategoryFilters cf WHERE cf.CategoryId=@CategoryId AND cf.FilterId=f.FilterId);

INSERT INTO CatalogProducts (PartNumber, CategoryId, ProductStatus, FamilyDescription, DetailDescription, ImageUrl, Price) VALUES
(N'HPR2000-Normal', @CategoryId, N'Active', N'Hiflux High Pressure Regulator', N'Hiflux High Pressure Regulator - Normal / 2,000 psi', N'https://pblol2.blob.core.windows.net/hiflux/regulators/hpr.png', 960.00),
(N'HPR2000-CO2', @CategoryId, N'Active', N'Hiflux High Pressure Regulator', N'Hiflux High Pressure Regulator - CO2 / 2,000 psi', N'https://pblol2.blob.core.windows.net/hiflux/regulators/hpr.png', NULL),
(N'HPR4000-Normal', @CategoryId, N'Active', N'Hiflux High Pressure Regulator', N'Hiflux High Pressure Regulator - Normal / 4,000 psi', N'https://pblol2.blob.core.windows.net/hiflux/regulators/hpr.png', 1008.00),
(N'HPR4000-CO2', @CategoryId, N'Active', N'Hiflux High Pressure Regulator', N'Hiflux High Pressure Regulator - CO2 / 4,000 psi', N'https://pblol2.blob.core.windows.net/hiflux/regulators/hpr.png', NULL),
(N'HPR6000-Normal', @CategoryId, N'Active', N'Hiflux High Pressure Regulator', N'Hiflux High Pressure Regulator - Normal / 6,000 psi', N'https://pblol2.blob.core.windows.net/hiflux/regulators/hpr.png', 1032.00),
(N'HPR6000-CO2', @CategoryId, N'Active', N'Hiflux High Pressure Regulator', N'Hiflux High Pressure Regulator - CO2 / 6,000 psi', N'https://pblol2.blob.core.windows.net/hiflux/regulators/hpr.png', NULL),
(N'HPR10000-Normal', @CategoryId, N'Active', N'Hiflux High Pressure Regulator', N'Hiflux High Pressure Regulator - Normal / 10,000 psi', N'https://pblol2.blob.core.windows.net/hiflux/regulators/hpr.png', 1200.00),
(N'HPR10000-CO2', @CategoryId, N'Active', N'Hiflux High Pressure Regulator', N'Hiflux High Pressure Regulator - CO2 / 10,000 psi', N'https://pblol2.blob.core.windows.net/hiflux/regulators/hpr.png', NULL),
(N'HPR15000-Normal', @CategoryId, N'Active', N'Hiflux High Pressure Regulator', N'Hiflux High Pressure Regulator - Normal / 15,000 psi', N'https://pblol2.blob.core.windows.net/hiflux/regulators/hpr.png', 1560.00),
(N'HPR15000-CO2', @CategoryId, N'Active', N'Hiflux High Pressure Regulator', N'Hiflux High Pressure Regulator - CO2 / 15,000 psi', N'https://pblol2.blob.core.windows.net/hiflux/regulators/hpr.png', NULL);

INSERT INTO ProductFilterValues (ProductId, CategoryId, FilterId, Value)
SELECT p.ProductId, p.CategoryId, f.FilterId, v.Value
FROM CatalogProducts p
JOIN (VALUES
  (N'HPR2000-Normal',N'Gas',N'Normal'),(N'HPR2000-Normal',N'Pressure Rating',N'2,000 psi'),
  (N'HPR2000-CO2',N'Gas',N'CO2'),(N'HPR2000-CO2',N'Pressure Rating',N'2,000 psi'),
  (N'HPR4000-Normal',N'Gas',N'Normal'),(N'HPR4000-Normal',N'Pressure Rating',N'4,000 psi'),
  (N'HPR4000-CO2',N'Gas',N'CO2'),(N'HPR4000-CO2',N'Pressure Rating',N'4,000 psi'),
  (N'HPR6000-Normal',N'Gas',N'Normal'),(N'HPR6000-Normal',N'Pressure Rating',N'6,000 psi'),
  (N'HPR6000-CO2',N'Gas',N'CO2'),(N'HPR6000-CO2',N'Pressure Rating',N'6,000 psi'),
  (N'HPR10000-Normal',N'Gas',N'Normal'),(N'HPR10000-Normal',N'Pressure Rating',N'10,000 psi'),
  (N'HPR10000-CO2',N'Gas',N'CO2'),(N'HPR10000-CO2',N'Pressure Rating',N'10,000 psi'),
  (N'HPR15000-Normal',N'Gas',N'Normal'),(N'HPR15000-Normal',N'Pressure Rating',N'15,000 psi'),
  (N'HPR15000-CO2',N'Gas',N'CO2'),(N'HPR15000-CO2',N'Pressure Rating',N'15,000 psi')
) AS v(PartNumber, FilterName, Value) ON v.PartNumber = p.PartNumber
JOIN Filters f ON f.Name = v.FilterName WHERE p.CategoryId=@CategoryId;

SELECT COUNT(*) AS Products FROM CatalogProducts WHERE CategoryId=@CategoryId;
SELECT COUNT(*) AS FilterValues FROM ProductFilterValues WHERE CategoryId=@CategoryId;
