-- Air Operated Valve - Normal Close products (40, price on request) + filter values. Run AFTER the info file.
-- Facets: Pressure Rating, Body Type, Tube Size (the selectable axes). Orifice/Port/Dimension
-- are derived from these and are not stored as selectable filters. Source data had no price.
DECLARE @SeriesName nvarchar(100) = N'Air Operated Valve - Normal Close';
DECLARE @CategoryId int = (SELECT CategoryId FROM Categories WHERE Name = @SeriesName);

INSERT INTO Filters (Name) SELECT v.Name FROM (VALUES (N'Pressure Rating'),(N'Body Type'),(N'Tube Size')) AS v(Name)
WHERE NOT EXISTS (SELECT 1 FROM Filters f WHERE f.Name = v.Name);

INSERT INTO CategoryFilters (CategoryId, FilterId, SortOrder)
SELECT @CategoryId, f.FilterId, v.SortOrder
FROM (VALUES (N'Pressure Rating',0),(N'Body Type',1),(N'Tube Size',2)) AS v(FilterName, SortOrder)
JOIN Filters f ON f.Name = v.FilterName
WHERE NOT EXISTS (SELECT 1 FROM CategoryFilters cf WHERE cf.CategoryId=@CategoryId AND cf.FilterId=f.FilterId);

INSERT INTO CatalogProducts (PartNumber, CategoryId, ProductStatus, FamilyDescription, DetailDescription, ImageUrl, Price) VALUES
(N'AOV15CS02-S', @CategoryId, N'Active', N'Hiflux Air Operated Valve', N'Hiflux Air Operated Valve - 15,000 psi - Straight - 1/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/air-operated-valve.png', NULL),
(N'AOV15CS04-S', @CategoryId, N'Active', N'Hiflux Air Operated Valve', N'Hiflux Air Operated Valve - 15,000 psi - Straight - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/air-operated-valve.png', NULL),
(N'AOV15CS06-S', @CategoryId, N'Active', N'Hiflux Air Operated Valve', N'Hiflux Air Operated Valve - 15,000 psi - Straight - 3/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/air-operated-valve.png', NULL),
(N'AOV10CS08-S', @CategoryId, N'Active', N'Hiflux Air Operated Valve', N'Hiflux Air Operated Valve - 10,000 psi - Straight - 1/2"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/air-operated-valve.png', NULL),
(N'AOV20CS04-S', @CategoryId, N'Active', N'Hiflux Air Operated Valve', N'Hiflux Air Operated Valve - 20,000 psi - Straight - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/air-operated-valve.png', NULL),
(N'AOV20CS06-S', @CategoryId, N'Active', N'Hiflux Air Operated Valve', N'Hiflux Air Operated Valve - 20,000 psi - Straight - 3/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/air-operated-valve.png', NULL),
(N'AOV20CS09-S', @CategoryId, N'Active', N'Hiflux Air Operated Valve', N'Hiflux Air Operated Valve - 20,000 psi - Straight - 9/16"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/air-operated-valve.png', NULL),
(N'AOV60CS04-S', @CategoryId, N'Active', N'Hiflux Air Operated Valve', N'Hiflux Air Operated Valve - 60,000 psi - Straight - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/air-operated-valve.png', NULL),
(N'AOV60CS06-S', @CategoryId, N'Active', N'Hiflux Air Operated Valve', N'Hiflux Air Operated Valve - 60,000 psi - Straight - 3/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/air-operated-valve.png', NULL),
(N'AOV60CS09-S', @CategoryId, N'Active', N'Hiflux Air Operated Valve', N'Hiflux Air Operated Valve - 60,000 psi - Straight - 9/16"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/air-operated-valve.png', NULL),
(N'AOV15CS02-A', @CategoryId, N'Active', N'Hiflux Air Operated Valve', N'Hiflux Air Operated Valve - 15,000 psi - Angle - 1/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/air-operated-valve.png', NULL),
(N'AOV15CS04-A', @CategoryId, N'Active', N'Hiflux Air Operated Valve', N'Hiflux Air Operated Valve - 15,000 psi - Angle - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/air-operated-valve.png', NULL),
(N'AOV15CS06-A', @CategoryId, N'Active', N'Hiflux Air Operated Valve', N'Hiflux Air Operated Valve - 15,000 psi - Angle - 3/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/air-operated-valve.png', NULL),
(N'AOV10CS08-A', @CategoryId, N'Active', N'Hiflux Air Operated Valve', N'Hiflux Air Operated Valve - 10,000 psi - Angle - 1/2"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/air-operated-valve.png', NULL),
(N'AOV20CS04-A', @CategoryId, N'Active', N'Hiflux Air Operated Valve', N'Hiflux Air Operated Valve - 20,000 psi - Angle - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/air-operated-valve.png', NULL),
(N'AOV20CS06-A', @CategoryId, N'Active', N'Hiflux Air Operated Valve', N'Hiflux Air Operated Valve - 20,000 psi - Angle - 3/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/air-operated-valve.png', NULL),
(N'AOV20CS09-A', @CategoryId, N'Active', N'Hiflux Air Operated Valve', N'Hiflux Air Operated Valve - 20,000 psi - Angle - 9/16"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/air-operated-valve.png', NULL),
(N'AOV60CS04-A', @CategoryId, N'Active', N'Hiflux Air Operated Valve', N'Hiflux Air Operated Valve - 60,000 psi - Angle - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/air-operated-valve.png', NULL),
(N'AOV60CS06-A', @CategoryId, N'Active', N'Hiflux Air Operated Valve', N'Hiflux Air Operated Valve - 60,000 psi - Angle - 3/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/air-operated-valve.png', NULL),
(N'AOV60CS09-A', @CategoryId, N'Active', N'Hiflux Air Operated Valve', N'Hiflux Air Operated Valve - 60,000 psi - Angle - 9/16"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/air-operated-valve.png', NULL),
(N'AOV15CS02-O', @CategoryId, N'Active', N'Hiflux Air Operated Valve', N'Hiflux Air Operated Valve - 15,000 psi - 3Way/1on - 1/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/air-operated-valve.png', NULL),
(N'AOV15CS04-O', @CategoryId, N'Active', N'Hiflux Air Operated Valve', N'Hiflux Air Operated Valve - 15,000 psi - 3Way/1on - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/air-operated-valve.png', NULL),
(N'AOV15CS06-O', @CategoryId, N'Active', N'Hiflux Air Operated Valve', N'Hiflux Air Operated Valve - 15,000 psi - 3Way/1on - 3/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/air-operated-valve.png', NULL),
(N'AOV10CS08-O', @CategoryId, N'Active', N'Hiflux Air Operated Valve', N'Hiflux Air Operated Valve - 10,000 psi - 3Way/1on - 1/2"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/air-operated-valve.png', NULL),
(N'AOV20CS04-O', @CategoryId, N'Active', N'Hiflux Air Operated Valve', N'Hiflux Air Operated Valve - 20,000 psi - 3Way/1on - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/air-operated-valve.png', NULL),
(N'AOV20CS06-O', @CategoryId, N'Active', N'Hiflux Air Operated Valve', N'Hiflux Air Operated Valve - 20,000 psi - 3Way/1on - 3/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/air-operated-valve.png', NULL),
(N'AOV20CS09-O', @CategoryId, N'Active', N'Hiflux Air Operated Valve', N'Hiflux Air Operated Valve - 20,000 psi - 3Way/1on - 9/16"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/air-operated-valve.png', NULL),
(N'AOV60CS04-O', @CategoryId, N'Active', N'Hiflux Air Operated Valve', N'Hiflux Air Operated Valve - 60,000 psi - 3Way/1on - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/air-operated-valve.png', NULL),
(N'AOV60CS06-O', @CategoryId, N'Active', N'Hiflux Air Operated Valve', N'Hiflux Air Operated Valve - 60,000 psi - 3Way/1on - 3/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/air-operated-valve.png', NULL),
(N'AOV60CS09-O', @CategoryId, N'Active', N'Hiflux Air Operated Valve', N'Hiflux Air Operated Valve - 60,000 psi - 3Way/1on - 9/16"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/air-operated-valve.png', NULL),
(N'AOV15CS02-T', @CategoryId, N'Active', N'Hiflux Air Operated Valve', N'Hiflux Air Operated Valve - 15,000 psi - 3Way/2on - 1/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/air-operated-valve.png', NULL),
(N'AOV15CS04-T', @CategoryId, N'Active', N'Hiflux Air Operated Valve', N'Hiflux Air Operated Valve - 15,000 psi - 3Way/2on - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/air-operated-valve.png', NULL),
(N'AOV15CS06-T', @CategoryId, N'Active', N'Hiflux Air Operated Valve', N'Hiflux Air Operated Valve - 15,000 psi - 3Way/2on - 3/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/air-operated-valve.png', NULL),
(N'AOV10CS08-T', @CategoryId, N'Active', N'Hiflux Air Operated Valve', N'Hiflux Air Operated Valve - 10,000 psi - 3Way/2on - 1/2"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/air-operated-valve.png', NULL),
(N'AOV20CS04-T', @CategoryId, N'Active', N'Hiflux Air Operated Valve', N'Hiflux Air Operated Valve - 20,000 psi - 3Way/2on - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/air-operated-valve.png', NULL),
(N'AOV20CS06-T', @CategoryId, N'Active', N'Hiflux Air Operated Valve', N'Hiflux Air Operated Valve - 20,000 psi - 3Way/2on - 3/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/air-operated-valve.png', NULL),
(N'AOV20CS09-T', @CategoryId, N'Active', N'Hiflux Air Operated Valve', N'Hiflux Air Operated Valve - 20,000 psi - 3Way/2on - 9/16"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/air-operated-valve.png', NULL),
(N'AOV60CS04-T', @CategoryId, N'Active', N'Hiflux Air Operated Valve', N'Hiflux Air Operated Valve - 60,000 psi - 3Way/2on - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/air-operated-valve.png', NULL),
(N'AOV60CS06-T', @CategoryId, N'Active', N'Hiflux Air Operated Valve', N'Hiflux Air Operated Valve - 60,000 psi - 3Way/2on - 3/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/air-operated-valve.png', NULL),
(N'AOV60CS09-T', @CategoryId, N'Active', N'Hiflux Air Operated Valve', N'Hiflux Air Operated Valve - 60,000 psi - 3Way/2on - 9/16"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/air-operated-valve.png', NULL);

INSERT INTO ProductFilterValues (ProductId, CategoryId, FilterId, Value)
SELECT p.ProductId, p.CategoryId, f.FilterId, v.Value
FROM CatalogProducts p
JOIN (VALUES
  (N'AOV15CS02-S',N'Pressure Rating',N'15,000 psi'),(N'AOV15CS02-S',N'Body Type',N'Straight'),(N'AOV15CS02-S',N'Tube Size',N'1/8"'),
  (N'AOV15CS04-S',N'Pressure Rating',N'15,000 psi'),(N'AOV15CS04-S',N'Body Type',N'Straight'),(N'AOV15CS04-S',N'Tube Size',N'1/4"'),
  (N'AOV15CS06-S',N'Pressure Rating',N'15,000 psi'),(N'AOV15CS06-S',N'Body Type',N'Straight'),(N'AOV15CS06-S',N'Tube Size',N'3/8"'),
  (N'AOV10CS08-S',N'Pressure Rating',N'10,000 psi'),(N'AOV10CS08-S',N'Body Type',N'Straight'),(N'AOV10CS08-S',N'Tube Size',N'1/2"'),
  (N'AOV20CS04-S',N'Pressure Rating',N'20,000 psi'),(N'AOV20CS04-S',N'Body Type',N'Straight'),(N'AOV20CS04-S',N'Tube Size',N'1/4"'),
  (N'AOV20CS06-S',N'Pressure Rating',N'20,000 psi'),(N'AOV20CS06-S',N'Body Type',N'Straight'),(N'AOV20CS06-S',N'Tube Size',N'3/8"'),
  (N'AOV20CS09-S',N'Pressure Rating',N'20,000 psi'),(N'AOV20CS09-S',N'Body Type',N'Straight'),(N'AOV20CS09-S',N'Tube Size',N'9/16"'),
  (N'AOV60CS04-S',N'Pressure Rating',N'60,000 psi'),(N'AOV60CS04-S',N'Body Type',N'Straight'),(N'AOV60CS04-S',N'Tube Size',N'1/4"'),
  (N'AOV60CS06-S',N'Pressure Rating',N'60,000 psi'),(N'AOV60CS06-S',N'Body Type',N'Straight'),(N'AOV60CS06-S',N'Tube Size',N'3/8"'),
  (N'AOV60CS09-S',N'Pressure Rating',N'60,000 psi'),(N'AOV60CS09-S',N'Body Type',N'Straight'),(N'AOV60CS09-S',N'Tube Size',N'9/16"'),
  (N'AOV15CS02-A',N'Pressure Rating',N'15,000 psi'),(N'AOV15CS02-A',N'Body Type',N'Angle'),(N'AOV15CS02-A',N'Tube Size',N'1/8"'),
  (N'AOV15CS04-A',N'Pressure Rating',N'15,000 psi'),(N'AOV15CS04-A',N'Body Type',N'Angle'),(N'AOV15CS04-A',N'Tube Size',N'1/4"'),
  (N'AOV15CS06-A',N'Pressure Rating',N'15,000 psi'),(N'AOV15CS06-A',N'Body Type',N'Angle'),(N'AOV15CS06-A',N'Tube Size',N'3/8"'),
  (N'AOV10CS08-A',N'Pressure Rating',N'10,000 psi'),(N'AOV10CS08-A',N'Body Type',N'Angle'),(N'AOV10CS08-A',N'Tube Size',N'1/2"'),
  (N'AOV20CS04-A',N'Pressure Rating',N'20,000 psi'),(N'AOV20CS04-A',N'Body Type',N'Angle'),(N'AOV20CS04-A',N'Tube Size',N'1/4"'),
  (N'AOV20CS06-A',N'Pressure Rating',N'20,000 psi'),(N'AOV20CS06-A',N'Body Type',N'Angle'),(N'AOV20CS06-A',N'Tube Size',N'3/8"'),
  (N'AOV20CS09-A',N'Pressure Rating',N'20,000 psi'),(N'AOV20CS09-A',N'Body Type',N'Angle'),(N'AOV20CS09-A',N'Tube Size',N'9/16"'),
  (N'AOV60CS04-A',N'Pressure Rating',N'60,000 psi'),(N'AOV60CS04-A',N'Body Type',N'Angle'),(N'AOV60CS04-A',N'Tube Size',N'1/4"'),
  (N'AOV60CS06-A',N'Pressure Rating',N'60,000 psi'),(N'AOV60CS06-A',N'Body Type',N'Angle'),(N'AOV60CS06-A',N'Tube Size',N'3/8"'),
  (N'AOV60CS09-A',N'Pressure Rating',N'60,000 psi'),(N'AOV60CS09-A',N'Body Type',N'Angle'),(N'AOV60CS09-A',N'Tube Size',N'9/16"'),
  (N'AOV15CS02-O',N'Pressure Rating',N'15,000 psi'),(N'AOV15CS02-O',N'Body Type',N'3Way/1on'),(N'AOV15CS02-O',N'Tube Size',N'1/8"'),
  (N'AOV15CS04-O',N'Pressure Rating',N'15,000 psi'),(N'AOV15CS04-O',N'Body Type',N'3Way/1on'),(N'AOV15CS04-O',N'Tube Size',N'1/4"'),
  (N'AOV15CS06-O',N'Pressure Rating',N'15,000 psi'),(N'AOV15CS06-O',N'Body Type',N'3Way/1on'),(N'AOV15CS06-O',N'Tube Size',N'3/8"'),
  (N'AOV10CS08-O',N'Pressure Rating',N'10,000 psi'),(N'AOV10CS08-O',N'Body Type',N'3Way/1on'),(N'AOV10CS08-O',N'Tube Size',N'1/2"'),
  (N'AOV20CS04-O',N'Pressure Rating',N'20,000 psi'),(N'AOV20CS04-O',N'Body Type',N'3Way/1on'),(N'AOV20CS04-O',N'Tube Size',N'1/4"'),
  (N'AOV20CS06-O',N'Pressure Rating',N'20,000 psi'),(N'AOV20CS06-O',N'Body Type',N'3Way/1on'),(N'AOV20CS06-O',N'Tube Size',N'3/8"'),
  (N'AOV20CS09-O',N'Pressure Rating',N'20,000 psi'),(N'AOV20CS09-O',N'Body Type',N'3Way/1on'),(N'AOV20CS09-O',N'Tube Size',N'9/16"'),
  (N'AOV60CS04-O',N'Pressure Rating',N'60,000 psi'),(N'AOV60CS04-O',N'Body Type',N'3Way/1on'),(N'AOV60CS04-O',N'Tube Size',N'1/4"'),
  (N'AOV60CS06-O',N'Pressure Rating',N'60,000 psi'),(N'AOV60CS06-O',N'Body Type',N'3Way/1on'),(N'AOV60CS06-O',N'Tube Size',N'3/8"'),
  (N'AOV60CS09-O',N'Pressure Rating',N'60,000 psi'),(N'AOV60CS09-O',N'Body Type',N'3Way/1on'),(N'AOV60CS09-O',N'Tube Size',N'9/16"'),
  (N'AOV15CS02-T',N'Pressure Rating',N'15,000 psi'),(N'AOV15CS02-T',N'Body Type',N'3Way/2on'),(N'AOV15CS02-T',N'Tube Size',N'1/8"'),
  (N'AOV15CS04-T',N'Pressure Rating',N'15,000 psi'),(N'AOV15CS04-T',N'Body Type',N'3Way/2on'),(N'AOV15CS04-T',N'Tube Size',N'1/4"'),
  (N'AOV15CS06-T',N'Pressure Rating',N'15,000 psi'),(N'AOV15CS06-T',N'Body Type',N'3Way/2on'),(N'AOV15CS06-T',N'Tube Size',N'3/8"'),
  (N'AOV10CS08-T',N'Pressure Rating',N'10,000 psi'),(N'AOV10CS08-T',N'Body Type',N'3Way/2on'),(N'AOV10CS08-T',N'Tube Size',N'1/2"'),
  (N'AOV20CS04-T',N'Pressure Rating',N'20,000 psi'),(N'AOV20CS04-T',N'Body Type',N'3Way/2on'),(N'AOV20CS04-T',N'Tube Size',N'1/4"'),
  (N'AOV20CS06-T',N'Pressure Rating',N'20,000 psi'),(N'AOV20CS06-T',N'Body Type',N'3Way/2on'),(N'AOV20CS06-T',N'Tube Size',N'3/8"'),
  (N'AOV20CS09-T',N'Pressure Rating',N'20,000 psi'),(N'AOV20CS09-T',N'Body Type',N'3Way/2on'),(N'AOV20CS09-T',N'Tube Size',N'9/16"'),
  (N'AOV60CS04-T',N'Pressure Rating',N'60,000 psi'),(N'AOV60CS04-T',N'Body Type',N'3Way/2on'),(N'AOV60CS04-T',N'Tube Size',N'1/4"'),
  (N'AOV60CS06-T',N'Pressure Rating',N'60,000 psi'),(N'AOV60CS06-T',N'Body Type',N'3Way/2on'),(N'AOV60CS06-T',N'Tube Size',N'3/8"'),
  (N'AOV60CS09-T',N'Pressure Rating',N'60,000 psi'),(N'AOV60CS09-T',N'Body Type',N'3Way/2on'),(N'AOV60CS09-T',N'Tube Size',N'9/16"')
) AS v(PartNumber, FilterName, Value) ON v.PartNumber = p.PartNumber
JOIN Filters f ON f.Name = v.FilterName WHERE p.CategoryId=@CategoryId;

SELECT COUNT(*) AS Products FROM CatalogProducts WHERE CategoryId=@CategoryId;
SELECT COUNT(*) AS FilterValues FROM ProductFilterValues WHERE CategoryId=@CategoryId;
