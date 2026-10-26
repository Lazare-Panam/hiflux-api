-- High Pressure Fitting - Ultra High Pressure series row. Run from file (SSMS: File > Open > Execute). Run BEFORE the products file.
IF NOT EXISTS (SELECT 1 FROM Categories WHERE Name = N'High Pressure Fitting - Ultra High Pressure')
    INSERT INTO Categories (Name, Description, BodyMaterial, Design, TemperatureRange, KeyFeatures)
    VALUES (N'High Pressure Fitting - Ultra High Pressure', N'Ultra high pressure fitting rated to 150,000 psi for extreme applications. Cone-and-thread design provides a metal-to-metal seal capable of withstanding the most demanding high pressure line connections.', N'316 Stainless Steel', N'Cone and thread, metal-to-metal', N'-20' + NCHAR(176) + N'C to 150' + NCHAR(176) + N'C', N'Ultra high pressure rated to 150,000 psi
Metal-to-metal cone seal
No elastomer seals to fail
Reusable, field-serviceable connection');

SELECT CategoryId, Name FROM Categories WHERE Name = N'High Pressure Fitting - Ultra High Pressure';
