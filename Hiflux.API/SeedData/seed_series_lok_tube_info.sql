-- LOK Tube series row. Run BEFORE the products file. Source: Mongo.
IF NOT EXISTS (SELECT 1 FROM Categories WHERE Name = N'LOK Tube')
    INSERT INTO Categories (Name, Description, BodyMaterial, KeyFeatures)
    VALUES (N'LOK Tube', N'Seamless 316 stainless steel instrumentation tube, bright annealed (BA), made to ASTM (ASME) A269. Its clean, high-quality inner surface suits fluid lines that need a clean environment. Working pressures range from 2,400 psi to 5,100 psi depending on size, in 1/4" to 1" OD. Use with Hiflux Lok tube fittings for best results.', N'316 SS, ASTM A269, BA', N'316 stainless steel, bright annealed finish
Manufactured to ASTM (ASME) A269
Clean, high-quality inner surface for pure fluid lines
Working pressures up to 5,100 psi (1/4" OD)
Softer than the fitting material for reliable ferrule grip
Matched to Hiflux Lok tube fittings');

SELECT CategoryId, Name FROM Categories WHERE Name = N'LOK Tube';
