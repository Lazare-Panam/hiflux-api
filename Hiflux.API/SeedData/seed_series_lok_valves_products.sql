-- Lok Valves products (46) + filter values. Run AFTER the info file. Source: Mongo product_variants.
DECLARE @SeriesName nvarchar(100) = N'Lok Valves';
DECLARE @CategoryId int = (SELECT CategoryId FROM Categories WHERE Name = @SeriesName);

INSERT INTO Filters (Name) SELECT v.Name FROM (VALUES (N'Valve Type'),(N'Size'),(N'Pressure Rating'),(N'Orifice')) AS v(Name)
WHERE NOT EXISTS (SELECT 1 FROM Filters f WHERE f.Name = v.Name);

INSERT INTO CategoryFilters (CategoryId, FilterId, SortOrder)
SELECT @CategoryId, f.FilterId, v.SortOrder
FROM (VALUES (N'Valve Type',0),(N'Size',1),(N'Pressure Rating',2),(N'Orifice',3)) AS v(FilterName, SortOrder)
JOIN Filters f ON f.Name = v.FilterName
WHERE NOT EXISTS (SELECT 1 FROM CategoryFilters cf WHERE cf.CategoryId=@CategoryId AND cf.FilterId=f.FilterId);

INSERT INTO CatalogProducts (PartNumber, CategoryId, ProductStatus, FamilyDescription, DetailDescription, ImageUrl, Price) VALUES
(N'FL-NV1-4T-GF', @CategoryId, N'Active', N'Hiflux Lok Valve', N'Hiflux Lok Valve - Needle Valve / 1/4" Lok / 6,000 psi (413 bar) / 4.0 mm', N'https://pblol2.blob.core.windows.net/hiflux/lok/lok-type-valve.png', NULL),
(N'FL-NV2-6T-GF', @CategoryId, N'Active', N'Hiflux Lok Valve', N'Hiflux Lok Valve - Needle Valve / 3/8" Lok / 6,000 psi (413 bar) / 6.4 mm', N'https://pblol2.blob.core.windows.net/hiflux/lok/lok-type-valve.png', NULL),
(N'FL-NVS1-2', @CategoryId, N'Active', N'Hiflux Lok Valve', N'Hiflux Lok Valve - Needle Valve / 1/8" / 5,000 psi (345 bar) / 2.0 mm', N'https://pblol2.blob.core.windows.net/hiflux/lok/lok-type-valve.png', NULL),
(N'FL-NVS1-4', @CategoryId, N'Active', N'Hiflux Lok Valve', N'Hiflux Lok Valve - Needle Valve / 1/4" / 5,000 psi (345 bar) / 3.2 mm', N'https://pblol2.blob.core.windows.net/hiflux/lok/lok-type-valve.png', NULL),
(N'FL-NVS1-6', @CategoryId, N'Active', N'Hiflux Lok Valve', N'Hiflux Lok Valve - Needle Valve / 3/8" / 5,000 psi (345 bar) / 6.4 mm', N'https://pblol2.blob.core.windows.net/hiflux/lok/lok-type-valve.png', NULL),
(N'FL-NVS1-8', @CategoryId, N'Active', N'Hiflux Lok Valve', N'Hiflux Lok Valve - Needle Valve / 1/2" / 5,000 psi (345 bar) / 6.4 mm', N'https://pblol2.blob.core.windows.net/hiflux/lok/lok-type-valve.png', NULL),
(N'FL-NVS1-12', @CategoryId, N'Active', N'Hiflux Lok Valve', N'Hiflux Lok Valve - Needle Valve / 3/4" Lok / 5,000 psi (344 bar) / 9.5 mm (0.37")', N'https://pblol2.blob.core.windows.net/hiflux/lok/lok-type-valve.png', NULL),
(N'FL-NVP1-2', @CategoryId, N'Active', N'Hiflux Lok Valve', N'Hiflux Lok Valve - Needle Valve / 1/8" / 5,000 psi (345 bar) / 2.0 mm', N'https://pblol2.blob.core.windows.net/hiflux/lok/lok-type-valve.png', NULL),
(N'FL-NVP1-4', @CategoryId, N'Active', N'Hiflux Lok Valve', N'Hiflux Lok Valve - Needle Valve / 1/4" / 5,000 psi (345 bar) / 4.4 mm', N'https://pblol2.blob.core.windows.net/hiflux/lok/lok-type-valve.png', NULL),
(N'FL-NVP1-6', @CategoryId, N'Active', N'Hiflux Lok Valve', N'Hiflux Lok Valve - Needle Valve / 3/8" / 5,000 psi (345 bar) / 6.4 mm', N'https://pblol2.blob.core.windows.net/hiflux/lok/lok-type-valve.png', NULL),
(N'FL-NVP1-8', @CategoryId, N'Active', N'Hiflux Lok Valve', N'Hiflux Lok Valve - Needle Valve / 1/2" / 5,000 psi (345 bar) / 9.5 mm', N'https://pblol2.blob.core.windows.net/hiflux/lok/lok-type-valve.png', NULL),
(N'FL-HBV1-2', @CategoryId, N'Active', N'Hiflux Lok Valve', N'Hiflux Lok Valve - Ball Valve / 1/8" / 6,000 psi / 2.4 mm', N'https://pblol2.blob.core.windows.net/hiflux/lok/lok-type-valve.png', NULL),
(N'FL-HBV1-4', @CategoryId, N'Active', N'Hiflux Lok Valve', N'Hiflux Lok Valve - Ball Valve / 1/4" / 6,000 psi / 4.2 mm', N'https://pblol2.blob.core.windows.net/hiflux/lok/lok-type-valve.png', NULL),
(N'FL-HBV1-6', @CategoryId, N'Active', N'Hiflux Lok Valve', N'Hiflux Lok Valve - Ball Valve / 3/8" / 5,000 psi / 6.4 mm', N'https://pblol2.blob.core.windows.net/hiflux/lok/lok-type-valve.png', NULL),
(N'FL-HBV1-8', @CategoryId, N'Active', N'Hiflux Lok Valve', N'Hiflux Lok Valve - Ball Valve / 1/2" / 3,000 psi / 10.3 mm', N'https://pblol2.blob.core.windows.net/hiflux/lok/lok-type-valve.png', NULL),
(N'FL-BV1-2', @CategoryId, N'Active', N'Hiflux Lok Valve', N'Hiflux Lok Valve - Ball Valve / 1/8" / 2,500 psi (172 bar) / 2.4 mm', N'https://pblol2.blob.core.windows.net/hiflux/lok/lok-type-valve.png', NULL),
(N'FL-BV1-4', @CategoryId, N'Active', N'Hiflux Lok Valve', N'Hiflux Lok Valve - Ball Valve / 1/4" / 2,500 psi (172 bar) / 4.8 mm', N'https://pblol2.blob.core.windows.net/hiflux/lok/lok-type-valve.png', NULL),
(N'FL-BV1-6', @CategoryId, N'Active', N'Hiflux Lok Valve', N'Hiflux Lok Valve - Ball Valve / 3/8" / 2,500 psi (172 bar) / 7.1 mm', N'https://pblol2.blob.core.windows.net/hiflux/lok/lok-type-valve.png', NULL),
(N'FL-BV1-8', @CategoryId, N'Active', N'Hiflux Lok Valve', N'Hiflux Lok Valve - Ball Valve / 1/2" / 2,500 psi (172 bar) / 10.3 mm', N'https://pblol2.blob.core.windows.net/hiflux/lok/lok-type-valve.png', NULL),
(N'FL-BV3-4T', @CategoryId, N'Active', N'Hiflux Lok Valve', N'Hiflux Lok Valve - Ball Valve / 1/4" Lok / 1,000 psi (70 bar) / 5.0 mm (0.19")', N'https://pblol2.blob.core.windows.net/hiflux/lok/lok-type-valve.png', NULL),
(N'FL-BV3-4N', @CategoryId, N'Active', N'Hiflux Lok Valve', N'Hiflux Lok Valve - Ball Valve / 1/4" Female NPT / 1,000 psi (70 bar) / 5.0 mm (0.19")', N'https://pblol2.blob.core.windows.net/hiflux/lok/lok-type-valve.png', NULL),
(N'FL-BV3-4R', @CategoryId, N'Active', N'Hiflux Lok Valve', N'Hiflux Lok Valve - Ball Valve / 1/4" Female PT / 1,000 psi (70 bar) / 5.0 mm (0.19")', N'https://pblol2.blob.core.windows.net/hiflux/lok/lok-type-valve.png', NULL),
(N'FL-BV3-6T', @CategoryId, N'Active', N'Hiflux Lok Valve', N'Hiflux Lok Valve - Ball Valve / 3/8" Lok / 1,000 psi (70 bar) / 7.5 mm (0.30")', N'https://pblol2.blob.core.windows.net/hiflux/lok/lok-type-valve.png', NULL),
(N'FL-BV3-6N', @CategoryId, N'Active', N'Hiflux Lok Valve', N'Hiflux Lok Valve - Ball Valve / 3/8" Female NPT / 1,000 psi (70 bar) / 7.5 mm (0.30")', N'https://pblol2.blob.core.windows.net/hiflux/lok/lok-type-valve.png', NULL),
(N'FL-BV3-6R', @CategoryId, N'Active', N'Hiflux Lok Valve', N'Hiflux Lok Valve - Ball Valve / 3/8" Female PT / 1,000 psi (70 bar) / 7.5 mm (0.30")', N'https://pblol2.blob.core.windows.net/hiflux/lok/lok-type-valve.png', NULL),
(N'FL-BV3-8T', @CategoryId, N'Active', N'Hiflux Lok Valve', N'Hiflux Lok Valve - Ball Valve / 1/2" Lok / 1,000 psi (70 bar) / 9.0 mm (0.35")', N'https://pblol2.blob.core.windows.net/hiflux/lok/lok-type-valve.png', NULL),
(N'FL-BV3-8N', @CategoryId, N'Active', N'Hiflux Lok Valve', N'Hiflux Lok Valve - Ball Valve / 1/2" Female NPT / 1,000 psi (70 bar) / 9.0 mm (0.35")', N'https://pblol2.blob.core.windows.net/hiflux/lok/lok-type-valve.png', NULL),
(N'FL-BV3-8R', @CategoryId, N'Active', N'Hiflux Lok Valve', N'Hiflux Lok Valve - Ball Valve / 1/2" Female PT / 1,000 psi (70 bar) / 9.0 mm (0.35")', N'https://pblol2.blob.core.windows.net/hiflux/lok/lok-type-valve.png', NULL),
(N'FL-BV3-12T', @CategoryId, N'Active', N'Hiflux Lok Valve', N'Hiflux Lok Valve - Ball Valve / 3/4" Lok / 1,000 psi (70 bar) / 12.5 mm (0.49")', N'https://pblol2.blob.core.windows.net/hiflux/lok/lok-type-valve.png', NULL),
(N'FL-BV3-12N', @CategoryId, N'Active', N'Hiflux Lok Valve', N'Hiflux Lok Valve - Ball Valve / 3/4" Female NPT / 1,000 psi (70 bar) / 12.5 mm (0.49")', N'https://pblol2.blob.core.windows.net/hiflux/lok/lok-type-valve.png', NULL),
(N'FL-BV3-12R', @CategoryId, N'Active', N'Hiflux Lok Valve', N'Hiflux Lok Valve - Ball Valve / 3/4" Female PT / 1,000 psi (70 bar) / 12.5 mm (0.49")', N'https://pblol2.blob.core.windows.net/hiflux/lok/lok-type-valve.png', NULL),
(N'FL-BV3-16T', @CategoryId, N'Active', N'Hiflux Lok Valve', N'Hiflux Lok Valve - Ball Valve / 1" Lok / 1,000 psi (70 bar) / 16.0 mm (0.63")', N'https://pblol2.blob.core.windows.net/hiflux/lok/lok-type-valve.png', NULL),
(N'FL-BV3-16N', @CategoryId, N'Active', N'Hiflux Lok Valve', N'Hiflux Lok Valve - Ball Valve / 1" Female NPT / 1,000 psi (70 bar) / 16.0 mm (0.63")', N'https://pblol2.blob.core.windows.net/hiflux/lok/lok-type-valve.png', NULL),
(N'FL-BV3-16R', @CategoryId, N'Active', N'Hiflux Lok Valve', N'Hiflux Lok Valve - Ball Valve / 1" Female PT / 1,000 psi (70 bar) / 16.0 mm (0.63")', N'https://pblol2.blob.core.windows.net/hiflux/lok/lok-type-valve.png', NULL),
(N'FL-HBV10-4', @CategoryId, N'Active', N'Hiflux Lok Valve', N'Hiflux Lok Valve - Ball Valve / 1/4" / 3,000 psi (206 bar) / 5 mm', N'https://pblol2.blob.core.windows.net/hiflux/lok/lok-type-valve.png', NULL),
(N'FL-HBV10-6', @CategoryId, N'Active', N'Hiflux Lok Valve', N'Hiflux Lok Valve - Ball Valve / 3/8" / 3,000 psi (206 bar) / 7 mm', N'https://pblol2.blob.core.windows.net/hiflux/lok/lok-type-valve.png', NULL),
(N'FL-HBV10-8', @CategoryId, N'Active', N'Hiflux Lok Valve', N'Hiflux Lok Valve - Ball Valve / 1/2" / 1,500 psi / 9 mm', N'https://pblol2.blob.core.windows.net/hiflux/lok/lok-type-valve.png', NULL),
(N'FL-HBV10-NF-4', @CategoryId, N'Active', N'Hiflux Lok Valve', N'Hiflux Lok Valve - Ball Valve / 1/4" Female NPT / 3,000 psi (206 bar) / 5 mm', N'https://pblol2.blob.core.windows.net/hiflux/lok/lok-type-valve.png', NULL),
(N'FL-HBV10-NF-6', @CategoryId, N'Active', N'Hiflux Lok Valve', N'Hiflux Lok Valve - Ball Valve / 3/8" Female NPT / 3,000 psi (206 bar) / 7 mm', N'https://pblol2.blob.core.windows.net/hiflux/lok/lok-type-valve.png', NULL),
(N'FL-HBV10-NF-8', @CategoryId, N'Active', N'Hiflux Lok Valve', N'Hiflux Lok Valve - Ball Valve / 1/2" Female NPT / 1,500 psi / 9 mm', N'https://pblol2.blob.core.windows.net/hiflux/lok/lok-type-valve.png', NULL),
(N'FL-CV1-2', @CategoryId, N'Active', N'Hiflux Lok Valve', N'Hiflux Lok Valve - Check Valve / 1/8" Lok / 3,000 psi (206 bar) / 4.8 mm (0.19")', N'https://pblol2.blob.core.windows.net/hiflux/lok/lok-type-valve.png', NULL),
(N'FL-CV1-4', @CategoryId, N'Active', N'Hiflux Lok Valve', N'Hiflux Lok Valve - Check Valve / 1/4" Lok / 3,000 psi (206 bar) / 4.8 mm (0.19")', N'https://pblol2.blob.core.windows.net/hiflux/lok/lok-type-valve.png', NULL),
(N'FL-CV2-6', @CategoryId, N'Active', N'Hiflux Lok Valve', N'Hiflux Lok Valve - Check Valve / 3/8" Lok / 3,000 psi (206 bar) / 7.1 mm (0.28")', N'https://pblol2.blob.core.windows.net/hiflux/lok/lok-type-valve.png', NULL),
(N'FL-CV3-8', @CategoryId, N'Active', N'Hiflux Lok Valve', N'Hiflux Lok Valve - Check Valve / 1/2" Lok / 3,000 psi (206 bar) / 10.0 mm (0.39")', N'https://pblol2.blob.core.windows.net/hiflux/lok/lok-type-valve.png', NULL),
(N'FL-CV5-12', @CategoryId, N'Active', N'Hiflux Lok Valve', N'Hiflux Lok Valve - Check Valve / 3/4" Lok / 3,000 psi (206 bar) / 16.0 mm (0.62")', N'https://pblol2.blob.core.windows.net/hiflux/lok/lok-type-valve.png', NULL),
(N'FL-CV6-16', @CategoryId, N'Active', N'Hiflux Lok Valve', N'Hiflux Lok Valve - Check Valve / 1" Lok / 3,000 psi (206 bar) / 18.0 mm (0.70")', N'https://pblol2.blob.core.windows.net/hiflux/lok/lok-type-valve.png', NULL);

INSERT INTO ProductFilterValues (ProductId, CategoryId, FilterId, Value)
SELECT p.ProductId, p.CategoryId, f.FilterId, v.Value
FROM CatalogProducts p
JOIN (VALUES
  (N'FL-NV1-4T-GF',N'Valve Type',N'Needle Valve'),(N'FL-NV1-4T-GF',N'Size',N'1/4" Lok'),(N'FL-NV1-4T-GF',N'Pressure Rating',N'6,000 psi (413 bar)'),(N'FL-NV1-4T-GF',N'Orifice',N'4.0 mm'),
  (N'FL-NV2-6T-GF',N'Valve Type',N'Needle Valve'),(N'FL-NV2-6T-GF',N'Size',N'3/8" Lok'),(N'FL-NV2-6T-GF',N'Pressure Rating',N'6,000 psi (413 bar)'),(N'FL-NV2-6T-GF',N'Orifice',N'6.4 mm'),
  (N'FL-NVS1-2',N'Valve Type',N'Needle Valve'),(N'FL-NVS1-2',N'Size',N'1/8"'),(N'FL-NVS1-2',N'Pressure Rating',N'5,000 psi (345 bar)'),(N'FL-NVS1-2',N'Orifice',N'2.0 mm'),
  (N'FL-NVS1-4',N'Valve Type',N'Needle Valve'),(N'FL-NVS1-4',N'Size',N'1/4"'),(N'FL-NVS1-4',N'Pressure Rating',N'5,000 psi (345 bar)'),(N'FL-NVS1-4',N'Orifice',N'3.2 mm'),
  (N'FL-NVS1-6',N'Valve Type',N'Needle Valve'),(N'FL-NVS1-6',N'Size',N'3/8"'),(N'FL-NVS1-6',N'Pressure Rating',N'5,000 psi (345 bar)'),(N'FL-NVS1-6',N'Orifice',N'6.4 mm'),
  (N'FL-NVS1-8',N'Valve Type',N'Needle Valve'),(N'FL-NVS1-8',N'Size',N'1/2"'),(N'FL-NVS1-8',N'Pressure Rating',N'5,000 psi (345 bar)'),(N'FL-NVS1-8',N'Orifice',N'6.4 mm'),
  (N'FL-NVS1-12',N'Valve Type',N'Needle Valve'),(N'FL-NVS1-12',N'Size',N'3/4" Lok'),(N'FL-NVS1-12',N'Pressure Rating',N'5,000 psi (344 bar)'),(N'FL-NVS1-12',N'Orifice',N'9.5 mm (0.37")'),
  (N'FL-NVP1-2',N'Valve Type',N'Needle Valve'),(N'FL-NVP1-2',N'Size',N'1/8"'),(N'FL-NVP1-2',N'Pressure Rating',N'5,000 psi (345 bar)'),(N'FL-NVP1-2',N'Orifice',N'2.0 mm'),
  (N'FL-NVP1-4',N'Valve Type',N'Needle Valve'),(N'FL-NVP1-4',N'Size',N'1/4"'),(N'FL-NVP1-4',N'Pressure Rating',N'5,000 psi (345 bar)'),(N'FL-NVP1-4',N'Orifice',N'4.4 mm'),
  (N'FL-NVP1-6',N'Valve Type',N'Needle Valve'),(N'FL-NVP1-6',N'Size',N'3/8"'),(N'FL-NVP1-6',N'Pressure Rating',N'5,000 psi (345 bar)'),(N'FL-NVP1-6',N'Orifice',N'6.4 mm'),
  (N'FL-NVP1-8',N'Valve Type',N'Needle Valve'),(N'FL-NVP1-8',N'Size',N'1/2"'),(N'FL-NVP1-8',N'Pressure Rating',N'5,000 psi (345 bar)'),(N'FL-NVP1-8',N'Orifice',N'9.5 mm'),
  (N'FL-HBV1-2',N'Valve Type',N'Ball Valve'),(N'FL-HBV1-2',N'Size',N'1/8"'),(N'FL-HBV1-2',N'Pressure Rating',N'6,000 psi'),(N'FL-HBV1-2',N'Orifice',N'2.4 mm'),
  (N'FL-HBV1-4',N'Valve Type',N'Ball Valve'),(N'FL-HBV1-4',N'Size',N'1/4"'),(N'FL-HBV1-4',N'Pressure Rating',N'6,000 psi'),(N'FL-HBV1-4',N'Orifice',N'4.2 mm'),
  (N'FL-HBV1-6',N'Valve Type',N'Ball Valve'),(N'FL-HBV1-6',N'Size',N'3/8"'),(N'FL-HBV1-6',N'Pressure Rating',N'5,000 psi'),(N'FL-HBV1-6',N'Orifice',N'6.4 mm'),
  (N'FL-HBV1-8',N'Valve Type',N'Ball Valve'),(N'FL-HBV1-8',N'Size',N'1/2"'),(N'FL-HBV1-8',N'Pressure Rating',N'3,000 psi'),(N'FL-HBV1-8',N'Orifice',N'10.3 mm'),
  (N'FL-BV1-2',N'Valve Type',N'Ball Valve'),(N'FL-BV1-2',N'Size',N'1/8"'),(N'FL-BV1-2',N'Pressure Rating',N'2,500 psi (172 bar)'),(N'FL-BV1-2',N'Orifice',N'2.4 mm'),
  (N'FL-BV1-4',N'Valve Type',N'Ball Valve'),(N'FL-BV1-4',N'Size',N'1/4"'),(N'FL-BV1-4',N'Pressure Rating',N'2,500 psi (172 bar)'),(N'FL-BV1-4',N'Orifice',N'4.8 mm'),
  (N'FL-BV1-6',N'Valve Type',N'Ball Valve'),(N'FL-BV1-6',N'Size',N'3/8"'),(N'FL-BV1-6',N'Pressure Rating',N'2,500 psi (172 bar)'),(N'FL-BV1-6',N'Orifice',N'7.1 mm'),
  (N'FL-BV1-8',N'Valve Type',N'Ball Valve'),(N'FL-BV1-8',N'Size',N'1/2"'),(N'FL-BV1-8',N'Pressure Rating',N'2,500 psi (172 bar)'),(N'FL-BV1-8',N'Orifice',N'10.3 mm'),
  (N'FL-BV3-4T',N'Valve Type',N'Ball Valve'),(N'FL-BV3-4T',N'Size',N'1/4" Lok'),(N'FL-BV3-4T',N'Pressure Rating',N'1,000 psi (70 bar)'),(N'FL-BV3-4T',N'Orifice',N'5.0 mm (0.19")'),
  (N'FL-BV3-4N',N'Valve Type',N'Ball Valve'),(N'FL-BV3-4N',N'Size',N'1/4" Female NPT'),(N'FL-BV3-4N',N'Pressure Rating',N'1,000 psi (70 bar)'),(N'FL-BV3-4N',N'Orifice',N'5.0 mm (0.19")'),
  (N'FL-BV3-4R',N'Valve Type',N'Ball Valve'),(N'FL-BV3-4R',N'Size',N'1/4" Female PT'),(N'FL-BV3-4R',N'Pressure Rating',N'1,000 psi (70 bar)'),(N'FL-BV3-4R',N'Orifice',N'5.0 mm (0.19")'),
  (N'FL-BV3-6T',N'Valve Type',N'Ball Valve'),(N'FL-BV3-6T',N'Size',N'3/8" Lok'),(N'FL-BV3-6T',N'Pressure Rating',N'1,000 psi (70 bar)'),(N'FL-BV3-6T',N'Orifice',N'7.5 mm (0.30")'),
  (N'FL-BV3-6N',N'Valve Type',N'Ball Valve'),(N'FL-BV3-6N',N'Size',N'3/8" Female NPT'),(N'FL-BV3-6N',N'Pressure Rating',N'1,000 psi (70 bar)'),(N'FL-BV3-6N',N'Orifice',N'7.5 mm (0.30")'),
  (N'FL-BV3-6R',N'Valve Type',N'Ball Valve'),(N'FL-BV3-6R',N'Size',N'3/8" Female PT'),(N'FL-BV3-6R',N'Pressure Rating',N'1,000 psi (70 bar)'),(N'FL-BV3-6R',N'Orifice',N'7.5 mm (0.30")'),
  (N'FL-BV3-8T',N'Valve Type',N'Ball Valve'),(N'FL-BV3-8T',N'Size',N'1/2" Lok'),(N'FL-BV3-8T',N'Pressure Rating',N'1,000 psi (70 bar)'),(N'FL-BV3-8T',N'Orifice',N'9.0 mm (0.35")'),
  (N'FL-BV3-8N',N'Valve Type',N'Ball Valve'),(N'FL-BV3-8N',N'Size',N'1/2" Female NPT'),(N'FL-BV3-8N',N'Pressure Rating',N'1,000 psi (70 bar)'),(N'FL-BV3-8N',N'Orifice',N'9.0 mm (0.35")'),
  (N'FL-BV3-8R',N'Valve Type',N'Ball Valve'),(N'FL-BV3-8R',N'Size',N'1/2" Female PT'),(N'FL-BV3-8R',N'Pressure Rating',N'1,000 psi (70 bar)'),(N'FL-BV3-8R',N'Orifice',N'9.0 mm (0.35")'),
  (N'FL-BV3-12T',N'Valve Type',N'Ball Valve'),(N'FL-BV3-12T',N'Size',N'3/4" Lok'),(N'FL-BV3-12T',N'Pressure Rating',N'1,000 psi (70 bar)'),(N'FL-BV3-12T',N'Orifice',N'12.5 mm (0.49")'),
  (N'FL-BV3-12N',N'Valve Type',N'Ball Valve'),(N'FL-BV3-12N',N'Size',N'3/4" Female NPT'),(N'FL-BV3-12N',N'Pressure Rating',N'1,000 psi (70 bar)'),(N'FL-BV3-12N',N'Orifice',N'12.5 mm (0.49")'),
  (N'FL-BV3-12R',N'Valve Type',N'Ball Valve'),(N'FL-BV3-12R',N'Size',N'3/4" Female PT'),(N'FL-BV3-12R',N'Pressure Rating',N'1,000 psi (70 bar)'),(N'FL-BV3-12R',N'Orifice',N'12.5 mm (0.49")'),
  (N'FL-BV3-16T',N'Valve Type',N'Ball Valve'),(N'FL-BV3-16T',N'Size',N'1" Lok'),(N'FL-BV3-16T',N'Pressure Rating',N'1,000 psi (70 bar)'),(N'FL-BV3-16T',N'Orifice',N'16.0 mm (0.63")'),
  (N'FL-BV3-16N',N'Valve Type',N'Ball Valve'),(N'FL-BV3-16N',N'Size',N'1" Female NPT'),(N'FL-BV3-16N',N'Pressure Rating',N'1,000 psi (70 bar)'),(N'FL-BV3-16N',N'Orifice',N'16.0 mm (0.63")'),
  (N'FL-BV3-16R',N'Valve Type',N'Ball Valve'),(N'FL-BV3-16R',N'Size',N'1" Female PT'),(N'FL-BV3-16R',N'Pressure Rating',N'1,000 psi (70 bar)'),(N'FL-BV3-16R',N'Orifice',N'16.0 mm (0.63")'),
  (N'FL-HBV10-4',N'Valve Type',N'Ball Valve'),(N'FL-HBV10-4',N'Size',N'1/4"'),(N'FL-HBV10-4',N'Pressure Rating',N'3,000 psi (206 bar)'),(N'FL-HBV10-4',N'Orifice',N'5 mm'),
  (N'FL-HBV10-6',N'Valve Type',N'Ball Valve'),(N'FL-HBV10-6',N'Size',N'3/8"'),(N'FL-HBV10-6',N'Pressure Rating',N'3,000 psi (206 bar)'),(N'FL-HBV10-6',N'Orifice',N'7 mm'),
  (N'FL-HBV10-8',N'Valve Type',N'Ball Valve'),(N'FL-HBV10-8',N'Size',N'1/2"'),(N'FL-HBV10-8',N'Pressure Rating',N'1,500 psi'),(N'FL-HBV10-8',N'Orifice',N'9 mm'),
  (N'FL-HBV10-NF-4',N'Valve Type',N'Ball Valve'),(N'FL-HBV10-NF-4',N'Size',N'1/4" Female NPT'),(N'FL-HBV10-NF-4',N'Pressure Rating',N'3,000 psi (206 bar)'),(N'FL-HBV10-NF-4',N'Orifice',N'5 mm'),
  (N'FL-HBV10-NF-6',N'Valve Type',N'Ball Valve'),(N'FL-HBV10-NF-6',N'Size',N'3/8" Female NPT'),(N'FL-HBV10-NF-6',N'Pressure Rating',N'3,000 psi (206 bar)'),(N'FL-HBV10-NF-6',N'Orifice',N'7 mm'),
  (N'FL-HBV10-NF-8',N'Valve Type',N'Ball Valve'),(N'FL-HBV10-NF-8',N'Size',N'1/2" Female NPT'),(N'FL-HBV10-NF-8',N'Pressure Rating',N'1,500 psi'),(N'FL-HBV10-NF-8',N'Orifice',N'9 mm'),
  (N'FL-CV1-2',N'Valve Type',N'Check Valve'),(N'FL-CV1-2',N'Size',N'1/8" Lok'),(N'FL-CV1-2',N'Pressure Rating',N'3,000 psi (206 bar)'),(N'FL-CV1-2',N'Orifice',N'4.8 mm (0.19")'),
  (N'FL-CV1-4',N'Valve Type',N'Check Valve'),(N'FL-CV1-4',N'Size',N'1/4" Lok'),(N'FL-CV1-4',N'Pressure Rating',N'3,000 psi (206 bar)'),(N'FL-CV1-4',N'Orifice',N'4.8 mm (0.19")'),
  (N'FL-CV2-6',N'Valve Type',N'Check Valve'),(N'FL-CV2-6',N'Size',N'3/8" Lok'),(N'FL-CV2-6',N'Pressure Rating',N'3,000 psi (206 bar)'),(N'FL-CV2-6',N'Orifice',N'7.1 mm (0.28")'),
  (N'FL-CV3-8',N'Valve Type',N'Check Valve'),(N'FL-CV3-8',N'Size',N'1/2" Lok'),(N'FL-CV3-8',N'Pressure Rating',N'3,000 psi (206 bar)'),(N'FL-CV3-8',N'Orifice',N'10.0 mm (0.39")'),
  (N'FL-CV5-12',N'Valve Type',N'Check Valve'),(N'FL-CV5-12',N'Size',N'3/4" Lok'),(N'FL-CV5-12',N'Pressure Rating',N'3,000 psi (206 bar)'),(N'FL-CV5-12',N'Orifice',N'16.0 mm (0.62")'),
  (N'FL-CV6-16',N'Valve Type',N'Check Valve'),(N'FL-CV6-16',N'Size',N'1" Lok'),(N'FL-CV6-16',N'Pressure Rating',N'3,000 psi (206 bar)'),(N'FL-CV6-16',N'Orifice',N'18.0 mm (0.70")')
) AS v(PartNumber, FilterName, Value) ON v.PartNumber = p.PartNumber
JOIN Filters f ON f.Name = v.FilterName WHERE p.CategoryId=@CategoryId;

SELECT COUNT(*) AS Products FROM CatalogProducts WHERE CategoryId=@CategoryId;
SELECT COUNT(*) AS FilterValues FROM ProductFilterValues WHERE CategoryId=@CategoryId;
