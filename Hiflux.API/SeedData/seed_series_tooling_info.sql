-- High Pressure Tooling Set - Coning Tool series row. Run BEFORE the products file.
IF NOT EXISTS (SELECT 1 FROM Categories WHERE Name = N'High Pressure Tooling Set - Coning Tool')
    INSERT INTO Categories (Name, Description)
    VALUES (N'High Pressure Tooling Set - Coning Tool', N'Coning and threading tooling for forming high pressure tube ends for leak-free cone-and-thread connections.');

SELECT CategoryId, Name FROM Categories WHERE Name = N'High Pressure Tooling Set - Coning Tool';
