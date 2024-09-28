# Weitere Objekte in der Datenbank

Folgende Objekte in der Datenbank sollten Sie kennen – da prüfungsrelevant:

| Objekt | Erstellung | Nutzen |
| --- | --- | --- |
| **Tabelle** | CREATE TABLE | Notwendig, um Daten in der Datenbank zu speichern |
| **Primary Key** | CONSTRAINT Name PRIMARY KEY(Attribut) | Notwendig, um Datensätze eindeutig zu identifizieren |
| **Foreign Key** | CONSTRAINT Name FOREIGN KEY(Attribut) REFERENCES Tabelle(Attribut) | Notwendig, um Beziehungen zwischen Datensätzen darzustellen |
| **Check Constraint** | CONSTRAINT Name CHECK(Bedingung) | Begrenzt Auswahl möglicher Werte eines Attributs |
| **Unique Constraint** | CONSTRAINT Name UNIQUE(Attribut) | Erzwingt, dass die Werte eines Attributs eindeutig sein müssen |
| **Default Constraint** | CONSTRAINT Name DEFAULT Wert | Definiert den Standard-Wert eines Attributs, so dass es bei INSERTs nicht angegeben werden muss |
| **Index** | CREATE INDEX | Verbessert die Performance von Abfragen |
| **View** | CREATE VIEW | Ermöglicht die Wiederverwendung komplexer Abfragen und den Zugriff auf Daten ohne direkt Berechtigung auf Tabellen |
| **Prozedur** | CREATE PROCEDURE | Ermöglicht Einfügen und Aktualisieren von Daten ohne direkten Zugriff auf Tabellen |
| **Funktion** | CREATE FUNCTION | Erlaubt komplexe Berechnungen per Funktionsaufruf |
| **Trigger** | CREATE TRIGGER | Ermöglicht Kontrolle, ob Änderungen an Daten erwünscht oder erlaubt sind |
| **Login** | CREATE LOGIN | Ein Login ist zur Verbindung mit dem Microsoft SQL Server erforderlich. |
| **User** | CREATE USER | Der User wird dem Login zugeordnet und erhält Rechte auf Datenbank-Objekten. |

**Hinweis**: Die Angaben zum Nutzen sind in einigen Fällen vereinfacht und decken nicht alle Möglichkeiten ab.

## Demos zu ausgewählten Datenbank-Objekten

- [View](View-Demo.ipynb)
- [Procedure](Procedure-Demo.ipynb)
- [Function](Function-Demo.ipynb)
- [Trigger](Trigger-Demo.ipynb)
