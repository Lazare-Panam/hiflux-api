-- High Pressure Adapter - Male to Male series row. Run BEFORE the products file.
IF NOT EXISTS (SELECT 1 FROM Categories WHERE Name = N'High Pressure Adapter - Male to Male')
    INSERT INTO Categories (Name, Description, BodyMaterial, Design, KeyFeatures)
    VALUES (N'High Pressure Adapter - Male to Male', N'High pressure adapter connecting male to male ports (NPT -> 60,000psi), facilitating pressure and size compatibility without requiring extra coupling.', N'316 Stainless Steel (HC-276, Inconel, Titanium, Nickel on request)', N'Male to Male', N'Male-to-male adapter facilitates pressure and size compatibility without coupling
316 stainless steel for excellent corrosion resistance
Various formations available, from overall pressure to NPT
Available across the 5,500-150,000 psi range, body types, and port sizes');

SELECT CategoryId, Name FROM Categories WHERE Name = N'High Pressure Adapter - Male to Male';
