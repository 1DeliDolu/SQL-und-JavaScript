# Datentypen

Bei der Erstellung von Tabellen achten Sie darauf, für jedes Attribut einen geeigneten Datentyp anzugeben. Der Datentyp muss von der Art und Größe zu den Daten passen, die das Attribut aufnehmen soll; gleichzeitig soll nicht unnötig Speicherplatz verschwendet werden.

## Datentypen in [ISO/IEC 9075 Standard](https://en.wikipedia.org/wiki/ISO/IEC_9075) SQL

**Quelle**: [SQL Data Types](https://www.dummies.com/article/technology/programming-web-design/sql/sql-data-types-2-194141/)

| Gruppe | Typen |
| --- | --- |
| Exact Numerics: | INTEGER, SMALLINT, BIGINT, NUMERIC, DECIMAL |
| Approximate Numerics: | REAL, DOUBLE PRECISION, FLOAT, DECFLOAT |
| Binary Strings: | BINARY, BINARY VARYING, BINARY LARGE OBJECT |
| Boolean: | BOOLEAN |
| Character Strings: | CHARACTER, CHARACTER VARYING (VARCHAR), CHARACTER LARGE OBJECT, NATIONAL CHARACTER, NATIONAL CHARACTER VARYING, NATIONAL CHARACTER LARGE OBJECT |
| Datetimes: | DATE, TIME WITHOUT TIMEZONE, TIMESTAMP WITHOUT TIMEZONE, TIME WITH TIMEZONE, TIMESTAMP WITH TIMEZONE |
| Intervals: | INTERVAL DAY, INTERVAL YEAR |
| Collection Types: | ARRAY, MULTISET |
| Other Types: | ROW, XML |

Namen, Wertebereiche und Speicherbedarf der Datentypen variieren bei verschiedenen Herstellern. Die jeweils verfügbaren Datentypen können Sie in diesen Referenzen nachlesen:

### Referenzen der Hersteller

- [Microsoft SQL Server, T-SQL](https://learn.microsoft.com/en-us/sql/t-sql/data-types/data-types-transact-sql?view=sql-server-ver16)
- [Oracle](https://docs.oracle.com/en/database/oracle/oracle-database/21/sqlrf/Data-Types.html)
- [MySQL](https://dev.mysql.com/doc/refman/8.0/en/data-types.html)
- [PostgreSQL](https://www.postgresql.org/docs/current/datatype.html)

## Datentypen in Microsoft SQL Server / T-SQL

Nachfolgend wird eine Auswahl von Datentypen in Microsoft SQL Server besprochen.

### Zeichenketten

| Bezeichnung | Wertebereich | Speicherbedarf | Anmerkung |
| --- | --- | --- | --- |
| **char(n)** | n <= 8000 | n Bytes | *Feste* Größe unabhängig von der Anzahl Zeichen. Wird mit Leerstellen aufgefüllt. |
| **varchar(n)** | n <= 8000 | x Bytes + 2 Bytes | *Variable* Größe: 2 Bytes für die Länge der gespeicherten Zeichenkette |
| **nchar(n)** | n <= 4000 | n * 2 Bytes | *Feste* Größe, **Unicode** Doppelbyte Zeichen |
| **nvarchar(n)** | n <= 4000 | n * 2 Bytes + 2 Bytes | *Variable* Größe, **Unicode** Doppelbyte Zeichen |

Wenn die Länge der Eingaben um mehr als 2 Zeichen variiert, verwenden Sie die Typen variabler Breite.
Es gibt auch die nicht empfohlenen Typen varchar(max) und nvarchar(max) mit Speicherbedarf bei knapp 2 GigaByte.

### Ganzzahlen

| Bezeichnung | Wertebereich | Speicherbedarf | Anmerkung |
| --- | --- | --- | --- |
| **bit** | 0, 1, NULL | 1 Bit | genutzt für **boolesche** Werte |
| **tinyint** | 0 – 255 | 1 Byte |  |
| **smallint** | -2^15^ – 2^15^ -1 | 2 Bytes | entspricht +/-32.768 |
| **int** | -2^31^ – 2^31^ -1 | 4 Bytes | entspricht ~+/- 2 Milliarden |
| **bigint** | -2^63^ – 2^63^ -1 | 8 Bytes | unausprechliche Menge |

### Exakte Dezimalzahlen

| Bezeichnung | Wertebereich | Speicherbedarf | Anmerkung |
| --- | --- | --- | --- |
| **numeric(p,s)** | -10^38^+1 – 10^38^-1 | siehe unten | **precision**: Anzahl Stellen gesamt, **scale**: Anzahl Stellen nach dem Dezimalpunkt |
| **decimal(p,s)** |  |  | wie numeric |
| **smallmoney** | -214,748.3648 – 214,748.3647 | 4 bytes | Währung, Genauigkeit 4 Stellen nach Dezimalpunkt |
| **money** | +/- 922 Milliarden | 8 Bytes | Währung, Genauigkeit 4 Stellen nach Dezimalpunkt |

#### Speicherbedarf von Dezimalzahlen

| Precision | Speicher Bytes |
| --- | --- |
| 1 – 9 | 5 |
| 10 – 19 | 9 |
| 20 – 28 | 13 |
| 29 – 38 | 17 |

### Nicht exakte Fließkommazahlen

Die Datentypen **float** und **real** speichern nur ungefähre Werte und werden im Business-Kontext nicht verwendet.

### Datum und Uhrzeit

Datentypen dieser Art variieren im abbildbaren Datumsbereich und in der Genauigkeit der Zeitangabe

| Bezeichnung | Wertebereich | Genauigkeit | Speicherbedarf | Anmerkung |
| --- | --- | --- | --- | --- |
| **date** | 01.01.0001 – 31.12.9999 |  | 3 Bytes |  |
| **time** | 00:00:00.0000000 – 23:59:59.9999999 | bis 100 Nanosekunden  | 3 – 5 Bytes | 5 Bytes Default mit 100 Nanosekunden Genauigkeit |
| **smalldatetime** | 01.01.1900 – 06.06.2079 | 1 Minute | 4 Bytes |  |
| **datetime** | 01.01.1753 – 31.12.9999 | 33 Millisekunden | 8 Bytes |  |
| **datetime2** | wie date | 100 Nanosekunden | 6 – 8 Bytes |  |
| **datetimeoffset** | wie datetime2, dazu Zeitzone -14:00 – +14:00 | | 8 – 10 Bytes | 26 – 34 Zeichen |

### Binärdaten

| Bezeichnung | Wertebereich | Speicherbedarf | Anmerkung |
| --- | --- | --- | --- |
| **binary(n)** | n <= 8000 | n Bytes | *Feste* Größe |
| **varbinary(n)** | n <= 8000 | n Bytes + 2 Bytes für die Länge | *Variable* Größe |

### Beispiele weiterer Datentypen

| Bezeichnung | Eigenschaften | Speicherbedarf | Anmerkung |
| --- | --- | --- | --- |
| **timestamp** | automatisch gesetzte Binärzahl bei INSERT und UPDATE | 8 Bytes | |
| **uniqueidentifier** | global eindeutiger Bezeichner für ein Tupel | 16 Bytes | Als PK in verteilten Datenbanken sinnvoll, wo ein sequenzieller PK nicht möglich ist |
