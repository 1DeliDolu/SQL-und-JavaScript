# Prüfungsrelevante Fachbegriffe

Verdammt, warum habe ich diese Tabelle angefangen?!?

Bitte machen Sie mich aufmerksam, falls Ihnen unklare Definitionen oder Widersprüche zu Ihrem Handbuch, etc. auffallen.

| Begriff | Bedeutung | Kontext | Ähnliche Begriffe | Anmerkungen |
| --- | --- | --- | --- | --- |
| **ACID** | Grundprinzip relationaler Datenbanken |  |  | atomicity, consistency, isolation, durability [Was ist ACID?](https://www.bigdata-insider.de/was-ist-acid-a-776182/) |
| **Attribut** | Eigenschaft eines Entitätstyps | Datenmodell | Spalte |  |
| **Attributwert** | Wert einer Eigenschaft, einer Spalte |  |  |  |
| **Constraint** | Beschränkung möglicher Werte |  |  |  |
| **CROSS JOIN** | Kombination aller Zeilen einer Tabelle mit denen einer anderen tabelle |  | Kartesisches Produkt, Kreuztabelle |  |
| **DCL** | Data Control Language |  |  | GRANT, REVOKE, DENY |
| **DDL** | Data Definition Language |  |  | CREATE, ALTER, DROP, TRUNCATE |
| **DML** | Data Modification Language |  |  | INSERT, UPDATE, DELETE, SELECT |
| **Datenbank** |  |  |  |  |
| **Datensatz** |  |  | Entität, Tabellenzeile |  |
| **Entität** |  |  |  | Datensatz, Tabellenzeile |
| **Entitätsmenge** | alle Datensätze insgesamt |  |  |  |
| **Entitätstyp** | Definition der Attribute |  | Relationenschema |  |
| **ER-Modell** | Entity Relationship Model |  |  | ursprünglich von Peter Chen |
| **Foreign Key** | Attribut, das einen Primary Key anderswo referenziert  |  | Fremdschlüssel |  |
| **Fremdschlüssel** | siehe Foreign Key |  | Foreign Key |  |
| **Function** | systemeigene oder benutzerdefinierte Funktion |  |  |  |
| **Index** | Kopie der Werte eines oder mehrerer Attribute zur Beschleunigung von Suchvorgängen |  |  |  |
| **JOIN** | Abfrage über mehrere Tabellen |  |  |  |
| **Kartesisches Produkt** | CROSS JOIN |  |  |  |
| **Kopfzeile** | Relationenschema |  |  |  |
| **Kreuztabelle** | CROSS JOIN |  |  |  |
| **Normalisierung** | Mehrstufiger Prozess der Entwicklung eines Datenbankschemas ohne Redundanzen  |  |  |  |
| **Primary Key** | Attribut(e), die Datensätze eindeutig identifizieren |  |  |  |
| **Primärschlüssel** | siehe Primary Key |  |  |  |
| **Procedure** | Prozedur zur kontrollierten Datenpflege |  |  |  |
| **RDBMS** | Relationales Datenbank Management System |  |  | [Artikel in BigData-Insider](https://www.bigdata-insider.de/was-ist-rdbms-a-654230/) |
| **Relation** | Tabelle |  | Tabelle, Entitätsmenge |  |
| **Relationales Datenmodell** | Konzept von E. F. Codd |  | Relationale Algebra | [Artikel von 1970](https://www.seas.upenn.edu/~zives/03f/cis550/codd.pdf) |
| **Relationenschema** | Definition der Attribute einer Relation |  | Entitätstyp, Kopfzeile |  |
| **SQL** | Structured Query Language |  |  | [ISO/IEC Standard](https://en.wikipedia.org/wiki/ISO/IEC_9075) |
| **SQL-Injection** | Hack, um ohne Berechtigung Zugriff auf Daten zu erlangen |  |  | Einschleusen von SQL Befehlen in EIngabeformulare |
| **Spalte** | Attribut |  |  |  |
| **Spaltendefinition** | Datentyp und Constraints eines Attributs |  |  |  |
| **Tabelle** | Relation |  | Entitätsmenge |  |
| **Tabellendefinition** | Relationenschema |  | Entitätstyp |  |
| **Tabellenzeile** | Datensatz |  | Entität |  |
| **Transaction** | Bündelung abhängiger DML Anweisung, so dass alles oder nichts ausgeführt wird |  |  | sicher ACID Prinzip |
| **Trigger** | Programm, das bei einem Ereignis in der Datenbank ausgeführt wird |  |  | durch Trigger wird die Datenbank aktiv |
| **Tupel** | Datensatz | Relationen-Modell | Entität |  |
| **Zeile** | Datensatz |  |  |  |
| **Zelle** | Wert |  | Attributwert |  |

## Beim Sprechen von Relationalen Datenbanken treten konkurrierende, oft gleichbedeutende, Begriffe aus verschiedenen Modellen auf

| Relationen-Modell | Relationale Datenbank | ER-Modell | UML |
| --- | --- | --- | --- |
| Relation |  Tabelle | Entitätsmenge | Klasse |
| Attribut | Spaltenüberschrift, Spalte | Attribut | Attribut |
| Tupel | Zeile, Datensatz | Entität | Objekt, Instanz |
| Relationenschema | Kopfzeile | Entitätstyp | Klasse |
| Attributwert | Zelle | Attributwert |  Attributwert |
| Fremdschlüssel |  Spalte mit Bezug zu anderer Tabelle | Beziehung, Relationship | Assoziation |
| | | Kardinalität | Multiplizität |
