# Normalisierung

Typische Ausgangssitation: Der Kunde hat seine Daten erfasst, indem er einfach alle Informationen zusammen in eine Tabelle geschrieben hat. Dadurch werden viele Daten **redundant** (mehrfach) erfasst, wodurch Fehlerquellen entstehen, durch die es zu Widersprüchen in den Daten kommen kann.

**Normalisierung** ist ein mehrstufiger Prozess, in dem Redundanzen entfernt werden, vor allem, indem die Daten auf mehrere Tabellen verteilt werden. Die Ergebnisse dieser Prozesschritte nennt man **Normalformen**. Eine typische Anforderung (auch in IHK-Prüfungen) ist die **Normalisierung zur dritten Normalform** (3NF).

## Anforderungen der Normalformen

Die Anforderungen der Normalformen sind folgende:

### Erste Normalform (1NF)

- Eine Relation befindet sich in der ersten Normalform, wenn alle Attribute nur einfache (**atomare**) Attributwerte aufweisen.
  - Zusammengesetzte Attributwerte werden auf mehrere Spalten verteilt.
  - Mehrwertige Attributwerte werden auf mehrere Zeilen verteilt.

### Zweite Normalform (2NF)

- Eine Relation befindet sich in der zweiten Normalform, wenn
  1. sie in der ersten Normalform ist und
  2. jedes Nicht-Schlüssel-Attribut vom Primärschlüssel voll funktional abhängig ist.

### Dritte Normalform (3NF)

- Eine Relation befindet sich in der dritten Normalform, wenn
    1. sie in der zweiten Normalform ist und
    2. jedes Nichtschlüsselattribute nicht transitiv vom Primärschlüssel abhängig ist, d.h. aus keinem Nichtschlüsselattribut folgt ein anderes Nichtschlüsselattribut.

## Inhalte

Wir betrachten die Entstehung zweiter Datenmodelle durch die Normalisierung:

- [Eine Firma ordnet Abteilungen Mitarbeiter zu, und den Mitarbeitern Tätigkeiten in Projekten](Firma-Personal-Projekt%20(Herdt)/Firma-Personal-Projekt.md)

- [In einer Schule werden Schüler Klassen und Lernangeboten zugeordnet](Schule/Schule.md)

## Lektüre mit Beispielen zur Vertiefung der Thematik

- [Weniger Redundanz dank Datenbank-Normalisierung (IONOS)](https://www.ionos.de/digitalguide/hosting/hosting-technik/normalisierung-von-datenbanken/)

- [Normalisierung von Datenbanken (Tino Hempel)](https://www.tinohempel.de/info/info/datenbank/normalisierung.htm)

- [Grundlagen des Datenbankentwurfs, ER-Modell, Normalisierung (Entwickler.de)](https://entwickler.de/datenbanken/1-grundlagen-des-datenbankentwurfs-er-modell-normalisierung)

- [Normalisierung von Datenbanken](http://www.brg-woergl.tsn.at/Access/Normalform.html)
