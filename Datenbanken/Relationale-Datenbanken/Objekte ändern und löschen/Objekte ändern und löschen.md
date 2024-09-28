# Objekte ändern und löschen

| Aktion | Befehl | Anmerkung |
| --- | --- | --- |
| Datenbank löschen | **DROP DATABASE <DB_Name>** | Zum Löschen müssen alle Verbindungen mit der Datenbank getrennt werden. |
| Tabelle löschen | **DROP TABLE <Tabellen_Name>** | Es dürfen hierzu keine **FK** diese Tabelle referenzieren. |
| Tabelle umbenennen | **EXEC sp_rename '<Schema.Alter_Name', '<Schema.Neuer_Name>';** | per System-Funktion |
| Spalte hinzufügen | **ALTER TABLE <Tabellen_Name> ADD Spaltendefintionen** |  |
| Spalte umbenennen | **EXEC sp_rename '<Schema.Tabelle.Spalte', 'Neuer_Spalten_Name', 'COLUMN';** | per System-Funktion |
| Datentyp einer Spalte ändern | **ALTER TABLE <Tabellen_Name> ALTER COLUMN Spalte Neuer_Datentyp** |  |
| Spalte löschen | **ALTER TABLE <Tabellen_Name> DROP COLUMN Spalte** |  |
| CHECK CONSTRAINT hinzufügen | **ALTER TABLE <Tabellen_Name> ADD CONSTRAINT Name CHECK(Spalte Bedingung)** |  |
| CHECK CONSTRAINT aussetzen | **ALTER TABLE <Tabellen_Name> NOCHECK CONSTRAINT Name;** |  |
| CHECK CONSTRAINT fortsetzen | **ALTER TABLE <Tabellen_Name> CHECK CONSTRAINT Name;** |  |
| CHECK CONSTRAINT löschen | **ALTER TABLE <Tabellen_Name> DROP CONSTRAINT Name;** |  |

[Auf geht's zur Demo](Demo%20ALTER%2C%20DROP.ipynb)
