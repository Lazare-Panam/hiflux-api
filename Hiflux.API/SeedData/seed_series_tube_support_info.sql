-- High Pressure Tube Support - 3 Line series row. Run BEFORE the products file.
IF NOT EXISTS (SELECT 1 FROM Categories WHERE Name = N'High Pressure Tube Support - 3 Line')
    INSERT INTO Categories (Name, Description, BodyMaterial, Design, KeyFeatures)
    VALUES (N'High Pressure Tube Support - 3 Line', N'3-line tube support clamp for securing multiple high pressure tube runs. Keeps parallel tube lines aligned and vibration-free in panel and rack installations.', N'316 Stainless Steel / Polymer insert', N'Multi-line tube support clamp, panel or rack mount', N'Secures 3 parallel tube runs
Reduces vibration and fatigue
Corrosion-resistant construction
Simple panel or rack mounting');

SELECT CategoryId, Name FROM Categories WHERE Name = N'High Pressure Tube Support - 3 Line';
