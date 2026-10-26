-- High Pressure Special Valves products (24) + filter values. Run AFTER the info file.
-- Mixed collection; facets Valve Type / Pressure Rating / Size. 5 Relief-Factory SKUs
-- were excluded (already in the relief series). Some rows lack Pressure/Price in the source.
DECLARE @SeriesName nvarchar(100) = N'High Pressure Special Valves';
DECLARE @CategoryId int = (SELECT CategoryId FROM Categories WHERE Name = @SeriesName);

INSERT INTO Filters (Name) SELECT v.Name FROM (VALUES (N'Valve Type'),(N'Pressure Rating'),(N'Size')) AS v(Name)
WHERE NOT EXISTS (SELECT 1 FROM Filters f WHERE f.Name = v.Name);

INSERT INTO CategoryFilters (CategoryId, FilterId, SortOrder)
SELECT @CategoryId, f.FilterId, v.SortOrder
FROM (VALUES (N'Valve Type',0),(N'Pressure Rating',1),(N'Size',2)) AS v(FilterName, SortOrder)
JOIN Filters f ON f.Name = v.FilterName
WHERE NOT EXISTS (SELECT 1 FROM CategoryFilters cf WHERE cf.CategoryId=@CategoryId AND cf.FilterId=f.FilterId);

INSERT INTO CatalogProducts (PartNumber, CategoryId, ProductStatus, FamilyDescription, DetailDescription, ImageUrl, Price) VALUES
(N'BLV20VS04', @CategoryId, N'Active', N'Hiflux High Pressure Special Valve', N'Hiflux Bleed Valve - 20,000 psi - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/Speical-valve.png', 139.20),
(N'BLV20VS06', @CategoryId, N'Active', N'Hiflux High Pressure Special Valve', N'Hiflux Bleed Valve - 20,000 psi - 3/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/Speical-valve.png', 139.20),
(N'BLV20VS09', @CategoryId, N'Active', N'Hiflux High Pressure Special Valve', N'Hiflux Bleed Valve - 20,000 psi - 9/16"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/Speical-valve.png', 139.20),
(N'BLV30VS04', @CategoryId, N'Active', N'Hiflux High Pressure Special Valve', N'Hiflux Bleed Valve - 30,000 psi - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/Speical-valve.png', 139.20),
(N'BLV30VS06', @CategoryId, N'Active', N'Hiflux High Pressure Special Valve', N'Hiflux Bleed Valve - 30,000 psi - 3/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/Speical-valve.png', 139.20),
(N'BLV30VS09', @CategoryId, N'Active', N'Hiflux High Pressure Special Valve', N'Hiflux Bleed Valve - 30,000 psi - 9/16"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/Speical-valve.png', 139.20),
(N'DBBV20VS04', @CategoryId, N'Active', N'Hiflux High Pressure Special Valve', N'Hiflux Double Block and Bleed Valve - 20,000 psi - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/Speical-valve.png', 854.40),
(N'DBBV20VS06', @CategoryId, N'Active', N'Hiflux High Pressure Special Valve', N'Hiflux Double Block and Bleed Valve - 20,000 psi - 3/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/Speical-valve.png', 866.40),
(N'RV10FAS04-1', @CategoryId, N'Active', N'Hiflux High Pressure Special Valve', N'Hiflux Relief Valve - Field Adjustable - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/Speical-valve.png', 380.40),
(N'RV10FAS04-2', @CategoryId, N'Active', N'Hiflux High Pressure Special Valve', N'Hiflux Relief Valve - Field Adjustable - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/Speical-valve.png', 390.00),
(N'RV20FAS04-1', @CategoryId, N'Active', N'Hiflux High Pressure Special Valve', N'Hiflux Relief Valve - Field Adjustable - 20,000 psi - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/Speical-valve.png', 724.80),
(N'RV20FAS04-2', @CategoryId, N'Active', N'Hiflux High Pressure Special Valve', N'Hiflux Relief Valve - Field Adjustable - 20,000 psi - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/Speical-valve.png', 732.00),
(N'RV15PPS08N', @CategoryId, N'Active', N'Hiflux High Pressure Special Valve', N'Hiflux Relief Valve - Proportional - 1/2"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/Speical-valve.png', 840.00),
(N'RV20PPS09', @CategoryId, N'Active', N'Hiflux High Pressure Special Valve', N'Hiflux Relief Valve - Proportional - 20,000 psi - 9/16"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/Speical-valve.png', 852.00),
(N'CON03CS15-S', @CategoryId, N'Active', N'Hiflux High Pressure Special Valve', N'Hiflux Control Valve - 3,000 psi - 15A', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/Speical-valve.png', NULL),
(N'CON03CS25-S', @CategoryId, N'Active', N'Hiflux High Pressure Special Valve', N'Hiflux Control Valve - 3,000 psi - 25A', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/Speical-valve.png', NULL),
(N'CON07CS15-S', @CategoryId, N'Active', N'Hiflux High Pressure Special Valve', N'Hiflux Control Valve - 7,500 psi - 15A', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/Speical-valve.png', NULL),
(N'GV20VS04', @CategoryId, N'Active', N'Hiflux High Pressure Special Valve', N'Hiflux Wellhead Gauge Valve - 20,000 psi - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/Speical-valve.png', NULL),
(N'GV20VS06', @CategoryId, N'Active', N'Hiflux High Pressure Special Valve', N'Hiflux Wellhead Gauge Valve - 20,000 psi - 3/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/Speical-valve.png', NULL),
(N'GV30VS09', @CategoryId, N'Active', N'Hiflux High Pressure Special Valve', N'Hiflux Wellhead Gauge Valve - 30,000 psi - 9/16"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/Speical-valve.png', NULL),
(N'DBBV20VS09', @CategoryId, N'Active', N'Hiflux High Pressure Special Valve', N'Hiflux Double Block and Bleed Valve - 20,000 psi - 9/16"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/Speical-valve.png', NULL),
(N'HV20S04-S', @CategoryId, N'Active', N'Hiflux High Pressure Special Valve', N'Hiflux High Temperature Valve - 20,000 psi - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/Speical-valve.png', NULL),
(N'HV20S06-S', @CategoryId, N'Active', N'Hiflux High Pressure Special Valve', N'Hiflux High Temperature Valve - 20,000 psi - 3/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/Speical-valve.png', NULL),
(N'HV20S09-S', @CategoryId, N'Active', N'Hiflux High Pressure Special Valve', N'Hiflux High Temperature Valve - 20,000 psi - 9/16"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/Speical-valve.png', NULL);

INSERT INTO ProductFilterValues (ProductId, CategoryId, FilterId, Value)
SELECT p.ProductId, p.CategoryId, f.FilterId, v.Value
FROM CatalogProducts p
JOIN (VALUES
  (N'BLV20VS04',N'Valve Type',N'Bleed Valve'),(N'BLV20VS04',N'Pressure Rating',N'20,000 psi'),(N'BLV20VS04',N'Size',N'1/4"'),
  (N'BLV20VS06',N'Valve Type',N'Bleed Valve'),(N'BLV20VS06',N'Pressure Rating',N'20,000 psi'),(N'BLV20VS06',N'Size',N'3/8"'),
  (N'BLV20VS09',N'Valve Type',N'Bleed Valve'),(N'BLV20VS09',N'Pressure Rating',N'20,000 psi'),(N'BLV20VS09',N'Size',N'9/16"'),
  (N'BLV30VS04',N'Valve Type',N'Bleed Valve'),(N'BLV30VS04',N'Pressure Rating',N'30,000 psi'),(N'BLV30VS04',N'Size',N'1/4"'),
  (N'BLV30VS06',N'Valve Type',N'Bleed Valve'),(N'BLV30VS06',N'Pressure Rating',N'30,000 psi'),(N'BLV30VS06',N'Size',N'3/8"'),
  (N'BLV30VS09',N'Valve Type',N'Bleed Valve'),(N'BLV30VS09',N'Pressure Rating',N'30,000 psi'),(N'BLV30VS09',N'Size',N'9/16"'),
  (N'DBBV20VS04',N'Valve Type',N'Double Block and Bleed Valve'),(N'DBBV20VS04',N'Pressure Rating',N'20,000 psi'),(N'DBBV20VS04',N'Size',N'1/4"'),
  (N'DBBV20VS06',N'Valve Type',N'Double Block and Bleed Valve'),(N'DBBV20VS06',N'Pressure Rating',N'20,000 psi'),(N'DBBV20VS06',N'Size',N'3/8"'),
  (N'RV10FAS04-1',N'Valve Type',N'Relief Valve - Field Adjustable'),(N'RV10FAS04-1',N'Size',N'1/4"'),
  (N'RV10FAS04-2',N'Valve Type',N'Relief Valve - Field Adjustable'),(N'RV10FAS04-2',N'Size',N'1/4"'),
  (N'RV20FAS04-1',N'Valve Type',N'Relief Valve - Field Adjustable'),(N'RV20FAS04-1',N'Pressure Rating',N'20,000 psi'),(N'RV20FAS04-1',N'Size',N'1/4"'),
  (N'RV20FAS04-2',N'Valve Type',N'Relief Valve - Field Adjustable'),(N'RV20FAS04-2',N'Pressure Rating',N'20,000 psi'),(N'RV20FAS04-2',N'Size',N'1/4"'),
  (N'RV15PPS08N',N'Valve Type',N'Relief Valve - Proportional'),(N'RV15PPS08N',N'Size',N'1/2"'),
  (N'RV20PPS09',N'Valve Type',N'Relief Valve - Proportional'),(N'RV20PPS09',N'Pressure Rating',N'20,000 psi'),(N'RV20PPS09',N'Size',N'9/16"'),
  (N'CON03CS15-S',N'Valve Type',N'Control Valve'),(N'CON03CS15-S',N'Pressure Rating',N'3,000 psi'),(N'CON03CS15-S',N'Size',N'15A'),
  (N'CON03CS25-S',N'Valve Type',N'Control Valve'),(N'CON03CS25-S',N'Pressure Rating',N'3,000 psi'),(N'CON03CS25-S',N'Size',N'25A'),
  (N'CON07CS15-S',N'Valve Type',N'Control Valve'),(N'CON07CS15-S',N'Pressure Rating',N'7,500 psi'),(N'CON07CS15-S',N'Size',N'15A'),
  (N'GV20VS04',N'Valve Type',N'Wellhead Gauge Valve'),(N'GV20VS04',N'Pressure Rating',N'20,000 psi'),(N'GV20VS04',N'Size',N'1/4"'),
  (N'GV20VS06',N'Valve Type',N'Wellhead Gauge Valve'),(N'GV20VS06',N'Pressure Rating',N'20,000 psi'),(N'GV20VS06',N'Size',N'3/8"'),
  (N'GV30VS09',N'Valve Type',N'Wellhead Gauge Valve'),(N'GV30VS09',N'Pressure Rating',N'30,000 psi'),(N'GV30VS09',N'Size',N'9/16"'),
  (N'DBBV20VS09',N'Valve Type',N'Double Block and Bleed Valve'),(N'DBBV20VS09',N'Pressure Rating',N'20,000 psi'),(N'DBBV20VS09',N'Size',N'9/16"'),
  (N'HV20S04-S',N'Valve Type',N'High Temperature Valve'),(N'HV20S04-S',N'Pressure Rating',N'20,000 psi'),(N'HV20S04-S',N'Size',N'1/4"'),
  (N'HV20S06-S',N'Valve Type',N'High Temperature Valve'),(N'HV20S06-S',N'Pressure Rating',N'20,000 psi'),(N'HV20S06-S',N'Size',N'3/8"'),
  (N'HV20S09-S',N'Valve Type',N'High Temperature Valve'),(N'HV20S09-S',N'Pressure Rating',N'20,000 psi'),(N'HV20S09-S',N'Size',N'9/16"')
) AS v(PartNumber, FilterName, Value) ON v.PartNumber = p.PartNumber
JOIN Filters f ON f.Name = v.FilterName WHERE p.CategoryId=@CategoryId;

SELECT COUNT(*) AS Products FROM CatalogProducts WHERE CategoryId=@CategoryId;
SELECT COUNT(*) AS FilterValues FROM ProductFilterValues WHERE CategoryId=@CategoryId;
