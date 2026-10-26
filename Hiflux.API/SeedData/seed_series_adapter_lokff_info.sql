-- High Pressure Adapter - LOK(Female) to Female series row. Run BEFORE the products file.
IF NOT EXISTS (SELECT 1 FROM Categories WHERE Name = N'High Pressure Adapter - LOK(Female) to Female')
    INSERT INTO Categories (Name, Description, BodyMaterial, Design, KeyFeatures)
    VALUES (N'High Pressure Adapter - LOK(Female) to Female', N'High pressure adapter connecting LOK(Female) to Female ports, rated to a max pressure of 20,000psi, facilitating pressure and size compatibility without requiring extra coupling.', N'316 Stainless Steel', N'LOK(Female) to Female', N'LOK(Female) to Female adapter facilitates pressure and size compatibility without coupling
316 stainless steel for excellent corrosion resistance
Various formations available, from overall pressure to NPT
Glands, collars, or sleeves provided for the high pressure female port');

SELECT CategoryId, Name FROM Categories WHERE Name = N'High Pressure Adapter - LOK(Female) to Female';
