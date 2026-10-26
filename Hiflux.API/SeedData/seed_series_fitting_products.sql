-- High Pressure Fitting - Ultra High Pressure products (57) + filter values. Run AFTER the info file.
-- Facets: Type / Pressure Rating / Tube Size. 9 legacy facet-duplicate SKUs dropped.
DECLARE @SeriesName nvarchar(100) = N'High Pressure Fitting - Ultra High Pressure';
DECLARE @CategoryId int = (SELECT CategoryId FROM Categories WHERE Name = @SeriesName);

INSERT INTO Filters (Name) SELECT v.Name FROM (VALUES (N'Type'),(N'Pressure Rating'),(N'Tube Size')) AS v(Name)
WHERE NOT EXISTS (SELECT 1 FROM Filters f WHERE f.Name = v.Name);

INSERT INTO CategoryFilters (CategoryId, FilterId, SortOrder)
SELECT @CategoryId, f.FilterId, v.SortOrder
FROM (VALUES (N'Type',0),(N'Pressure Rating',1),(N'Tube Size',2)) AS v(FilterName, SortOrder)
JOIN Filters f ON f.Name = v.FilterName
WHERE NOT EXISTS (SELECT 1 FROM CategoryFilters cf WHERE cf.CategoryId=@CategoryId AND cf.FilterId=f.FilterId);

INSERT INTO CatalogProducts (PartNumber, CategoryId, ProductStatus, FamilyDescription, DetailDescription, ImageUrl, Price) VALUES
(N'FT15ES02', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Elbow - 15,000 psi - 1/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 57.60),
(N'FT15ES04', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Elbow - 15,000 psi - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 72.00),
(N'FT15ES06', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Elbow - 15,000 psi - 3/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 80.40),
(N'FTNES08', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Elbow - 15,000 psi - 1/2"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 70.80),
(N'FTNES12', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Elbow - 10,000 psi - 3/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 157.20),
(N'FTNES16', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Elbow - 10,000 psi - 1"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 258.00),
(N'FT15TS02', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Tee - 15,000 psi - 1/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 70.80),
(N'FT15TS04', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Tee - 15,000 psi - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 92.40),
(N'FT15TS06', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Tee - 15,000 psi - 3/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 100.80),
(N'FTNTS08', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Tee - 15,000 psi - 1/2"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 93.60),
(N'FTNTS12', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Tee - 10,000 psi - 3/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 208.80),
(N'FTNTS16', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Tee - 10,000 psi - 1"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 292.80),
(N'FT15CS02', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Cross - 15,000 psi - 1/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 88.80),
(N'FT15CS04', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Cross - 15,000 psi - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 109.20),
(N'FT15CS06', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Cross - 15,000 psi - 3/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 123.60),
(N'FTNCS08', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Cross - 15,000 psi - 1/2"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 109.20),
(N'FTNCS12', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Cross - 10,000 psi - 3/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 279.60),
(N'FTNCS16', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Cross - 10,000 psi - 1"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 414.00),
(N'FT10ES08', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Elbow - 10,000 psi - 1/2"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 90.00),
(N'FT10TS08', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Tee - 10,000 psi - 1/2"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 110.40),
(N'FT10CS08', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Cross - 10,000 psi - 1/2"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 146.40),
(N'FT20ES04', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Elbow - 20,000 psi - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 46.80),
(N'FT20ES06', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Elbow - 20,000 psi - 3/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 63.60),
(N'FT20ES09', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Elbow - 20,000 psi - 9/16"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 78.00),
(N'FT20ES12', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Elbow - 20,000 psi - 3/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 165.60),
(N'FT20ES16', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Elbow - 20,000 psi - 1"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 286.80),
(N'FT20TS04', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Tee - 20,000 psi - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 63.60),
(N'FT20TS06', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Tee - 20,000 psi - 3/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 72.00),
(N'FT20TS09', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Tee - 20,000 psi - 9/16"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 106.80),
(N'FT20TS12', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Tee - 20,000 psi - 3/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 222.00),
(N'FT20TS16', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Tee - 20,000 psi - 1"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 339.60),
(N'FT20CS04', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Cross - 20,000 psi - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 76.80),
(N'FT20CS06', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Cross - 20,000 psi - 3/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 87.60),
(N'FT20CS09', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Cross - 20,000 psi - 9/16"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 133.20),
(N'FT20CS12', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Cross - 20,000 psi - 3/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 301.20),
(N'FT20CS16', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Cross - 20,000 psi - 1"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 460.80),
(N'FT60ES04', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Elbow - 60,000 psi - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 57.60),
(N'FT60ES06', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Elbow - 60,000 psi - 3/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 76.80),
(N'FT60ES09', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Elbow - 60,000 psi - 9/16"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 108.00),
(N'FT30ES02', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Elbow - 30,000 psi - 1/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 64.80),
(N'FT30ES16', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Elbow - 30,000 psi - 1"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 321.60),
(N'FT60TS04', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Tee - 60,000 psi - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 78.00),
(N'FT60TS06', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Tee - 60,000 psi - 3/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 92.40),
(N'FT60TS09', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Tee - 60,000 psi - 9/16"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 141.60),
(N'FT30TS02', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Tee - 30,000 psi - 1/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 84.00),
(N'FT30TS16', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Tee - 30,000 psi - 1"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 388.80),
(N'FT60CS04', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Cross - 60,000 psi - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 88.80),
(N'FT60CS06', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Cross - 60,000 psi - 3/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 114.00),
(N'FT60CS09', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Cross - 60,000 psi - 9/16"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 163.20),
(N'FT30CS02', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Cross - 30,000 psi - 1/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 100.80),
(N'FT30CS16', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Cross - 30,000 psi - 1"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 552.00),
(N'FT100ES04', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Elbow - 100,000 psi - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 150.00),
(N'FT150ES06', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Elbow - 150,000 psi - 3/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 204.00),
(N'FT100TS04', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Tee - 100,000 psi - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 199.20),
(N'FT150TS06', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Tee - 150,000 psi - 3/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 267.60),
(N'FT100CS04', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Cross - 100,000 psi - 1/4"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 229.20),
(N'FT150CS06', @CategoryId, N'Active', N'Hiflux High Pressure Fitting', N'Hiflux Cross - 150,000 psi - 3/8"', N'https://pblol2.blob.core.windows.net/valvenok-images/products/hiflux/reducing-fitting.png', 291.60);

INSERT INTO ProductFilterValues (ProductId, CategoryId, FilterId, Value)
SELECT p.ProductId, p.CategoryId, f.FilterId, v.Value
FROM CatalogProducts p
JOIN (VALUES
  (N'FT15ES02',N'Type',N'Elbow'),(N'FT15ES02',N'Pressure Rating',N'15,000 psi'),(N'FT15ES02',N'Tube Size',N'1/8"'),
  (N'FT15ES04',N'Type',N'Elbow'),(N'FT15ES04',N'Pressure Rating',N'15,000 psi'),(N'FT15ES04',N'Tube Size',N'1/4"'),
  (N'FT15ES06',N'Type',N'Elbow'),(N'FT15ES06',N'Pressure Rating',N'15,000 psi'),(N'FT15ES06',N'Tube Size',N'3/8"'),
  (N'FTNES08',N'Type',N'Elbow'),(N'FTNES08',N'Pressure Rating',N'15,000 psi'),(N'FTNES08',N'Tube Size',N'1/2"'),
  (N'FTNES12',N'Type',N'Elbow'),(N'FTNES12',N'Pressure Rating',N'10,000 psi'),(N'FTNES12',N'Tube Size',N'3/4"'),
  (N'FTNES16',N'Type',N'Elbow'),(N'FTNES16',N'Pressure Rating',N'10,000 psi'),(N'FTNES16',N'Tube Size',N'1"'),
  (N'FT15TS02',N'Type',N'Tee'),(N'FT15TS02',N'Pressure Rating',N'15,000 psi'),(N'FT15TS02',N'Tube Size',N'1/8"'),
  (N'FT15TS04',N'Type',N'Tee'),(N'FT15TS04',N'Pressure Rating',N'15,000 psi'),(N'FT15TS04',N'Tube Size',N'1/4"'),
  (N'FT15TS06',N'Type',N'Tee'),(N'FT15TS06',N'Pressure Rating',N'15,000 psi'),(N'FT15TS06',N'Tube Size',N'3/8"'),
  (N'FTNTS08',N'Type',N'Tee'),(N'FTNTS08',N'Pressure Rating',N'15,000 psi'),(N'FTNTS08',N'Tube Size',N'1/2"'),
  (N'FTNTS12',N'Type',N'Tee'),(N'FTNTS12',N'Pressure Rating',N'10,000 psi'),(N'FTNTS12',N'Tube Size',N'3/4"'),
  (N'FTNTS16',N'Type',N'Tee'),(N'FTNTS16',N'Pressure Rating',N'10,000 psi'),(N'FTNTS16',N'Tube Size',N'1"'),
  (N'FT15CS02',N'Type',N'Cross'),(N'FT15CS02',N'Pressure Rating',N'15,000 psi'),(N'FT15CS02',N'Tube Size',N'1/8"'),
  (N'FT15CS04',N'Type',N'Cross'),(N'FT15CS04',N'Pressure Rating',N'15,000 psi'),(N'FT15CS04',N'Tube Size',N'1/4"'),
  (N'FT15CS06',N'Type',N'Cross'),(N'FT15CS06',N'Pressure Rating',N'15,000 psi'),(N'FT15CS06',N'Tube Size',N'3/8"'),
  (N'FTNCS08',N'Type',N'Cross'),(N'FTNCS08',N'Pressure Rating',N'15,000 psi'),(N'FTNCS08',N'Tube Size',N'1/2"'),
  (N'FTNCS12',N'Type',N'Cross'),(N'FTNCS12',N'Pressure Rating',N'10,000 psi'),(N'FTNCS12',N'Tube Size',N'3/4"'),
  (N'FTNCS16',N'Type',N'Cross'),(N'FTNCS16',N'Pressure Rating',N'10,000 psi'),(N'FTNCS16',N'Tube Size',N'1"'),
  (N'FT10ES08',N'Type',N'Elbow'),(N'FT10ES08',N'Pressure Rating',N'10,000 psi'),(N'FT10ES08',N'Tube Size',N'1/2"'),
  (N'FT10TS08',N'Type',N'Tee'),(N'FT10TS08',N'Pressure Rating',N'10,000 psi'),(N'FT10TS08',N'Tube Size',N'1/2"'),
  (N'FT10CS08',N'Type',N'Cross'),(N'FT10CS08',N'Pressure Rating',N'10,000 psi'),(N'FT10CS08',N'Tube Size',N'1/2"'),
  (N'FT20ES04',N'Type',N'Elbow'),(N'FT20ES04',N'Pressure Rating',N'20,000 psi'),(N'FT20ES04',N'Tube Size',N'1/4"'),
  (N'FT20ES06',N'Type',N'Elbow'),(N'FT20ES06',N'Pressure Rating',N'20,000 psi'),(N'FT20ES06',N'Tube Size',N'3/8"'),
  (N'FT20ES09',N'Type',N'Elbow'),(N'FT20ES09',N'Pressure Rating',N'20,000 psi'),(N'FT20ES09',N'Tube Size',N'9/16"'),
  (N'FT20ES12',N'Type',N'Elbow'),(N'FT20ES12',N'Pressure Rating',N'20,000 psi'),(N'FT20ES12',N'Tube Size',N'3/4"'),
  (N'FT20ES16',N'Type',N'Elbow'),(N'FT20ES16',N'Pressure Rating',N'20,000 psi'),(N'FT20ES16',N'Tube Size',N'1"'),
  (N'FT20TS04',N'Type',N'Tee'),(N'FT20TS04',N'Pressure Rating',N'20,000 psi'),(N'FT20TS04',N'Tube Size',N'1/4"'),
  (N'FT20TS06',N'Type',N'Tee'),(N'FT20TS06',N'Pressure Rating',N'20,000 psi'),(N'FT20TS06',N'Tube Size',N'3/8"'),
  (N'FT20TS09',N'Type',N'Tee'),(N'FT20TS09',N'Pressure Rating',N'20,000 psi'),(N'FT20TS09',N'Tube Size',N'9/16"'),
  (N'FT20TS12',N'Type',N'Tee'),(N'FT20TS12',N'Pressure Rating',N'20,000 psi'),(N'FT20TS12',N'Tube Size',N'3/4"'),
  (N'FT20TS16',N'Type',N'Tee'),(N'FT20TS16',N'Pressure Rating',N'20,000 psi'),(N'FT20TS16',N'Tube Size',N'1"'),
  (N'FT20CS04',N'Type',N'Cross'),(N'FT20CS04',N'Pressure Rating',N'20,000 psi'),(N'FT20CS04',N'Tube Size',N'1/4"'),
  (N'FT20CS06',N'Type',N'Cross'),(N'FT20CS06',N'Pressure Rating',N'20,000 psi'),(N'FT20CS06',N'Tube Size',N'3/8"'),
  (N'FT20CS09',N'Type',N'Cross'),(N'FT20CS09',N'Pressure Rating',N'20,000 psi'),(N'FT20CS09',N'Tube Size',N'9/16"'),
  (N'FT20CS12',N'Type',N'Cross'),(N'FT20CS12',N'Pressure Rating',N'20,000 psi'),(N'FT20CS12',N'Tube Size',N'3/4"'),
  (N'FT20CS16',N'Type',N'Cross'),(N'FT20CS16',N'Pressure Rating',N'20,000 psi'),(N'FT20CS16',N'Tube Size',N'1"'),
  (N'FT60ES04',N'Type',N'Elbow'),(N'FT60ES04',N'Pressure Rating',N'60,000 psi'),(N'FT60ES04',N'Tube Size',N'1/4"'),
  (N'FT60ES06',N'Type',N'Elbow'),(N'FT60ES06',N'Pressure Rating',N'60,000 psi'),(N'FT60ES06',N'Tube Size',N'3/8"'),
  (N'FT60ES09',N'Type',N'Elbow'),(N'FT60ES09',N'Pressure Rating',N'60,000 psi'),(N'FT60ES09',N'Tube Size',N'9/16"'),
  (N'FT30ES02',N'Type',N'Elbow'),(N'FT30ES02',N'Pressure Rating',N'30,000 psi'),(N'FT30ES02',N'Tube Size',N'1/8"'),
  (N'FT30ES16',N'Type',N'Elbow'),(N'FT30ES16',N'Pressure Rating',N'30,000 psi'),(N'FT30ES16',N'Tube Size',N'1"'),
  (N'FT60TS04',N'Type',N'Tee'),(N'FT60TS04',N'Pressure Rating',N'60,000 psi'),(N'FT60TS04',N'Tube Size',N'1/4"'),
  (N'FT60TS06',N'Type',N'Tee'),(N'FT60TS06',N'Pressure Rating',N'60,000 psi'),(N'FT60TS06',N'Tube Size',N'3/8"'),
  (N'FT60TS09',N'Type',N'Tee'),(N'FT60TS09',N'Pressure Rating',N'60,000 psi'),(N'FT60TS09',N'Tube Size',N'9/16"'),
  (N'FT30TS02',N'Type',N'Tee'),(N'FT30TS02',N'Pressure Rating',N'30,000 psi'),(N'FT30TS02',N'Tube Size',N'1/8"'),
  (N'FT30TS16',N'Type',N'Tee'),(N'FT30TS16',N'Pressure Rating',N'30,000 psi'),(N'FT30TS16',N'Tube Size',N'1"'),
  (N'FT60CS04',N'Type',N'Cross'),(N'FT60CS04',N'Pressure Rating',N'60,000 psi'),(N'FT60CS04',N'Tube Size',N'1/4"'),
  (N'FT60CS06',N'Type',N'Cross'),(N'FT60CS06',N'Pressure Rating',N'60,000 psi'),(N'FT60CS06',N'Tube Size',N'3/8"'),
  (N'FT60CS09',N'Type',N'Cross'),(N'FT60CS09',N'Pressure Rating',N'60,000 psi'),(N'FT60CS09',N'Tube Size',N'9/16"'),
  (N'FT30CS02',N'Type',N'Cross'),(N'FT30CS02',N'Pressure Rating',N'30,000 psi'),(N'FT30CS02',N'Tube Size',N'1/8"'),
  (N'FT30CS16',N'Type',N'Cross'),(N'FT30CS16',N'Pressure Rating',N'30,000 psi'),(N'FT30CS16',N'Tube Size',N'1"'),
  (N'FT100ES04',N'Type',N'Elbow'),(N'FT100ES04',N'Pressure Rating',N'100,000 psi'),(N'FT100ES04',N'Tube Size',N'1/4"'),
  (N'FT150ES06',N'Type',N'Elbow'),(N'FT150ES06',N'Pressure Rating',N'150,000 psi'),(N'FT150ES06',N'Tube Size',N'3/8"'),
  (N'FT100TS04',N'Type',N'Tee'),(N'FT100TS04',N'Pressure Rating',N'100,000 psi'),(N'FT100TS04',N'Tube Size',N'1/4"'),
  (N'FT150TS06',N'Type',N'Tee'),(N'FT150TS06',N'Pressure Rating',N'150,000 psi'),(N'FT150TS06',N'Tube Size',N'3/8"'),
  (N'FT100CS04',N'Type',N'Cross'),(N'FT100CS04',N'Pressure Rating',N'100,000 psi'),(N'FT100CS04',N'Tube Size',N'1/4"'),
  (N'FT150CS06',N'Type',N'Cross'),(N'FT150CS06',N'Pressure Rating',N'150,000 psi'),(N'FT150CS06',N'Tube Size',N'3/8"')
) AS v(PartNumber, FilterName, Value) ON v.PartNumber = p.PartNumber
JOIN Filters f ON f.Name = v.FilterName WHERE p.CategoryId=@CategoryId;

SELECT COUNT(*) AS Products FROM CatalogProducts WHERE CategoryId=@CategoryId;
SELECT COUNT(*) AS FilterValues FROM ProductFilterValues WHERE CategoryId=@CategoryId;
