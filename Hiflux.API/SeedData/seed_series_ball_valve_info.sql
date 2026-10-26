-- High Pressure Ball Valve - Medium Pressure series row. Run from file (SSMS: File > Open > Execute). Run BEFORE the products file.
-- Content taken verbatim from the Mongo product detail doc (ball-med-20k).
IF NOT EXISTS (SELECT 1 FROM Categories WHERE Name = N'High Pressure Ball Valve - Medium Pressure')
    INSERT INTO Categories
        (Name, Description, BodyMaterial, SeatMaterial, Design, TemperatureRange, KeyFeatures)
    VALUES (
        N'High Pressure Ball Valve - Medium Pressure',
        N'Medium pressure ball valve for demanding shut-off requirements. Full-bore trunnion design delivers reliable quarter-turn operation with minimal torque, even at elevated pressures.',
        N'316 Stainless Steel',
        N'PTFE / PEEK',
        N'Trunnion-mounted',
        N'-20' + NCHAR(176) + N'C to 180' + NCHAR(176) + N'C',
        N'Medium pressure rated to 20,000 psi
Low operating torque
Full bore flow path
Blowout-proof stem'
    );

SELECT CategoryId, Name, BodyMaterial, SeatMaterial, Design FROM Categories WHERE Name = N'High Pressure Ball Valve - Medium Pressure';
