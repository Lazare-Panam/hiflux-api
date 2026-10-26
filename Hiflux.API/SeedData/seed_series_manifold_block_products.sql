-- High Pressure Manifold Block - High Pressure products (36) + filter values. Run AFTER the info file.
-- Facets: Ways / Pressure Rating / Tube Size. Derived specs (port/orifice/dimensions) are not stored as filters.
DECLARE @SeriesName nvarchar(100) = N'High Pressure Manifold Block - High Pressure';
DECLARE @CategoryId int = (SELECT CategoryId FROM Categories WHERE Name = @SeriesName);

INSERT INTO Filters (Name) SELECT v.Name FROM (VALUES (N'Ways'),(N'Pressure Rating'),(N'Tube Size')) AS v(Name)
WHERE NOT EXISTS (SELECT 1 FROM Filters f WHERE f.Name = v.Name);

INSERT INTO CategoryFilters (CategoryId, FilterId, SortOrder)
SELECT @CategoryId, f.FilterId, v.SortOrder
FROM (VALUES (N'Ways',0),(N'Pressure Rating',1),(N'Tube Size',2)) AS v(FilterName, SortOrder)
JOIN Filters f ON f.Name = v.FilterName
WHERE NOT EXISTS (SELECT 1 FROM CategoryFilters cf WHERE cf.CategoryId=@CategoryId AND cf.FilterId=f.FilterId);

INSERT INTO CatalogProducts (PartNumber, CategoryId, ProductStatus, FamilyDescription, DetailDescription, ImageUrl, Price) VALUES
(N'MF15S02-4', @CategoryId, N'Active', N'Hiflux High Pressure Manifold Block', N'Hiflux High Pressure Manifold Block - 4-Way - 15,000 psi - 1/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/manifold-block.png', NULL),
(N'MF15S04-4', @CategoryId, N'Active', N'Hiflux High Pressure Manifold Block', N'Hiflux High Pressure Manifold Block - 4-Way - 15,000 psi - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/manifold-block.png', NULL),
(N'MF15S06-4', @CategoryId, N'Active', N'Hiflux High Pressure Manifold Block', N'Hiflux High Pressure Manifold Block - 4-Way - 15,000 psi - 3/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/manifold-block.png', NULL),
(N'MF10S08-4', @CategoryId, N'Active', N'Hiflux High Pressure Manifold Block', N'Hiflux High Pressure Manifold Block - 4-Way - 10,000 psi - 1/2"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/manifold-block.png', NULL),
(N'MF20S04-4', @CategoryId, N'Active', N'Hiflux High Pressure Manifold Block', N'Hiflux High Pressure Manifold Block - 4-Way - 20,000 psi - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/manifold-block.png', NULL),
(N'MF20S06-4', @CategoryId, N'Active', N'Hiflux High Pressure Manifold Block', N'Hiflux High Pressure Manifold Block - 4-Way - 20,000 psi - 3/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/manifold-block.png', NULL),
(N'MF20S09-4', @CategoryId, N'Active', N'Hiflux High Pressure Manifold Block', N'Hiflux High Pressure Manifold Block - 4-Way - 20,000 psi - 9/16"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/manifold-block.png', NULL),
(N'MF20S12-4', @CategoryId, N'Active', N'Hiflux High Pressure Manifold Block', N'Hiflux High Pressure Manifold Block - 4-Way - 20,000 psi - 3/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/manifold-block.png', NULL),
(N'MF20S16-4', @CategoryId, N'Active', N'Hiflux High Pressure Manifold Block', N'Hiflux High Pressure Manifold Block - 4-Way - 20,000 psi - 1"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/manifold-block.png', NULL),
(N'MF60S04-4', @CategoryId, N'Active', N'Hiflux High Pressure Manifold Block', N'Hiflux High Pressure Manifold Block - 4-Way - 60,000 psi - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/manifold-block.png', NULL),
(N'MF60S06-4', @CategoryId, N'Active', N'Hiflux High Pressure Manifold Block', N'Hiflux High Pressure Manifold Block - 4-Way - 60,000 psi - 3/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/manifold-block.png', NULL),
(N'MF60S09-4', @CategoryId, N'Active', N'Hiflux High Pressure Manifold Block', N'Hiflux High Pressure Manifold Block - 4-Way - 60,000 psi - 9/16"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/manifold-block.png', NULL),
(N'MF15S02-5', @CategoryId, N'Active', N'Hiflux High Pressure Manifold Block', N'Hiflux High Pressure Manifold Block - 5-Way - 15,000 psi - 1/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/manifold-block.png', NULL),
(N'MF15S04-5', @CategoryId, N'Active', N'Hiflux High Pressure Manifold Block', N'Hiflux High Pressure Manifold Block - 5-Way - 15,000 psi - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/manifold-block.png', NULL),
(N'MF15S06-5', @CategoryId, N'Active', N'Hiflux High Pressure Manifold Block', N'Hiflux High Pressure Manifold Block - 5-Way - 15,000 psi - 3/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/manifold-block.png', NULL),
(N'MF10S08-5', @CategoryId, N'Active', N'Hiflux High Pressure Manifold Block', N'Hiflux High Pressure Manifold Block - 5-Way - 10,000 psi - 1/2"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/manifold-block.png', NULL),
(N'MF20S04-5', @CategoryId, N'Active', N'Hiflux High Pressure Manifold Block', N'Hiflux High Pressure Manifold Block - 5-Way - 20,000 psi - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/manifold-block.png', NULL),
(N'MF20S06-5', @CategoryId, N'Active', N'Hiflux High Pressure Manifold Block', N'Hiflux High Pressure Manifold Block - 5-Way - 20,000 psi - 3/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/manifold-block.png', NULL),
(N'MF20S09-5', @CategoryId, N'Active', N'Hiflux High Pressure Manifold Block', N'Hiflux High Pressure Manifold Block - 5-Way - 20,000 psi - 9/16"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/manifold-block.png', NULL),
(N'MF20S12-5', @CategoryId, N'Active', N'Hiflux High Pressure Manifold Block', N'Hiflux High Pressure Manifold Block - 5-Way - 20,000 psi - 3/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/manifold-block.png', NULL),
(N'MF20S16-5', @CategoryId, N'Active', N'Hiflux High Pressure Manifold Block', N'Hiflux High Pressure Manifold Block - 5-Way - 20,000 psi - 1"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/manifold-block.png', NULL),
(N'MF60S04-5', @CategoryId, N'Active', N'Hiflux High Pressure Manifold Block', N'Hiflux High Pressure Manifold Block - 5-Way - 60,000 psi - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/manifold-block.png', NULL),
(N'MF60S06-5', @CategoryId, N'Active', N'Hiflux High Pressure Manifold Block', N'Hiflux High Pressure Manifold Block - 5-Way - 60,000 psi - 3/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/manifold-block.png', NULL),
(N'MF60S09-5', @CategoryId, N'Active', N'Hiflux High Pressure Manifold Block', N'Hiflux High Pressure Manifold Block - 5-Way - 60,000 psi - 9/16"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/manifold-block.png', NULL),
(N'MF15S02-6', @CategoryId, N'Active', N'Hiflux High Pressure Manifold Block', N'Hiflux High Pressure Manifold Block - 6-Way - 15,000 psi - 1/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/manifold-block.png', NULL),
(N'MF15S04-6', @CategoryId, N'Active', N'Hiflux High Pressure Manifold Block', N'Hiflux High Pressure Manifold Block - 6-Way - 15,000 psi - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/manifold-block.png', NULL),
(N'MF15S06-6', @CategoryId, N'Active', N'Hiflux High Pressure Manifold Block', N'Hiflux High Pressure Manifold Block - 6-Way - 15,000 psi - 3/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/manifold-block.png', NULL),
(N'MF10S08-6', @CategoryId, N'Active', N'Hiflux High Pressure Manifold Block', N'Hiflux High Pressure Manifold Block - 6-Way - 10,000 psi - 1/2"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/manifold-block.png', NULL),
(N'MF20S04-6', @CategoryId, N'Active', N'Hiflux High Pressure Manifold Block', N'Hiflux High Pressure Manifold Block - 6-Way - 20,000 psi - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/manifold-block.png', NULL),
(N'MF20S06-6', @CategoryId, N'Active', N'Hiflux High Pressure Manifold Block', N'Hiflux High Pressure Manifold Block - 6-Way - 20,000 psi - 3/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/manifold-block.png', NULL),
(N'MF20S09-6', @CategoryId, N'Active', N'Hiflux High Pressure Manifold Block', N'Hiflux High Pressure Manifold Block - 6-Way - 20,000 psi - 9/16"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/manifold-block.png', NULL),
(N'MF20S12-6', @CategoryId, N'Active', N'Hiflux High Pressure Manifold Block', N'Hiflux High Pressure Manifold Block - 6-Way - 20,000 psi - 3/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/manifold-block.png', NULL),
(N'MF20S16-6', @CategoryId, N'Active', N'Hiflux High Pressure Manifold Block', N'Hiflux High Pressure Manifold Block - 6-Way - 20,000 psi - 1"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/manifold-block.png', NULL),
(N'MF60S04-6', @CategoryId, N'Active', N'Hiflux High Pressure Manifold Block', N'Hiflux High Pressure Manifold Block - 6-Way - 60,000 psi - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/manifold-block.png', NULL),
(N'MF60S06-6', @CategoryId, N'Active', N'Hiflux High Pressure Manifold Block', N'Hiflux High Pressure Manifold Block - 6-Way - 60,000 psi - 3/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/manifold-block.png', NULL),
(N'MF60S09-6', @CategoryId, N'Active', N'Hiflux High Pressure Manifold Block', N'Hiflux High Pressure Manifold Block - 6-Way - 60,000 psi - 9/16"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/manifold-block.png', NULL);

INSERT INTO ProductFilterValues (ProductId, CategoryId, FilterId, Value)
SELECT p.ProductId, p.CategoryId, f.FilterId, v.Value
FROM CatalogProducts p
JOIN (VALUES
  (N'MF15S02-4',N'Ways',N'4-Way'),(N'MF15S02-4',N'Pressure Rating',N'15,000 psi'),(N'MF15S02-4',N'Tube Size',N'1/8"'),
  (N'MF15S04-4',N'Ways',N'4-Way'),(N'MF15S04-4',N'Pressure Rating',N'15,000 psi'),(N'MF15S04-4',N'Tube Size',N'1/4"'),
  (N'MF15S06-4',N'Ways',N'4-Way'),(N'MF15S06-4',N'Pressure Rating',N'15,000 psi'),(N'MF15S06-4',N'Tube Size',N'3/8"'),
  (N'MF10S08-4',N'Ways',N'4-Way'),(N'MF10S08-4',N'Pressure Rating',N'10,000 psi'),(N'MF10S08-4',N'Tube Size',N'1/2"'),
  (N'MF20S04-4',N'Ways',N'4-Way'),(N'MF20S04-4',N'Pressure Rating',N'20,000 psi'),(N'MF20S04-4',N'Tube Size',N'1/4"'),
  (N'MF20S06-4',N'Ways',N'4-Way'),(N'MF20S06-4',N'Pressure Rating',N'20,000 psi'),(N'MF20S06-4',N'Tube Size',N'3/8"'),
  (N'MF20S09-4',N'Ways',N'4-Way'),(N'MF20S09-4',N'Pressure Rating',N'20,000 psi'),(N'MF20S09-4',N'Tube Size',N'9/16"'),
  (N'MF20S12-4',N'Ways',N'4-Way'),(N'MF20S12-4',N'Pressure Rating',N'20,000 psi'),(N'MF20S12-4',N'Tube Size',N'3/4"'),
  (N'MF20S16-4',N'Ways',N'4-Way'),(N'MF20S16-4',N'Pressure Rating',N'20,000 psi'),(N'MF20S16-4',N'Tube Size',N'1"'),
  (N'MF60S04-4',N'Ways',N'4-Way'),(N'MF60S04-4',N'Pressure Rating',N'60,000 psi'),(N'MF60S04-4',N'Tube Size',N'1/4"'),
  (N'MF60S06-4',N'Ways',N'4-Way'),(N'MF60S06-4',N'Pressure Rating',N'60,000 psi'),(N'MF60S06-4',N'Tube Size',N'3/8"'),
  (N'MF60S09-4',N'Ways',N'4-Way'),(N'MF60S09-4',N'Pressure Rating',N'60,000 psi'),(N'MF60S09-4',N'Tube Size',N'9/16"'),
  (N'MF15S02-5',N'Ways',N'5-Way'),(N'MF15S02-5',N'Pressure Rating',N'15,000 psi'),(N'MF15S02-5',N'Tube Size',N'1/8"'),
  (N'MF15S04-5',N'Ways',N'5-Way'),(N'MF15S04-5',N'Pressure Rating',N'15,000 psi'),(N'MF15S04-5',N'Tube Size',N'1/4"'),
  (N'MF15S06-5',N'Ways',N'5-Way'),(N'MF15S06-5',N'Pressure Rating',N'15,000 psi'),(N'MF15S06-5',N'Tube Size',N'3/8"'),
  (N'MF10S08-5',N'Ways',N'5-Way'),(N'MF10S08-5',N'Pressure Rating',N'10,000 psi'),(N'MF10S08-5',N'Tube Size',N'1/2"'),
  (N'MF20S04-5',N'Ways',N'5-Way'),(N'MF20S04-5',N'Pressure Rating',N'20,000 psi'),(N'MF20S04-5',N'Tube Size',N'1/4"'),
  (N'MF20S06-5',N'Ways',N'5-Way'),(N'MF20S06-5',N'Pressure Rating',N'20,000 psi'),(N'MF20S06-5',N'Tube Size',N'3/8"'),
  (N'MF20S09-5',N'Ways',N'5-Way'),(N'MF20S09-5',N'Pressure Rating',N'20,000 psi'),(N'MF20S09-5',N'Tube Size',N'9/16"'),
  (N'MF20S12-5',N'Ways',N'5-Way'),(N'MF20S12-5',N'Pressure Rating',N'20,000 psi'),(N'MF20S12-5',N'Tube Size',N'3/4"'),
  (N'MF20S16-5',N'Ways',N'5-Way'),(N'MF20S16-5',N'Pressure Rating',N'20,000 psi'),(N'MF20S16-5',N'Tube Size',N'1"'),
  (N'MF60S04-5',N'Ways',N'5-Way'),(N'MF60S04-5',N'Pressure Rating',N'60,000 psi'),(N'MF60S04-5',N'Tube Size',N'1/4"'),
  (N'MF60S06-5',N'Ways',N'5-Way'),(N'MF60S06-5',N'Pressure Rating',N'60,000 psi'),(N'MF60S06-5',N'Tube Size',N'3/8"'),
  (N'MF60S09-5',N'Ways',N'5-Way'),(N'MF60S09-5',N'Pressure Rating',N'60,000 psi'),(N'MF60S09-5',N'Tube Size',N'9/16"'),
  (N'MF15S02-6',N'Ways',N'6-Way'),(N'MF15S02-6',N'Pressure Rating',N'15,000 psi'),(N'MF15S02-6',N'Tube Size',N'1/8"'),
  (N'MF15S04-6',N'Ways',N'6-Way'),(N'MF15S04-6',N'Pressure Rating',N'15,000 psi'),(N'MF15S04-6',N'Tube Size',N'1/4"'),
  (N'MF15S06-6',N'Ways',N'6-Way'),(N'MF15S06-6',N'Pressure Rating',N'15,000 psi'),(N'MF15S06-6',N'Tube Size',N'3/8"'),
  (N'MF10S08-6',N'Ways',N'6-Way'),(N'MF10S08-6',N'Pressure Rating',N'10,000 psi'),(N'MF10S08-6',N'Tube Size',N'1/2"'),
  (N'MF20S04-6',N'Ways',N'6-Way'),(N'MF20S04-6',N'Pressure Rating',N'20,000 psi'),(N'MF20S04-6',N'Tube Size',N'1/4"'),
  (N'MF20S06-6',N'Ways',N'6-Way'),(N'MF20S06-6',N'Pressure Rating',N'20,000 psi'),(N'MF20S06-6',N'Tube Size',N'3/8"'),
  (N'MF20S09-6',N'Ways',N'6-Way'),(N'MF20S09-6',N'Pressure Rating',N'20,000 psi'),(N'MF20S09-6',N'Tube Size',N'9/16"'),
  (N'MF20S12-6',N'Ways',N'6-Way'),(N'MF20S12-6',N'Pressure Rating',N'20,000 psi'),(N'MF20S12-6',N'Tube Size',N'3/4"'),
  (N'MF20S16-6',N'Ways',N'6-Way'),(N'MF20S16-6',N'Pressure Rating',N'20,000 psi'),(N'MF20S16-6',N'Tube Size',N'1"'),
  (N'MF60S04-6',N'Ways',N'6-Way'),(N'MF60S04-6',N'Pressure Rating',N'60,000 psi'),(N'MF60S04-6',N'Tube Size',N'1/4"'),
  (N'MF60S06-6',N'Ways',N'6-Way'),(N'MF60S06-6',N'Pressure Rating',N'60,000 psi'),(N'MF60S06-6',N'Tube Size',N'3/8"'),
  (N'MF60S09-6',N'Ways',N'6-Way'),(N'MF60S09-6',N'Pressure Rating',N'60,000 psi'),(N'MF60S09-6',N'Tube Size',N'9/16"')
) AS v(PartNumber, FilterName, Value) ON v.PartNumber = p.PartNumber
JOIN Filters f ON f.Name = v.FilterName WHERE p.CategoryId=@CategoryId;

SELECT COUNT(*) AS Products FROM CatalogProducts WHERE CategoryId=@CategoryId;
SELECT COUNT(*) AS FilterValues FROM ProductFilterValues WHERE CategoryId=@CategoryId;
