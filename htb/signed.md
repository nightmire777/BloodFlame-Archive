> s9 medium windows mssql


Scanning
-



Enumeration
-
<img width="1105" height="665" alt="image" src="https://github.com/user-attachments/assets/2865af81-860a-4745-9bee-cc4eb26375c5" />
only one port btw 

<img width="1582" height="702" alt="image" src="https://github.com/user-attachments/assets/8d8e441f-566b-4b6f-b139-ca34c1607bce" />
Finding out who login and who exist in the db 
```
// find out who login
SELECT name, type_desc, is_disabled FROM sys.server_principals WHERE type_desc IN ('SQL_LOGIN','WINDOWS_LOGIN','WINDOWS_GROUP');

// find out who exist 
SELECT name, type_desc FROM sys.database_principals WHERE principal_id > 0;

```
