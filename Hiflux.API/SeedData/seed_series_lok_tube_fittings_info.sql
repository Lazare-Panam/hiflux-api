-- Lok Tube Fittings series row. Run BEFORE the products file. Source: Mongo (pasted).
IF NOT EXISTS (SELECT 1 FROM Categories WHERE Name = N'Lok Tube Fittings')
    INSERT INTO Categories (Name, Description, BodyMaterial, KeyFeatures)
    VALUES (N'Lok Tube Fittings', N'Lok tube fittings for connecting fractional and metric instrumentation tubing. A two-ferrule design (front and back ferrule) gives a tube connection with no threading, flaring or welding. The range covers unions, elbows, tees, crosses, connectors, adapters, caps, plugs and reducers, with PT, NPT and AN threaded ends for connecting tube to pipe ports and equipment.', N'316 Stainless Steel', N'Two-ferrule design with separate front and back ferrules
Fractional tube sizes from 1/16" to 1" OD
Metric male connectors from 2 mm to 12 mm
PT and NPT male and female threaded ends
AN straight-thread adapters and unions
Reducing unions, reducers and port connectors for size changes
Bulkhead unions for panel pass-through
Thermocouple male connector available');

SELECT CategoryId, Name FROM Categories WHERE Name = N'Lok Tube Fittings';
