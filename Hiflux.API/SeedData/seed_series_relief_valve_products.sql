-- High Pressure Relief Valve - Factory Set products (5, price on request) + filter values. Run AFTER the info file.
-- Single facet: Pressure Rating (set pressure). Type (Factory Set) and Service (Liquid) are
-- constant across the range, so they live in the series content, not as selectable filters.
DECLARE @SeriesName nvarchar(100) = N'High Pressure Relief Valve - Factory Set';
DECLARE @CategoryId int = (SELECT CategoryId FROM Categories WHERE Name = @SeriesName);

INSERT INTO Filters (Name) SELECT v.Name FROM (VALUES (N'Pressure Rating')) AS v(Name)
WHERE NOT EXISTS (SELECT 1 FROM Filters f WHERE f.Name = v.Name);

INSERT INTO CategoryFilters (CategoryId, FilterId, SortOrder)
SELECT @CategoryId, f.FilterId, v.SortOrder
FROM (VALUES (N'Pressure Rating',0)) AS v(FilterName, SortOrder)
JOIN Filters f ON f.Name = v.FilterName
WHERE NOT EXISTS (SELECT 1 FROM CategoryFilters cf WHERE cf.CategoryId=@CategoryId AND cf.FilterId=f.FilterId);

INSERT INTO CatalogProducts (PartNumber, CategoryId, ProductStatus, FamilyDescription, DetailDescription, ImageUrl, Price) VALUES
(N'RV60FSS09', @CategoryId, N'Active', N'Hiflux High Pressure Relief Valve', N'Hiflux Relief Valve - 60,000 psi - Factory Set', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/relief-valve.png', NULL),
(N'RV45FSS09', @CategoryId, N'Active', N'Hiflux High Pressure Relief Valve', N'Hiflux Relief Valve - 45,000 psi - Factory Set', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/relief-valve.png', NULL),
(N'RV30FSS09', @CategoryId, N'Active', N'Hiflux High Pressure Relief Valve', N'Hiflux Relief Valve - 30,000 psi - Factory Set', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/relief-valve.png', NULL),
(N'RV21FSS09', @CategoryId, N'Active', N'Hiflux High Pressure Relief Valve', N'Hiflux Relief Valve - 21,000 psi - Factory Set', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/relief-valve.png', NULL),
(N'RV11FSS09', @CategoryId, N'Active', N'Hiflux High Pressure Relief Valve', N'Hiflux Relief Valve - 11,000 psi - Factory Set', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/relief-valve.png', NULL);

INSERT INTO ProductFilterValues (ProductId, CategoryId, FilterId, Value)
SELECT p.ProductId, p.CategoryId, f.FilterId, v.Value
FROM CatalogProducts p
JOIN (VALUES
  (N'RV60FSS09',N'Pressure Rating',N'60,000 psi'),
  (N'RV45FSS09',N'Pressure Rating',N'45,000 psi'),
  (N'RV30FSS09',N'Pressure Rating',N'30,000 psi'),
  (N'RV21FSS09',N'Pressure Rating',N'21,000 psi'),
  (N'RV11FSS09',N'Pressure Rating',N'11,000 psi')
) AS v(PartNumber, FilterName, Value) ON v.PartNumber = p.PartNumber
JOIN Filters f ON f.Name = v.FilterName WHERE p.CategoryId=@CategoryId;

SELECT COUNT(*) AS Products FROM CatalogProducts WHERE CategoryId=@CategoryId;
SELECT COUNT(*) AS FilterValues FROM ProductFilterValues WHERE CategoryId=@CategoryId;
