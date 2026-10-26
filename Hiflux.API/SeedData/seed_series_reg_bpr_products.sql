-- BPR (Back Pressure Regulator) products (12) + filter values. Run AFTER the info file. Source: Mongo product_variants.
DECLARE @SeriesName nvarchar(100) = N'BPR (Back Pressure Regulator)';
DECLARE @CategoryId int = (SELECT CategoryId FROM Categories WHERE Name = @SeriesName);

INSERT INTO Filters (Name) SELECT v.Name FROM (VALUES (N'Gas'),(N'Pressure Rating')) AS v(Name)
WHERE NOT EXISTS (SELECT 1 FROM Filters f WHERE f.Name = v.Name);

INSERT INTO CategoryFilters (CategoryId, FilterId, SortOrder)
SELECT @CategoryId, f.FilterId, v.SortOrder
FROM (VALUES (N'Gas',0),(N'Pressure Rating',1)) AS v(FilterName, SortOrder)
JOIN Filters f ON f.Name = v.FilterName
WHERE NOT EXISTS (SELECT 1 FROM CategoryFilters cf WHERE cf.CategoryId=@CategoryId AND cf.FilterId=f.FilterId);

INSERT INTO CatalogProducts (PartNumber, CategoryId, ProductStatus, FamilyDescription, DetailDescription, ImageUrl, Price) VALUES
(N'BPR800-Normal', @CategoryId, N'Active', N'Hiflux Back Pressure Regulator', N'Hiflux Back Pressure Regulator - Normal / 800 psi', N'https://pblol2.blob.core.windows.net/hiflux/regulators/bpr-2.png', NULL),
(N'BPR800-CO2', @CategoryId, N'Active', N'Hiflux Back Pressure Regulator', N'Hiflux Back Pressure Regulator - CO2 / 800 psi', N'https://pblol2.blob.core.windows.net/hiflux/regulators/bpr-2.png', NULL),
(N'BPR2000-Normal', @CategoryId, N'Active', N'Hiflux Back Pressure Regulator', N'Hiflux Back Pressure Regulator - Normal / 2,000 psi', N'https://pblol2.blob.core.windows.net/hiflux/regulators/bpr-2.png', 960.00),
(N'BPR2000-CO2', @CategoryId, N'Active', N'Hiflux Back Pressure Regulator', N'Hiflux Back Pressure Regulator - CO2 / 2,000 psi', N'https://pblol2.blob.core.windows.net/hiflux/regulators/bpr-2.png', NULL),
(N'BPR4000-Normal', @CategoryId, N'Active', N'Hiflux Back Pressure Regulator', N'Hiflux Back Pressure Regulator - Normal / 4,000 psi', N'https://pblol2.blob.core.windows.net/hiflux/regulators/bpr-2.png', 1008.00),
(N'BPR4000-CO2', @CategoryId, N'Active', N'Hiflux Back Pressure Regulator', N'Hiflux Back Pressure Regulator - CO2 / 4,000 psi', N'https://pblol2.blob.core.windows.net/hiflux/regulators/bpr-2.png', NULL),
(N'BPR6000-Normal', @CategoryId, N'Active', N'Hiflux Back Pressure Regulator', N'Hiflux Back Pressure Regulator - Normal / 6,000 psi', N'https://pblol2.blob.core.windows.net/hiflux/regulators/bpr-2.png', 1032.00),
(N'BPR6000-CO2', @CategoryId, N'Active', N'Hiflux Back Pressure Regulator', N'Hiflux Back Pressure Regulator - CO2 / 6,000 psi', N'https://pblol2.blob.core.windows.net/hiflux/regulators/bpr-2.png', NULL),
(N'BPR10000-Normal', @CategoryId, N'Active', N'Hiflux Back Pressure Regulator', N'Hiflux Back Pressure Regulator - Normal / 10,000 psi', N'https://pblol2.blob.core.windows.net/hiflux/regulators/bpr-2.png', 1080.00),
(N'BPR10000-CO2', @CategoryId, N'Active', N'Hiflux Back Pressure Regulator', N'Hiflux Back Pressure Regulator - CO2 / 10,000 psi', N'https://pblol2.blob.core.windows.net/hiflux/regulators/bpr-2.png', NULL),
(N'BPR15000-Normal', @CategoryId, N'Active', N'Hiflux Back Pressure Regulator', N'Hiflux Back Pressure Regulator - Normal / 15,000 psi', N'https://pblol2.blob.core.windows.net/hiflux/regulators/bpr-2.png', 1560.00),
(N'BPR15000-CO2', @CategoryId, N'Active', N'Hiflux Back Pressure Regulator', N'Hiflux Back Pressure Regulator - CO2 / 15,000 psi', N'https://pblol2.blob.core.windows.net/hiflux/regulators/bpr-2.png', NULL);

INSERT INTO ProductFilterValues (ProductId, CategoryId, FilterId, Value)
SELECT p.ProductId, p.CategoryId, f.FilterId, v.Value
FROM CatalogProducts p
JOIN (VALUES
  (N'BPR800-Normal',N'Gas',N'Normal'),(N'BPR800-Normal',N'Pressure Rating',N'800 psi'),
  (N'BPR800-CO2',N'Gas',N'CO2'),(N'BPR800-CO2',N'Pressure Rating',N'800 psi'),
  (N'BPR2000-Normal',N'Gas',N'Normal'),(N'BPR2000-Normal',N'Pressure Rating',N'2,000 psi'),
  (N'BPR2000-CO2',N'Gas',N'CO2'),(N'BPR2000-CO2',N'Pressure Rating',N'2,000 psi'),
  (N'BPR4000-Normal',N'Gas',N'Normal'),(N'BPR4000-Normal',N'Pressure Rating',N'4,000 psi'),
  (N'BPR4000-CO2',N'Gas',N'CO2'),(N'BPR4000-CO2',N'Pressure Rating',N'4,000 psi'),
  (N'BPR6000-Normal',N'Gas',N'Normal'),(N'BPR6000-Normal',N'Pressure Rating',N'6,000 psi'),
  (N'BPR6000-CO2',N'Gas',N'CO2'),(N'BPR6000-CO2',N'Pressure Rating',N'6,000 psi'),
  (N'BPR10000-Normal',N'Gas',N'Normal'),(N'BPR10000-Normal',N'Pressure Rating',N'10,000 psi'),
  (N'BPR10000-CO2',N'Gas',N'CO2'),(N'BPR10000-CO2',N'Pressure Rating',N'10,000 psi'),
  (N'BPR15000-Normal',N'Gas',N'Normal'),(N'BPR15000-Normal',N'Pressure Rating',N'15,000 psi'),
  (N'BPR15000-CO2',N'Gas',N'CO2'),(N'BPR15000-CO2',N'Pressure Rating',N'15,000 psi')
) AS v(PartNumber, FilterName, Value) ON v.PartNumber = p.PartNumber
JOIN Filters f ON f.Name = v.FilterName WHERE p.CategoryId=@CategoryId;

SELECT COUNT(*) AS Products FROM CatalogProducts WHERE CategoryId=@CategoryId;
SELECT COUNT(*) AS FilterValues FROM ProductFilterValues WHERE CategoryId=@CategoryId;
