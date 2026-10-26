-- LOK Tube products (5) + filter values. Run AFTER the info file. Source: Mongo product_variants.
DECLARE @SeriesName nvarchar(100) = N'LOK Tube';
DECLARE @CategoryId int = (SELECT CategoryId FROM Categories WHERE Name = @SeriesName);

INSERT INTO Filters (Name) SELECT v.Name FROM (VALUES (N'Size'),(N'Pressure Rating')) AS v(Name)
WHERE NOT EXISTS (SELECT 1 FROM Filters f WHERE f.Name = v.Name);

INSERT INTO CategoryFilters (CategoryId, FilterId, SortOrder)
SELECT @CategoryId, f.FilterId, v.SortOrder
FROM (VALUES (N'Size',0),(N'Pressure Rating',1)) AS v(FilterName, SortOrder)
JOIN Filters f ON f.Name = v.FilterName
WHERE NOT EXISTS (SELECT 1 FROM CategoryFilters cf WHERE cf.CategoryId=@CategoryId AND cf.FilterId=f.FilterId);

INSERT INTO CatalogProducts (PartNumber, CategoryId, ProductStatus, FamilyDescription, DetailDescription, ImageUrl, Price) VALUES
(N'LOK-TUBE-1-4OD', @CategoryId, N'Active', N'Hiflux LOK Tube', N'Hiflux LOK Tube - 1/4" OD / 5,100 psi', N'https://pblol2.blob.core.windows.net/hiflux/lok/hiflux_tube.png', NULL),
(N'LOK-TUBE-3-8OD', @CategoryId, N'Active', N'Hiflux LOK Tube', N'Hiflux LOK Tube - 3/8" OD / 3,300 psi', N'https://pblol2.blob.core.windows.net/hiflux/lok/hiflux_tube.png', NULL),
(N'LOK-TUBE-1-2OD', @CategoryId, N'Active', N'Hiflux LOK Tube', N'Hiflux LOK Tube - 1/2" OD / 2,600 psi', N'https://pblol2.blob.core.windows.net/hiflux/lok/hiflux_tube.png', NULL),
(N'LOK-TUBE-3-4OD', @CategoryId, N'Active', N'Hiflux LOK Tube', N'Hiflux LOK Tube - 3/4" OD / 2,400 psi', N'https://pblol2.blob.core.windows.net/hiflux/lok/hiflux_tube.png', NULL),
(N'LOK-TUBE-1OD', @CategoryId, N'Active', N'Hiflux LOK Tube', N'Hiflux LOK Tube - 1" OD / 2,400 psi', N'https://pblol2.blob.core.windows.net/hiflux/lok/hiflux_tube.png', NULL);

INSERT INTO ProductFilterValues (ProductId, CategoryId, FilterId, Value)
SELECT p.ProductId, p.CategoryId, f.FilterId, v.Value
FROM CatalogProducts p
JOIN (VALUES
  (N'LOK-TUBE-1-4OD',N'Size',N'1/4" OD'),(N'LOK-TUBE-1-4OD',N'Pressure Rating',N'5,100 psi'),
  (N'LOK-TUBE-3-8OD',N'Size',N'3/8" OD'),(N'LOK-TUBE-3-8OD',N'Pressure Rating',N'3,300 psi'),
  (N'LOK-TUBE-1-2OD',N'Size',N'1/2" OD'),(N'LOK-TUBE-1-2OD',N'Pressure Rating',N'2,600 psi'),
  (N'LOK-TUBE-3-4OD',N'Size',N'3/4" OD'),(N'LOK-TUBE-3-4OD',N'Pressure Rating',N'2,400 psi'),
  (N'LOK-TUBE-1OD',N'Size',N'1" OD'),(N'LOK-TUBE-1OD',N'Pressure Rating',N'2,400 psi')
) AS v(PartNumber, FilterName, Value) ON v.PartNumber = p.PartNumber
JOIN Filters f ON f.Name = v.FilterName WHERE p.CategoryId=@CategoryId;

SELECT COUNT(*) AS Products FROM CatalogProducts WHERE CategoryId=@CategoryId;
SELECT COUNT(*) AS FilterValues FROM ProductFilterValues WHERE CategoryId=@CategoryId;
