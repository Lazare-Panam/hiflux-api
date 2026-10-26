-- One-time fix: Bleed Valves (BLV*) all had Size "1/8" NPT" in the source, so the
-- three sizes per pressure were indistinguishable. The 04/06/09 SKU suffix is the
-- same size convention used across every series (1/4" / 3/8" / 9/16"). Run once.
SET NOCOUNT ON;

UPDATE pfv SET pfv.Value = sz.NewSize
FROM ProductFilterValues pfv
JOIN CatalogProducts p ON p.ProductId = pfv.ProductId
JOIN Filters f ON f.FilterId = pfv.FilterId
JOIN (VALUES
  ('BLV20VS04', N'1/4"'), ('BLV20VS06', N'3/8"'), ('BLV20VS09', N'9/16"'),
  ('BLV30VS04', N'1/4"'), ('BLV30VS06', N'3/8"'), ('BLV30VS09', N'9/16"')
) AS sz(PartNumber, NewSize) ON sz.PartNumber = p.PartNumber
WHERE f.Name = N'Size' AND pfv.Value = N'1/8" NPT';

UPDATE p SET p.DetailDescription = REPLACE(p.DetailDescription, N'1/8" NPT', sz.NewSize)
FROM CatalogProducts p
JOIN (VALUES
  ('BLV20VS04', N'1/4"'), ('BLV20VS06', N'3/8"'), ('BLV20VS09', N'9/16"'),
  ('BLV30VS04', N'1/4"'), ('BLV30VS06', N'3/8"'), ('BLV30VS09', N'9/16"')
) AS sz(PartNumber, NewSize) ON sz.PartNumber = p.PartNumber;

SELECT p.PartNumber, pfv.Value AS Size
FROM ProductFilterValues pfv
JOIN CatalogProducts p ON p.ProductId = pfv.ProductId
JOIN Filters f ON f.FilterId = pfv.FilterId
WHERE f.Name = N'Size' AND p.PartNumber LIKE 'BLV%' ORDER BY p.PartNumber;
