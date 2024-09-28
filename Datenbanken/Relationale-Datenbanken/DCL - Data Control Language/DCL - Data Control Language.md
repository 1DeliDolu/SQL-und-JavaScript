# DCL-Demo: Data Control Language

## Ziel der Demo

Die Demo zeigt, wie der Zugriff auf Daten über Schemata gesteuert werden kann.

Rechte auf ein Schema bedeuten Rechte auf alle Objekte im Schema, die nicht einzeln zugewiesen werden müssen, wobei aber Rechte auf einzelne Objekte im Schema auch verweigert werden können.

Der Datenbankbenutzer benötigt keine direkten Rechte auf die Tabellen, sondern kann Aufgaben mittels Views, Prozeduren oder Funktionen erledigen.

## Ablauf der Demo

Für die Demo wird eine neue Datenbank **DCL_Demo** angelegt.

Datenbankobjekte werden auf zwei Schemata *Schema_A* und *Schema_B* verteilt. In Schema_A werden Tabellen angelegt; in Schema_B Views, eine Prozedur und eine Funktion. Die Tabellen werden mit Daten befüllt.

Ein Testuser J_Doe wird angelegt.

Als Ersteller der Datenbank haben Sie die Berechtigung, mit *EXECUTE AS USER='Username'* Befehle unter der Identität des Testusers auszuführen.

Anfangs bekommt der Testuser nur Leseberechtigung auf dem Schema_B.

Nachfolgend werden die Auswirkungen der Berechtigungen **SELECT** und **EXECUTE** und die Befehle **GRANT**, **DENY** und **REVOKE** demonstriert.

## Übung

Als Übung wird eine Prozedur erstellt, mittels derer die Namen von Personen ohne direkte Berechtigung auf die Tabellen geändert werden können.
