-- BPR (Back Pressure Regulator) series row. Run BEFORE the products file. Source: Mongo.
IF NOT EXISTS (SELECT 1 FROM Categories WHERE Name = N'BPR (Back Pressure Regulator)')
    INSERT INTO Categories (Name, Description, BodyMaterial, Design, KeyFeatures)
    VALUES (N'BPR (Back Pressure Regulator)', N'The BPR (Back Pressure Regulator) works on the opposite principle to a standard pressure regulator: rather than controlling the outlet pressure, it steadily maintains a set inlet pressure regardless of downstream flow. As pressure builds past the setpoint, the BPR relieves the excess through the outlet, holding the vessel or system at a constant target pressure. The Hiflux BPR is rated up to 15,000psi inlet pressure and prevents leaks by applying a seal type suited to the characteristics of the gas or liquid being handled. It offers six different relief pressure ranges, bubble-tight shut-off at all reseat pressures, and an accuracy of 1% of the relief pressure range, with an optional high-flow Cv=0.6 model and NACE compatibility for sour service.', N'316 Stainless Steel', N'Back pressure regulator', N'Accuracy: 1% of relief pressure range
NACE compatibility optional
Six different relief pressure ranges
Bubble-tight shut-off at all reseat pressures
High flow Cv=0.6 model optional
Ambient operating & fluid media temperature: -55°C to 100°C');

SELECT CategoryId, Name FROM Categories WHERE Name = N'BPR (Back Pressure Regulator)';
