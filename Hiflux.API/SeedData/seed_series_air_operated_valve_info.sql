-- Air Operated Valve - Normal Close series row. Run from file (SSMS: File > Open > Execute). Run BEFORE the products file.
-- Content taken verbatim from the Mongo product detail doc (aov-nc-60k).
IF NOT EXISTS (SELECT 1 FROM Categories WHERE Name = N'Air Operated Valve - Normal Close')
    INSERT INTO Categories
        (Name, Description, BodyMaterial, Design, TemperatureRange, KeyFeatures)
    VALUES (
        N'Air Operated Valve - Normal Close',
        N'Normally closed air operated valve rated to 60,000 psi. Pneumatic actuation provides fast, remote-controlled shut-off for automated high pressure systems.',
        N'316 Stainless Steel',
        N'Pneumatic, spring-return',
        N'-20' + NCHAR(176) + N'C to 150' + NCHAR(176) + N'C',
        N'High pressure rated to 60,000 psi
Fail-safe normally closed operation
Fast remote actuation
Compact pneumatic actuator'
    );

SELECT CategoryId, Name, BodyMaterial, Design FROM Categories WHERE Name = N'Air Operated Valve - Normal Close';
