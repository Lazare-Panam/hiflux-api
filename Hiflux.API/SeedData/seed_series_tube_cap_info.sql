-- High Pressure Tube Cap - High Pressure series row. Run from file (SSMS: File > Open > Execute). Run BEFORE the products file.
IF NOT EXISTS (SELECT 1 FROM Categories WHERE Name = N'High Pressure Tube Cap - High Pressure')
    INSERT INTO Categories (Name, Description, BodyMaterial, Design, TemperatureRange, KeyFeatures)
    VALUES (N'High Pressure Tube Cap - High Pressure', N'High pressure tube cap for sealing lines at 60,000 psi. Provides a secure, leak-tight seal on unused tube ends or ports in high pressure systems.', N'316 Stainless Steel', N'Metal-to-metal cone seal', N'-20' + NCHAR(176) + N'C to 150' + NCHAR(176) + N'C', N'High pressure rated to 60,000 psi
Leak-tight line termination
Reusable, no elastomers
Compact low-profile design');

SELECT CategoryId, Name FROM Categories WHERE Name = N'High Pressure Tube Cap - High Pressure';
