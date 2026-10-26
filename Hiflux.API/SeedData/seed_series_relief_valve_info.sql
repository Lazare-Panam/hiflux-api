-- High Pressure Relief Valve - Factory Set series row. Run from file (SSMS: File > Open > Execute). Run BEFORE the products file.
-- Content taken verbatim from the Mongo product detail doc (saf-rel-factory-60k).
IF NOT EXISTS (SELECT 1 FROM Categories WHERE Name = N'High Pressure Relief Valve - Factory Set')
    INSERT INTO Categories
        (Name, Description, BodyMaterial, Design, TemperatureRange, KeyFeatures)
    VALUES (
        N'High Pressure Relief Valve - Factory Set',
        N'Factory-set relief valve for liquid service, 3,000-60,000 psi. Pre-calibrated to a specified set pressure at the factory for reliable overpressure protection without field adjustment.',
        N'316 Stainless Steel',
        N'Factory-calibrated set point, liquid service',
        N'-20' + NCHAR(176) + N'C to 150' + NCHAR(176) + N'C',
        N'Wide pressure range: 3,000-60,000 psi
Factory-calibrated set point
Tamper-resistant seal
Fast-acting relief response'
    );

SELECT CategoryId, Name, BodyMaterial, Design FROM Categories WHERE Name = N'High Pressure Relief Valve - Factory Set';
