-- Pressure Gauge products (15) + filter values. Run AFTER the info file. Source: Mongo product_variants.
DECLARE @SeriesName nvarchar(100) = N'Pressure Gauge';
DECLARE @CategoryId int = (SELECT CategoryId FROM Categories WHERE Name = @SeriesName);

INSERT INTO Filters (Name) SELECT v.Name FROM (VALUES (N'Type'),(N'Range')) AS v(Name)
WHERE NOT EXISTS (SELECT 1 FROM Filters f WHERE f.Name = v.Name);

INSERT INTO CategoryFilters (CategoryId, FilterId, SortOrder)
SELECT @CategoryId, f.FilterId, v.SortOrder
FROM (VALUES (N'Type',0),(N'Range',1)) AS v(FilterName, SortOrder)
JOIN Filters f ON f.Name = v.FilterName
WHERE NOT EXISTS (SELECT 1 FROM CategoryFilters cf WHERE cf.CategoryId=@CategoryId AND cf.FilterId=f.FilterId);

INSERT INTO CatalogProducts (PartNumber, CategoryId, ProductStatus, FamilyDescription, DetailDescription, ImageUrl, Price) VALUES
(N'HI60A4c-20', @CategoryId, N'Active', N'Hiflux Pressure Gauge', N'Hiflux Pressure Gauge - Bottom Connection, Direct (A type) / 0-20 kg/cm² (≈284 psi)', N'https://pblol2.blob.core.windows.net/hiflux/Pressure-Temp-Flow-images/pressure-gauge.jpg', NULL),
(N'HI60A4c-50', @CategoryId, N'Active', N'Hiflux Pressure Gauge', N'Hiflux Pressure Gauge - Bottom Connection, Direct (A type) / 0-50 kg/cm² (≈711 psi)', N'https://pblol2.blob.core.windows.net/hiflux/Pressure-Temp-Flow-images/pressure-gauge.jpg', NULL),
(N'HI60A4c-150', @CategoryId, N'Active', N'Hiflux Pressure Gauge', N'Hiflux Pressure Gauge - Bottom Connection, Direct (A type) / 0-150 kg/cm² (≈2,133 psi)', N'https://pblol2.blob.core.windows.net/hiflux/Pressure-Temp-Flow-images/pressure-gauge.jpg', NULL),
(N'HI60A4c-250', @CategoryId, N'Active', N'Hiflux Pressure Gauge', N'Hiflux Pressure Gauge - Bottom Connection, Direct (A type) / 0-250 kg/cm² (≈3,556 psi)', N'https://pblol2.blob.core.windows.net/hiflux/Pressure-Temp-Flow-images/pressure-gauge.jpg', NULL),
(N'HI100A3d-500', @CategoryId, N'Active', N'Hiflux Pressure Gauge', N'Hiflux Pressure Gauge - Bottom Connection, Direct (A type) / 0-500 kg/cm² (≈7,112 psi)', N'https://pblol2.blob.core.windows.net/hiflux/Pressure-Temp-Flow-images/pressure-gauge.jpg', NULL),
(N'HI100A3d-1000', @CategoryId, N'Active', N'Hiflux Pressure Gauge', N'Hiflux Pressure Gauge - Bottom Connection, Direct (A type) / 0-1,000 kg/cm² (≈14,223 psi)', N'https://pblol2.blob.core.windows.net/hiflux/Pressure-Temp-Flow-images/pressure-gauge.jpg', NULL),
(N'HI60J4c-35', @CategoryId, N'Active', N'Hiflux Pressure Gauge', N'Hiflux Pressure Gauge - Bottom Connection, Flush (J type) / 0-35 kg/cm² (≈498 psi)', N'https://pblol2.blob.core.windows.net/hiflux/Pressure-Temp-Flow-images/pressure-gauge.jpg', NULL),
(N'HI100J3d-100', @CategoryId, N'Active', N'Hiflux Pressure Gauge', N'Hiflux Pressure Gauge - Bottom Connection, Flush (J type) / 0-100 kg/cm² (≈1,422 psi)', N'https://pblol2.blob.core.windows.net/hiflux/Pressure-Temp-Flow-images/pressure-gauge.jpg', NULL),
(N'HI100J3d-250', @CategoryId, N'Active', N'Hiflux Pressure Gauge', N'Hiflux Pressure Gauge - Bottom Connection, Flush (J type) / 0-250 kg/cm² (≈3,556 psi)', N'https://pblol2.blob.core.windows.net/hiflux/Pressure-Temp-Flow-images/pressure-gauge.jpg', NULL),
(N'HI100J3d-500', @CategoryId, N'Active', N'Hiflux Pressure Gauge', N'Hiflux Pressure Gauge - Bottom Connection, Flush (J type) / 0-500 kg/cm² (≈7,112 psi)', N'https://pblol2.blob.core.windows.net/hiflux/Pressure-Temp-Flow-images/pressure-gauge.jpg', NULL),
(N'HI100J3d-1000', @CategoryId, N'Active', N'Hiflux Pressure Gauge', N'Hiflux Pressure Gauge - Bottom Connection, Flush (J type) / 0-1,000 kg/cm² (≈14,223 psi)', N'https://pblol2.blob.core.windows.net/hiflux/Pressure-Temp-Flow-images/pressure-gauge.jpg', NULL),
(N'HI50POT-20', @CategoryId, N'Active', N'Hiflux Pressure Gauge', N'Hiflux Pressure Gauge - Gas Type (C type) / 0-20 kg/cm² (≈284 psi)', N'https://pblol2.blob.core.windows.net/hiflux/Pressure-Temp-Flow-images/pressure-gauge.jpg', NULL),
(N'HI50POT-70', @CategoryId, N'Active', N'Hiflux Pressure Gauge', N'Hiflux Pressure Gauge - Gas Type (C type) / 0-70 kg/cm² (≈996 psi)', N'https://pblol2.blob.core.windows.net/hiflux/Pressure-Temp-Flow-images/pressure-gauge.jpg', NULL),
(N'HI50POT-150', @CategoryId, N'Active', N'Hiflux Pressure Gauge', N'Hiflux Pressure Gauge - Gas Type (C type) / 0-150 kg/cm² (≈2,133 psi)', N'https://pblol2.blob.core.windows.net/hiflux/Pressure-Temp-Flow-images/pressure-gauge.jpg', NULL),
(N'HI50POT-250', @CategoryId, N'Active', N'Hiflux Pressure Gauge', N'Hiflux Pressure Gauge - Gas Type (C type) / 0-250 kg/cm² (≈3,556 psi)', N'https://pblol2.blob.core.windows.net/hiflux/Pressure-Temp-Flow-images/pressure-gauge.jpg', NULL);

INSERT INTO ProductFilterValues (ProductId, CategoryId, FilterId, Value)
SELECT p.ProductId, p.CategoryId, f.FilterId, v.Value
FROM CatalogProducts p
JOIN (VALUES
  (N'HI60A4c-20',N'Type',N'Bottom Connection, Direct (A type)'),(N'HI60A4c-20',N'Range',N'0-20 kg/cm² (≈284 psi)'),
  (N'HI60A4c-50',N'Type',N'Bottom Connection, Direct (A type)'),(N'HI60A4c-50',N'Range',N'0-50 kg/cm² (≈711 psi)'),
  (N'HI60A4c-150',N'Type',N'Bottom Connection, Direct (A type)'),(N'HI60A4c-150',N'Range',N'0-150 kg/cm² (≈2,133 psi)'),
  (N'HI60A4c-250',N'Type',N'Bottom Connection, Direct (A type)'),(N'HI60A4c-250',N'Range',N'0-250 kg/cm² (≈3,556 psi)'),
  (N'HI100A3d-500',N'Type',N'Bottom Connection, Direct (A type)'),(N'HI100A3d-500',N'Range',N'0-500 kg/cm² (≈7,112 psi)'),
  (N'HI100A3d-1000',N'Type',N'Bottom Connection, Direct (A type)'),(N'HI100A3d-1000',N'Range',N'0-1,000 kg/cm² (≈14,223 psi)'),
  (N'HI60J4c-35',N'Type',N'Bottom Connection, Flush (J type)'),(N'HI60J4c-35',N'Range',N'0-35 kg/cm² (≈498 psi)'),
  (N'HI100J3d-100',N'Type',N'Bottom Connection, Flush (J type)'),(N'HI100J3d-100',N'Range',N'0-100 kg/cm² (≈1,422 psi)'),
  (N'HI100J3d-250',N'Type',N'Bottom Connection, Flush (J type)'),(N'HI100J3d-250',N'Range',N'0-250 kg/cm² (≈3,556 psi)'),
  (N'HI100J3d-500',N'Type',N'Bottom Connection, Flush (J type)'),(N'HI100J3d-500',N'Range',N'0-500 kg/cm² (≈7,112 psi)'),
  (N'HI100J3d-1000',N'Type',N'Bottom Connection, Flush (J type)'),(N'HI100J3d-1000',N'Range',N'0-1,000 kg/cm² (≈14,223 psi)'),
  (N'HI50POT-20',N'Type',N'Gas Type (C type)'),(N'HI50POT-20',N'Range',N'0-20 kg/cm² (≈284 psi)'),
  (N'HI50POT-70',N'Type',N'Gas Type (C type)'),(N'HI50POT-70',N'Range',N'0-70 kg/cm² (≈996 psi)'),
  (N'HI50POT-150',N'Type',N'Gas Type (C type)'),(N'HI50POT-150',N'Range',N'0-150 kg/cm² (≈2,133 psi)'),
  (N'HI50POT-250',N'Type',N'Gas Type (C type)'),(N'HI50POT-250',N'Range',N'0-250 kg/cm² (≈3,556 psi)')
) AS v(PartNumber, FilterName, Value) ON v.PartNumber = p.PartNumber
JOIN Filters f ON f.Name = v.FilterName WHERE p.CategoryId=@CategoryId;

SELECT COUNT(*) AS Products FROM CatalogProducts WHERE CategoryId=@CategoryId;
SELECT COUNT(*) AS FilterValues FROM ProductFilterValues WHERE CategoryId=@CategoryId;
