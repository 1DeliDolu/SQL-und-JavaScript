# Daten ändern oder löschen

| Aktion | Befehl | Anmerkung |
| --- | --- | --- |
| Daten ändern | **UPDATE** | WHERE-Klausel nicht vergessen! Sonst werden alle Zeilen geändert. |
| Daten löschen | **DELETE** | WHERE-Klausel nicht vergessen! Sonst werden alle Zeilen geändert. |
| Tabelle *abschneiden* | **TRUNCATE TABLE** | Löscht alle Zeilen und setzt IDENTITY Zähler zurück. Funktioniert nur, wenn die Tabelle nicht durch einen **FOREIGN KEY** referenziert wird. |

[Auf geht's zur Demo!](Demo%20UPDATE%2C%20DELETE%2C%20TRUNCATE.ipynb)
