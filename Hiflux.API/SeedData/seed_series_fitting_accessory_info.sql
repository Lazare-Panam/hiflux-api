-- High Pressure Fitting Accessory - Ultra High Pressure series row. Run from file (SSMS: File > Open > Execute). Run BEFORE the products file.
IF NOT EXISTS (SELECT 1 FROM Categories WHERE Name = N'High Pressure Fitting Accessory - Ultra High Pressure')
    INSERT INTO Categories (Name, Description, BodyMaterial, TemperatureRange, KeyFeatures)
    VALUES (N'High Pressure Fitting Accessory - Ultra High Pressure', N'Ultra high pressure fitting accessory rated to 150,000 psi. Supports fitting assembly, sealing, and connection integrity across ultra high pressure systems.', N'316 Stainless Steel', N'-20' + NCHAR(176) + N'C to 150' + NCHAR(176) + N'C', N'Ultra high pressure rated to 150,000 psi
Compatible with standard UNF fittings
Corrosion-resistant construction
Field-replaceable component');

SELECT CategoryId, Name FROM Categories WHERE Name = N'High Pressure Fitting Accessory - Ultra High Pressure';
