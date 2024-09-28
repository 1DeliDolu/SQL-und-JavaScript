# Die Klauseln der SQL-Abfrage

## Übersicht über die verfügbaren Klauseln

**Quelle:** Microsoft Learn Artikel: [SELECT (Transact-SQL)](https://learn.microsoft.com/en-us/sql/t-sql/queries/select-transact-sql?view=sql-server-ver16); dort sind zu jeder Klausel einzelne Hilfeseiten verlinkt.

| Klausel | Funktion |
| ----- | ----- |
| WITH &lt;cte&gt; | Voranstellen einer Unterabfrage |
| **SELECT** ... [INTO *neue_tabelle*] | Auswahl der Spalten [optional Ausgabe in neue Tabelle] |
| **FROM** *tabellen_quelle* | Tabellen oder Views, die abgefragt werden. Kann mit JOIN mehrere Tabellen verbinden. |
| **WHERE** *such_bedingung* | Ein oder mehrere durch AND bzw. OR verknüpfte Filterausdrücke |
| **GROUP BY** *gruppierungs_ausdruck* | Gruppierung, erforderlich wenn weitere Spalten mit aggregierten Spalten angezeigt werden |
| **HAVING** *such_bedingung* | Filter auf dem Ergebnis von Aggregat-Funktionen |
| WINDOW *window_ausdruck* | Partitioniert die Ergebnisse für Nummerierung, Sortierung und Aggregate (ab SQL Server 2022) |
| **ORDER BY** *sortier_ausdruck* [ASC\|DESC] | Sortierfolge |

## Die logische Ausführungsreihenfolge der SELECT-Abfrage

Obwohl **SELECT** meist die erste Klausel im SQL-Code der Abfrage ist, steht sie inder logischen Ausführung fast am Ende.

In der **SELECT-Klausel** werden *Spalten-Aliase* definiert, um die Spaltenüberschriften der Ausgabe festzulegen. Diese Aliase sind in der Abfrage erst nach Ausführung der SELECT-Klausel bekannt. Weder die WHERE-Klausel noch die HAVING-Klausel können sich auf ein Spalten-Alias beziehen, aber in der ORDER-BY Klausel ist das möglich.

Wenn nach dem Ergebnis einer Aggregatfunktion gefiltert werden muss, dann wird die Funktion in der **HAVING-Klausel** wiederholt!

### Kurz: die logische Reihenfolge der wichtigsten Klauseln

1. **FROM**
2. WHERE
3. GROUP BY
4. HAVING
5. **SELECT**
6. ORDER BY

### Die logische Reihenfolge aller Klauseln

- **FROM**
- ON
- JOIN
- WHERE
- GROUP BY
- WITH CUBE or WITH ROLLUP
- HAVING
- **SELECT**
- DISTINCT
- ORDER BY
- TOP

[Hier geht's weiter zur Demo...](Demo%20Klauseln%20der%20SQL-Abfrage.ipynb)
