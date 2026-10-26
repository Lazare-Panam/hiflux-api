-- High Pressure Special Valves series row. Run from file (SSMS: File > Open > Execute). Run BEFORE the products file.
-- A mixed collection of special-purpose valves (manufacturer groups them together).
IF NOT EXISTS (SELECT 1 FROM Categories WHERE Name = N'High Pressure Special Valves')
    INSERT INTO Categories
        (Name, Description, BodyMaterial, TemperatureRange)
    VALUES (
        N'High Pressure Special Valves',
        N'Hiflux special-purpose high pressure valves - bleed, double block and bleed, relief, control, wellhead gauge and high-temperature valves for specialised service.',
        N'316 Stainless Steel',
        N'-20' + NCHAR(176) + N'C to 150' + NCHAR(176) + N'C'
    );

SELECT CategoryId, Name FROM Categories WHERE Name = N'High Pressure Special Valves';
