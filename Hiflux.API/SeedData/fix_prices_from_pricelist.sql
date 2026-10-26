-- Fill in prices that were NULL in the DB but have a real price in the
-- Hiflux Price List (20.07.2026). Cross-check found 0 mismatches; these are the
-- only NULL->value corrections (2 rows). Run once.
SET NOCOUNT ON;
UPDATE p SET p.Price = v.Price
FROM dbo.CatalogProducts p
JOIN (VALUES
  (N'RV45FSS09', 870.00),
  (N'RV21FSS09', 870.00)
) AS v(PartNumber, Price) ON v.PartNumber = p.PartNumber
WHERE p.Price IS NULL;
SELECT @@ROWCOUNT AS Updated;
