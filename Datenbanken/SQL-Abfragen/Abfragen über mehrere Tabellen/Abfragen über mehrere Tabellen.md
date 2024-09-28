# Abfragen über mehrere Tabellen

Bei der **Normalisierung** des Datenbankmodells werden die Daten zur Vermeidung von Redundanz und von Anomalien auf mehrere Tabellen verteilt, die durch **Primary Keys (PK)** und **Foreign Keys (FK)** zueinander in Beziehung stehen.

Für sinnvolle Abfragen müssen fast immer Daten aus mehreren Tabellen zusammengeführt werden.

Das geschieht mit der **JOIN**-Anweisung. In der **ON**-Klausel wird dann definiert, wie die Zugehörigkeit der Zeilen der einen Tabelle zu den Zeilen der anderen Tabelle geprüft wird.

Es gibt verschiedene Arten von JOINS im SQL-Standard, deren Umsetzung in verschiedenen Datenbanksystemen variiert.

## INNER JOIN

Der INNER JOIN zeigt nur Datensätze an, für die in beiden verknüpften Tabellen zueinander gehörige Zeilen gefunden wurden. Das Wort *INNER* darf entfallen, da dieses Verhalten das Default-Verhalten von JOIN ist.

## LEFT OUTER JOIN

Der LEFT OUTER JOIN zeigt alle Zeilen aus der linken Tabelle, das heißt der zuerst genannten Tabelle. Aus der rechten Tabelle werden passende Zeilen gezeigt. Ansonsten werden die Attribute der rechten Tabelle als **NULL** dargestellt. Das Schlüsselwort *OUTER* darf weggelassen werden.

## RIGHT OUTER JOIN

Umgekehrt zeigt der RIGHT OUTER JOIN zeigt alle Zeilen aus der rechten Tabelle, das heißt der nach dem Schlüsselwort JOIN genannten Tabelle. Aus der linken Tabelle werden passende Zeilen gezeigt. Ansonsten werden die Attribute der linken Tabelle als **NULL** dargestellt. Das Schlüsselwort *OUTER* darf weggelassen werden.

## FULL OUTER JOIN

Der FULL OUTER JOIN zeigt alle Zeilen aus beiden beteiligten Tabellen. Dies ist eine ungewöhnliche Situation, wenn man davon ausgeht, dass beide Tabellen über **PK** und **FK** verbunden sind und das FK-Attribut der verknüpften Tabelle nicht leer bleiben darf und nur Werte aufnehmen darf, die im **PK** der anderen Tabelle vorhanden sind.

## CROSS JOIN, auch: *Kartesisches Produkt* oder *Kreuztabelle*

Der CROSS JOIN bildet alle möglichen Kombinationen aus den Zeilen beider beteiligten Tabellen. Dabei entstehen sehr schnell enorme Datenmengen.

## SELF JOIN

Eine Tabelle kann mit sich selbst gejoint werden, zum Beispiel wenn in einer Mitarbeiter-Tabelle ein **FK** auf den Vorgesetzten in der gleichen Tabelle zeigt. In **T-SQL** gibt es dafür kein besonderes Schlüsselwort (*SELF* kommt in der Abfrage nicht vor.)

## Alte und neue JOIN-Syntax

Die Syntax mit der **JOIN-Klausel** wurde in **SQL-92** eingeführt. Teilweise wird noch die alte Syntax verwendet. Außerdem gibt es [herstellerspezifische Varianten](https://de.wikipedia.org/wiki/Join_(SQL)#Produktspezifisches) der JOIN-Syntax.

**Siehe auch:** [JOIN (SQL) in Wikipedia](https://de.wikipedia.org/wiki/Join_(SQL))

![JOIN Syntaxübersicht](../_Images/Join_(SQL)_Syntaxdiagramm.svg)
