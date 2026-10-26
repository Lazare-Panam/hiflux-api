-- Pressure Gauge series row. Run BEFORE the products file. Source: Mongo.
IF NOT EXISTS (SELECT 1 FROM Categories WHERE Name = N'Pressure Gauge')
    INSERT INTO Categories (Name, Description, BodyMaterial, KeyFeatures)
    VALUES (N'Pressure Gauge', N'HIFLUX stainless steel pressure gauges for pumps, hydraulic presses and high pressure equipment, in three types: bottom connection direct (A type), bottom connection flush for panel mounting (J type) and a lightweight gas type (C type). High corrosion resistance, and glycerin filling is available to damp vibration.', N'316 Stainless Steel', N'Three types: direct, flush (panel) and gas
Stainless steel case, high corrosion resistance
Glycerin filling available for vibration damping
Suited to high mechanical vibration
Easy to install and assemble');

SELECT CategoryId, Name FROM Categories WHERE Name = N'Pressure Gauge';
