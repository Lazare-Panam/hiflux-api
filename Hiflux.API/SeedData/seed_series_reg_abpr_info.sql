-- ABPR (Air Operating Back Pressure Regulator) series row. Run BEFORE the products file. Source: Mongo.
IF NOT EXISTS (SELECT 1 FROM Categories WHERE Name = N'ABPR (Air Operating Back Pressure Regulator)')
    INSERT INTO Categories (Name, Description, BodyMaterial, Design, KeyFeatures)
    VALUES (N'ABPR (Air Operating Back Pressure Regulator)', N'The ABPR (Air Operating Back Pressure Regulator) works on the same principle as a standard BPR, steadily maintaining a set inlet pressure by relieving excess pressure through the outlet as it builds past the setpoint. Unlike a manually set BPR, the ABPR''s setting pressure is adjusted through an electronic regulator and can be controlled remotely, available in 10,000psi (0~5bar operating air pressure) and 20,000psi (0~3bar operating air pressure) versions. It offers six different relief pressure ranges, bubble-tight shut-off at all reseat pressures, and an optional high-flow Cv=0.6 model, with a rated ambient operating and fluid media temperature of -55°C to 100°C.', N'316 Stainless Steel', N'Air operated back pressure regulator', N'Setting pressure adjusted through electronic regulator and controlled remotely
Six different relief pressure ranges
Bubble-tight shut-off at all reseat pressures
High flow Cv=0.6 model optional
Ambient operating & fluid media temperature: -55°C to 100°C');

SELECT CategoryId, Name FROM Categories WHERE Name = N'ABPR (Air Operating Back Pressure Regulator)';
