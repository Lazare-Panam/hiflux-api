-- One-time fix: the HF coning cutters / collets / threading guide bushings were
-- mislabelled 20,000 psi in the source (identical to their LF twins), so the
-- configurator could never resolve them. Per the LF/HF convention (LF = 20,000,
-- HF = 60,000) these are 60,000 psi. Run once against the Hiflux DB.
SET NOCOUNT ON;

DECLARE @hf TABLE (PartNumber nvarchar(100) PRIMARY KEY);
INSERT INTO @hf (PartNumber) VALUES
  ('CT-HF4L'),('CT-HF6L'),('CT-HF9L'),
  ('CT-HF4P'),('CT-HF6P'),('CT-HF9P'),
  ('CT-MHF4P'),('CT-MHF6P'),('CT-MHF9P');

-- correct the Pressure Rating filter value
UPDATE pfv
SET pfv.Value = N'60,000 psi'
FROM ProductFilterValues pfv
JOIN CatalogProducts p ON p.ProductId = pfv.ProductId
JOIN Filters f ON f.FilterId = pfv.FilterId
WHERE f.Name = N'Pressure Rating'
  AND pfv.Value = N'20,000 psi'
  AND p.PartNumber IN (SELECT PartNumber FROM @hf);

-- keep the human-readable detail line consistent
UPDATE p
SET p.DetailDescription = REPLACE(p.DetailDescription, N'20,000 psi', N'60,000 psi')
FROM CatalogProducts p
WHERE p.PartNumber IN (SELECT PartNumber FROM @hf);

-- verify
SELECT p.PartNumber, f.Name AS Filter, pfv.Value
FROM ProductFilterValues pfv
JOIN CatalogProducts p ON p.ProductId = pfv.ProductId
JOIN Filters f ON f.FilterId = pfv.FilterId
WHERE p.PartNumber IN (SELECT PartNumber FROM @hf) AND f.Name = N'Pressure Rating'
ORDER BY p.PartNumber;
