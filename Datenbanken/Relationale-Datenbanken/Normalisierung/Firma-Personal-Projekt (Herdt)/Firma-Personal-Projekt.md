# Normalisierungsbeispiel Abteilung / Personal / Projekt

**Quelle:** SQL Grundlagen und Datenbankdesign, Herdt-Verlag (2021)

## Darstellung der Normalisierungsschritte

[Excel-Datei: Normalisierung Abteilung-Personal-Projekt.xlsx](./Normalisierung%20Abteilung-Personal-Projekt.xlsx)

## Datenmodell

### Entitätstypen und Beziehungen

![Entitäten](./Grafiken/Normalisierungsbeispiel%20Step%201%20Entit%C3%A4ten.png)

### Attribute

Tätigkeit und Stundenlohn werden noch redundant erfasst.
![Attribute](./Grafiken/Normalisierungsbeispiel%20Step%202%20Attribute.png)

### Beziehungstabelle ergänzt

Tätigkeit als Entitätstyp hinzugefügt
Arbeitet_An ist eine Beziehungstabelle.
Ihr Primärschlüssel wird aus Fremdschlüsseln zusammengesetzt.
![Neue Entität: Tätigkeit](./Grafiken/Normalisierungsbeispiel%20Step%203%20Entit%C3%A4t%20T%C3%A4tigkeit.png)

### Relationenmodell

In Arbeitet_An wurde die TätigkeitsNr aus dem Primärschlüssel entfernt.
So kann für jeden Mitarbeiter je Projekt nur eine Tätigkeit angegeben werden.
![Relationenmodell](./Grafiken/Normalisierungsbeispiel%20Step%204%20Relationenmodell.png)
