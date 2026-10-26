-- High Pressure Ball Valve - Medium Pressure products (18, all priced) + filter values. Run AFTER the info file.
-- Facets from the Mongo specs; 4 legacy BVN05* rows that exactly duplicated a BV2005* facet combo were dropped.
DECLARE @SeriesName nvarchar(100) = N'High Pressure Ball Valve - Medium Pressure';
DECLARE @CategoryId int = (SELECT CategoryId FROM Categories WHERE Name = @SeriesName);

INSERT INTO Filters (Name) SELECT v.Name FROM (VALUES (N'Pressure Rating'),(N'Tube Size'),(N'Orifice Size'),(N'Finish')) AS v(Name)
WHERE NOT EXISTS (SELECT 1 FROM Filters f WHERE f.Name = v.Name);

INSERT INTO CategoryFilters (CategoryId, FilterId, SortOrder)
SELECT @CategoryId, f.FilterId, v.SortOrder
FROM (VALUES (N'Pressure Rating',0),(N'Tube Size',1),(N'Orifice Size',2),(N'Finish',3)) AS v(FilterName, SortOrder)
JOIN Filters f ON f.Name = v.FilterName
WHERE NOT EXISTS (SELECT 1 FROM CategoryFilters cf WHERE cf.CategoryId=@CategoryId AND cf.FilterId=f.FilterId);

INSERT INTO CatalogProducts (PartNumber, CategoryId, ProductStatus, FamilyDescription, DetailDescription, ImageUrl, Price) VALUES
(N'BV2003S04-S', @CategoryId, N'Active', N'Hiflux High Pressure Ball Valve', N'Hiflux Ball Valve - 20,000 psi - 1/4" - 4.8 mm - Standard', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/trunion-ball-valve.png', 410.40),
(N'BV2003S06-S', @CategoryId, N'Active', N'Hiflux High Pressure Ball Valve', N'Hiflux Ball Valve - 20,000 psi - 3/8" - 4.8 mm - Standard', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/trunion-ball-valve.png', 410.40),
(N'BV2003S09-S', @CategoryId, N'Active', N'Hiflux High Pressure Ball Valve', N'Hiflux Ball Valve - 20,000 psi - 9/16" - 4.8 mm - Standard', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/trunion-ball-valve.png', 410.40),
(N'BVN03S04-S', @CategoryId, N'Active', N'Hiflux High Pressure Ball Valve', N'Hiflux Ball Valve - 15,000 psi - 1/4" - 4.8 mm - Standard', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/trunion-ball-valve.png', 410.40),
(N'BVN03S06-S', @CategoryId, N'Active', N'Hiflux High Pressure Ball Valve', N'Hiflux Ball Valve - 15,000 psi - 3/8" - 4.8 mm - Standard', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/trunion-ball-valve.png', 410.40),
(N'BV2003S04-180', @CategoryId, N'Active', N'Hiflux High Pressure Ball Valve', N'Hiflux Ball Valve - 20,000 psi - 1/4" - 4.8 mm - 180', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/trunion-ball-valve.png', 450.00),
(N'BV2003S06-180', @CategoryId, N'Active', N'Hiflux High Pressure Ball Valve', N'Hiflux Ball Valve - 20,000 psi - 3/8" - 4.8 mm - 180', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/trunion-ball-valve.png', 450.00),
(N'BV2003S09-180', @CategoryId, N'Active', N'Hiflux High Pressure Ball Valve', N'Hiflux Ball Valve - 20,000 psi - 9/16" - 4.8 mm - 180', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/trunion-ball-valve.png', 450.00),
(N'BVN03S04-180', @CategoryId, N'Active', N'Hiflux High Pressure Ball Valve', N'Hiflux Ball Valve - 15,000 psi - 1/4" - 4.8 mm - 180', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/trunion-ball-valve.png', 450.00),
(N'BVN03S06-180', @CategoryId, N'Active', N'Hiflux High Pressure Ball Valve', N'Hiflux Ball Valve - 15,000 psi - 3/8" - 4.8 mm - 180', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/trunion-ball-valve.png', 450.00),
(N'BV2005S04-S', @CategoryId, N'Active', N'Hiflux High Pressure Ball Valve', N'Hiflux Ball Valve - 15,000 psi - 1/4" - 8 mm - Standard', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/trunion-ball-valve.png', 591.60),
(N'BV2005S06-S', @CategoryId, N'Active', N'Hiflux High Pressure Ball Valve', N'Hiflux Ball Valve - 15,000 psi - 3/8" - 8 mm - Standard', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/trunion-ball-valve.png', 591.60),
(N'BV2005S09-S', @CategoryId, N'Active', N'Hiflux High Pressure Ball Valve', N'Hiflux Ball Valve - 15,000 psi - 9/16" - 8 mm - Standard', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/trunion-ball-valve.png', 591.60),
(N'BVN05S08-S', @CategoryId, N'Active', N'Hiflux High Pressure Ball Valve', N'Hiflux Ball Valve - 15,000 psi - 1/2" - 8 mm - Standard', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/trunion-ball-valve.png', 591.60),
(N'BV2005S04-180', @CategoryId, N'Active', N'Hiflux High Pressure Ball Valve', N'Hiflux Ball Valve - 15,000 psi - 1/4" - 8 mm - 180', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/trunion-ball-valve.png', 601.20),
(N'BV2005S06-180', @CategoryId, N'Active', N'Hiflux High Pressure Ball Valve', N'Hiflux Ball Valve - 15,000 psi - 3/8" - 8 mm - 180', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/trunion-ball-valve.png', 601.20),
(N'BV2005S09-180', @CategoryId, N'Active', N'Hiflux High Pressure Ball Valve', N'Hiflux Ball Valve - 15,000 psi - 9/16" - 8 mm - 180', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/trunion-ball-valve.png', 601.20),
(N'BVN05S08-180', @CategoryId, N'Active', N'Hiflux High Pressure Ball Valve', N'Hiflux Ball Valve - 15,000 psi - 1/2" - 8 mm - 180', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/trunion-ball-valve.png', 601.20);

INSERT INTO ProductFilterValues (ProductId, CategoryId, FilterId, Value)
SELECT p.ProductId, p.CategoryId, f.FilterId, v.Value
FROM CatalogProducts p
JOIN (VALUES
  (N'BV2003S04-S',N'Pressure Rating',N'20,000 psi'),(N'BV2003S04-S',N'Tube Size',N'1/4"'),(N'BV2003S04-S',N'Orifice Size',N'4.8 mm'),(N'BV2003S04-S',N'Finish',N'Standard'),
  (N'BV2003S06-S',N'Pressure Rating',N'20,000 psi'),(N'BV2003S06-S',N'Tube Size',N'3/8"'),(N'BV2003S06-S',N'Orifice Size',N'4.8 mm'),(N'BV2003S06-S',N'Finish',N'Standard'),
  (N'BV2003S09-S',N'Pressure Rating',N'20,000 psi'),(N'BV2003S09-S',N'Tube Size',N'9/16"'),(N'BV2003S09-S',N'Orifice Size',N'4.8 mm'),(N'BV2003S09-S',N'Finish',N'Standard'),
  (N'BVN03S04-S',N'Pressure Rating',N'15,000 psi'),(N'BVN03S04-S',N'Tube Size',N'1/4"'),(N'BVN03S04-S',N'Orifice Size',N'4.8 mm'),(N'BVN03S04-S',N'Finish',N'Standard'),
  (N'BVN03S06-S',N'Pressure Rating',N'15,000 psi'),(N'BVN03S06-S',N'Tube Size',N'3/8"'),(N'BVN03S06-S',N'Orifice Size',N'4.8 mm'),(N'BVN03S06-S',N'Finish',N'Standard'),
  (N'BV2003S04-180',N'Pressure Rating',N'20,000 psi'),(N'BV2003S04-180',N'Tube Size',N'1/4"'),(N'BV2003S04-180',N'Orifice Size',N'4.8 mm'),(N'BV2003S04-180',N'Finish',N'180'),
  (N'BV2003S06-180',N'Pressure Rating',N'20,000 psi'),(N'BV2003S06-180',N'Tube Size',N'3/8"'),(N'BV2003S06-180',N'Orifice Size',N'4.8 mm'),(N'BV2003S06-180',N'Finish',N'180'),
  (N'BV2003S09-180',N'Pressure Rating',N'20,000 psi'),(N'BV2003S09-180',N'Tube Size',N'9/16"'),(N'BV2003S09-180',N'Orifice Size',N'4.8 mm'),(N'BV2003S09-180',N'Finish',N'180'),
  (N'BVN03S04-180',N'Pressure Rating',N'15,000 psi'),(N'BVN03S04-180',N'Tube Size',N'1/4"'),(N'BVN03S04-180',N'Orifice Size',N'4.8 mm'),(N'BVN03S04-180',N'Finish',N'180'),
  (N'BVN03S06-180',N'Pressure Rating',N'15,000 psi'),(N'BVN03S06-180',N'Tube Size',N'3/8"'),(N'BVN03S06-180',N'Orifice Size',N'4.8 mm'),(N'BVN03S06-180',N'Finish',N'180'),
  (N'BV2005S04-S',N'Pressure Rating',N'15,000 psi'),(N'BV2005S04-S',N'Tube Size',N'1/4"'),(N'BV2005S04-S',N'Orifice Size',N'8 mm'),(N'BV2005S04-S',N'Finish',N'Standard'),
  (N'BV2005S06-S',N'Pressure Rating',N'15,000 psi'),(N'BV2005S06-S',N'Tube Size',N'3/8"'),(N'BV2005S06-S',N'Orifice Size',N'8 mm'),(N'BV2005S06-S',N'Finish',N'Standard'),
  (N'BV2005S09-S',N'Pressure Rating',N'15,000 psi'),(N'BV2005S09-S',N'Tube Size',N'9/16"'),(N'BV2005S09-S',N'Orifice Size',N'8 mm'),(N'BV2005S09-S',N'Finish',N'Standard'),
  (N'BVN05S08-S',N'Pressure Rating',N'15,000 psi'),(N'BVN05S08-S',N'Tube Size',N'1/2"'),(N'BVN05S08-S',N'Orifice Size',N'8 mm'),(N'BVN05S08-S',N'Finish',N'Standard'),
  (N'BV2005S04-180',N'Pressure Rating',N'15,000 psi'),(N'BV2005S04-180',N'Tube Size',N'1/4"'),(N'BV2005S04-180',N'Orifice Size',N'8 mm'),(N'BV2005S04-180',N'Finish',N'180'),
  (N'BV2005S06-180',N'Pressure Rating',N'15,000 psi'),(N'BV2005S06-180',N'Tube Size',N'3/8"'),(N'BV2005S06-180',N'Orifice Size',N'8 mm'),(N'BV2005S06-180',N'Finish',N'180'),
  (N'BV2005S09-180',N'Pressure Rating',N'15,000 psi'),(N'BV2005S09-180',N'Tube Size',N'9/16"'),(N'BV2005S09-180',N'Orifice Size',N'8 mm'),(N'BV2005S09-180',N'Finish',N'180'),
  (N'BVN05S08-180',N'Pressure Rating',N'15,000 psi'),(N'BVN05S08-180',N'Tube Size',N'1/2"'),(N'BVN05S08-180',N'Orifice Size',N'8 mm'),(N'BVN05S08-180',N'Finish',N'180')
) AS v(PartNumber, FilterName, Value) ON v.PartNumber = p.PartNumber
JOIN Filters f ON f.Name = v.FilterName WHERE p.CategoryId=@CategoryId;

SELECT COUNT(*) AS Products FROM CatalogProducts WHERE CategoryId=@CategoryId;
SELECT COUNT(*) AS FilterValues FROM ProductFilterValues WHERE CategoryId=@CategoryId;
