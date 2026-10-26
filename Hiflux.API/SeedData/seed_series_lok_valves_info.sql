-- Lok Valves series row. Run BEFORE the products file. Source: Mongo.
IF NOT EXISTS (SELECT 1 FROM Categories WHERE Name = N'Lok Valves')
    INSERT INTO Categories (Name, Description, BodyMaterial, KeyFeatures)
    VALUES (N'Lok Valves', N'Lok type needle, ball and check valves with integral Lok tube ends for instrumentation systems. The range covers fine-control needle valves (including graphite-packed models for high-temperature service), compact ball valves for on/off isolation, and check valves with adjustable or fixed cracking pressure. Sizes run from 1/8" to 1" and working pressures reach 6,000 psi.', N'316 Stainless Steel', N'Needle, ball and check valves with integral Lok tube ends
Working pressures up to 6,000 psi (413 bar)
Graphite-packed needle valves rated up to 648°C (1,200°F)
Externally adjustable stem packing on NVS1 needle valves
Metal-to-metal Vee stem for high-temperature service (NVS1-12)
Live-loaded packing and trunnion design (BV1 ball valve)
Bottom-loaded stem prevents stem blowout (HBV10-NF)
Bidirectional flow (HBV1 ball valve)
Adjustable and fixed cracking pressure check valves
Panel-mountable designs');

SELECT CategoryId, Name FROM Categories WHERE Name = N'Lok Valves';
