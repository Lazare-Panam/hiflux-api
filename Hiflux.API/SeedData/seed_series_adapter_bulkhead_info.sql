-- High Pressure Adapter - Bulkhead Union series row. Run BEFORE the products file.
IF NOT EXISTS (SELECT 1 FROM Categories WHERE Name = N'High Pressure Adapter - Bulkhead Union')
    INSERT INTO Categories (Name, Description, BodyMaterial, Design, KeyFeatures)
    VALUES (N'High Pressure Adapter - Bulkhead Union', N'High pressure bulkhead union adapter (60,000psi -> 60,000psi) for panel-mount installation where tubing passes through a panel, facilitating pressure and size compatibility without requiring extra coupling.', N'316 Stainless Steel', N'Bulkhead union, panel-mount, includes lock nut', N'Designed for panel-mount installation where tubing passes through a panel
Includes lock nut
316 stainless steel for excellent corrosion resistance
Normal gland and collar/sleeve included; anti-vibration options available on request');

SELECT CategoryId, Name FROM Categories WHERE Name = N'High Pressure Adapter - Bulkhead Union';
