-- High Pressure Nipple - Ultra High Pressure series row. Run BEFORE the products file.
IF NOT EXISTS (SELECT 1 FROM Categories WHERE Name = N'High Pressure Nipple - Ultra High Pressure')
    INSERT INTO Categories (Name, Description, BodyMaterial, Design, TemperatureRange, KeyFeatures)
    VALUES (N'High Pressure Nipple - Ultra High Pressure', N'Ultra high pressure nipple rated to 100,000 psi. Provides a solid transition point between tube ends and fittings, valves, or manifolds in extreme service systems.', N'316 Stainless Steel', N'Male-to-male connector nipple', N'-20' + NCHAR(176) + N'C to 150' + NCHAR(176) + N'C', N'Ultra high pressure rated to 100,000 psi
Solid one-piece machined construction
Metal-to-metal cone seal compatible
Corrosion-resistant stainless steel');

SELECT CategoryId, Name FROM Categories WHERE Name = N'High Pressure Nipple - Ultra High Pressure';
