-- High Pressure Union - Female to Female series row. Run BEFORE the products file.
IF NOT EXISTS (SELECT 1 FROM Categories WHERE Name = N'High Pressure Union - Female to Female')
    INSERT INTO Categories (Name, Description, BodyMaterial, Design, KeyFeatures)
    VALUES (N'High Pressure Union - Female to Female', N'High pressure union adapter connecting female to female ports (60,000psi -> 60,000psi), facilitating pressure and size compatibility without requiring extra coupling.', N'316 Stainless Steel', N'Female to Female (Union)', N'Female-to-female (union) adapter facilitates pressure and size compatibility without coupling
316 stainless steel for excellent corrosion resistance
Various formations available, from overall pressure to NPT
Glands, collars, or sleeves provided for the high pressure female port');

SELECT CategoryId, Name FROM Categories WHERE Name = N'High Pressure Union - Female to Female';
