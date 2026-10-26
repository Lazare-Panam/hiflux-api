-- High Pressure Manifold Block - High Pressure series row. Run from file (SSMS: File > Open > Execute). Run BEFORE the products file.
IF NOT EXISTS (SELECT 1 FROM Categories WHERE Name = N'High Pressure Manifold Block - High Pressure')
    INSERT INTO Categories (Name, Description, BodyMaterial, Design, TemperatureRange, KeyFeatures)
    VALUES (N'High Pressure Manifold Block - High Pressure', N'High pressure manifold block for multi-port flow distribution at 60,000 psi. Machined from solid stock to provide multiple outlet ports from a single high pressure inlet.', N'316 Stainless Steel', N'Machined from solid bar stock', N'-20' + NCHAR(176) + N'C to 150' + NCHAR(176) + N'C', N'High pressure rated to 60,000 psi
Multi-port flow distribution
No welded joints
Compact block design');

SELECT CategoryId, Name FROM Categories WHERE Name = N'High Pressure Manifold Block - High Pressure';
