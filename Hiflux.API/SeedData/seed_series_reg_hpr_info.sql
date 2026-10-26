-- HPR (High Pressure Regulator) series row. Run BEFORE the products file. Source: Mongo.
IF NOT EXISTS (SELECT 1 FROM Categories WHERE Name = N'HPR (High Pressure Regulator)')
    INSERT INTO Categories (Name, Description, BodyMaterial, Design, KeyFeatures)
    VALUES (N'HPR (High Pressure Regulator)', N'The HPR (High Pressure Regulator) is a pressure control device designed to constantly adjust and maintain the pressure released to the outlet within the range of pressure entering the inlet. Unlike the GPR, which handles lower-pressure applications, the HPR is built for high-pressure duty, available across inlet pressure ratings from 800psi up to 15,000psi and converting to six different outlet pressure ranges. It features a main valve cartridge that is easily maintained, an unbalanced stem that provides positive shut-off, and a spring-loaded piston sensor for safety and reliability, with numerous porting options and support for captured venting. A NACE-compatible option is available for sour service applications, and the regulator is rated for ambient operating and fluid media temperatures from -55°C to 100°C.', N'316 Stainless Steel', N'High pressure regulator', N'Converts to six different outlet pressure ranges
Available with captured venting
Numerous porting options
Main valve cartridge easily maintained
Unbalanced stem provides positive shut-off
Safety and reliability of spring-loaded piston sensor
NACE compatible option
Ambient operating & fluid media temperature: -55°C to 100°C');

SELECT CategoryId, Name FROM Categories WHERE Name = N'HPR (High Pressure Regulator)';
