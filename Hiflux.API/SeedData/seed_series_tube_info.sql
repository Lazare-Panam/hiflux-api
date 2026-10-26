-- High Pressure Tube - Ultra Pressure series row. Run BEFORE the products file.
IF NOT EXISTS (SELECT 1 FROM Categories WHERE Name = N'High Pressure Tube - Ultra Pressure')
    INSERT INTO Categories (Name, Description, BodyMaterial, Design, TemperatureRange, KeyFeatures)
    VALUES (N'High Pressure Tube - Ultra Pressure', N'Ultra high pressure tube rated to 100,000 psi for extreme applications. Cold-drawn seamless construction provides the strength and surface finish required for reliable high pressure fitting connections.', N'316 Stainless Steel', N'Cold-drawn seamless', N'-20' + NCHAR(176) + N'C to 150' + NCHAR(176) + N'C', N'Ultra high pressure rated to 100,000 psi
Seamless cold-drawn construction
Precision OD tolerance for cone fittings
Corrosion-resistant stainless steel');

SELECT CategoryId, Name FROM Categories WHERE Name = N'High Pressure Tube - Ultra Pressure';
