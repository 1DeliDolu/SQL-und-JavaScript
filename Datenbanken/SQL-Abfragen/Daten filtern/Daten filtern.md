# Daten filtern

- Normalerweise werden Datensätze durch eine **WHERE-Klausel** ausgewählt.

## Ausnahmen

- Die Ergebnisse von Aggregatfunktionen werden durch eine **HAVING-Klausel** gefiltert.
- Wenn Sie bei einem OUTER JOIN in der gegenüberliegenden Tabelle filtern möchten, fügen Sie das Filterkriterium mit in die **ON-Klausel** des JOINs ein, z. Bsp. Sie möchten alle Kunden auflisten, aber ihre Umsätze nur für einen beschränkten Zeitraum berechnen.
