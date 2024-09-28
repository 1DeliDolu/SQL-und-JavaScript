# Relationale Datenbanken

> Eine relationale Datenbank ist ein Datenbanktyp, der die Speicherung und den Zugriff auf miteinander verbundene Datenpunkte ermöglicht. Relationale Datenbanken basieren auf dem relationalen Modell, einer intuitiven und einfachen Art, Daten in Tabellen darzustellen. In einer relationalen Datenbank ist jede Zeile in der Tabelle ein Datensatz mit einer eindeutigen ID, die als Schlüssel bezeichnet wird. Die Spalten der Tabelle enthalten Attribute der Daten, und jeder Datensatz verfügt in der Regel über einen Wert für jedes Attribut, sodass die Beziehungen zwischen Datenpunkten einfach hergestellt werden können.

Quelle: [Was ist eine relationale Datenbank (RDMBS)?](https://www.oracle.com/de/database/what-is-a-relational-database/)

Auch empfohlene Lektüre: [Wikipedia: Relationale Datenbank](https://de.wikipedia.org/wiki/Relationale_Datenbank)

## Wege zum relationalen Datenbankmodell

Hier werden kurz das **ER-Modell**, das **Relationen-Modell** und die **Normalisierung** besprochen und nachher anhand von Beispielen vertieft. Diese drei Techniken sind typische Prüfungsthemen in den Abschlussprüfungen der Fachinformatiker.

### Entity-Relationship-Modell und Relationen-Modell

Diese Modellierung beginnt damit, **Entitätstypen** zu identifizieren, das sind Dinge und Personen, die an dem Geschäftsprozess beteiligt sind, dessen Daten gespeichert werden sollen. Im *ER-Modell* werden Entitätstypen als **Rechtecke** dargestellt.

Dann werden **Beziehungen** zwischen diesen Entitätstypen identifiziert und benannt. Diese Beziehungen werden als **Rauten** auf der Verbindungslinie zwischen zwei Entitätstypen eingezeichnet und mit einer Verbform benannt.

Dann wird die *numerische Beziehung* festgelegt: Kommen auf eine Entität des einen Entitätstyps viele Entitäten des anderen Entitätstypes? Oder handelt es sich um eine viele-zu-viele Beziehung? Diese Angaben nennt man **Kardinalität**. Sie werden an der Beziehungslinie notiert, wo sie jeweils am Entitätstyp endet.

Ursprünglich wurden die Kardinalitäten als Zahlen, Sternchen, oder Buchstaben notiert:

- 1 : *
- 1 : n
- \* : *
- n : m

In einer neueren Notationsform wird die 1 als Strich und viele als Krähenfuß notiert. Diese Notation sehen wir im Modellierungs-Werkzeug [Erdplus.com](https://erdplus.com).

Im nächsten Modellierungschritt werden die Eigenschaften der Entitätstypen als mit den Rechtecken verbundene Ellipsen eingezeichnet. Man nennt diese Eigenschaften **Attribute**. In der Datenbank begegnen uns diese Attribute als **Spalten** in den Tabellen. Ein Attribut oder eine Kombination mehrerer Attribute definiert, woran eine konkrete Entität eindeutig identifiziert werden kann. Dieses Attribut (oder Gruppe von Attributen) wird **Primary Key** (Primärschlüssel, PK) genannt. Die Bezeichnungen dieser Attribute werden im ER-Modell unterstrichen.

Die weiteren Attribute nennt man beschreibende Attribute.

Auch an Beziehungen können Attribute notiert werden, wenn es **n : m Beziehungen** sind. Solche Beziehungen werden im Relationen-Modell durch eine **Zwischentabelle** in zwei **1 : n Beziehungen** aufgelöst.

Ist das ER-Modell in dieser Detailtiefe fertig, so kann es in ein **Relationen-Modell** umgewandelt werden. In dieser Darstellung erscheinen die Tabellen als Rechtecke, in denen die Attribute untereinander aufgelistet sind. Primärschlüssel sind auch hier unterstrichen oder – besser – mit **PK** gekennzeichnet.

Am "viele"-Ende der Beziehungen erscheinen in dieser Ansicht auch die **Foreign-Keys** (Fremdschlüssel, FK) und werden mit **FK** gekennzeichnet. In einer **Zwischentabelle** bilden typisch die Fremdschlüssel zusammen den Primärschlüssel. Falls nötig, kann von dieser Regel auch abgewichen werden.

Im Relationen-Modell werden für alle Attribute jeweils passende **Datentypen** definiert. Der Datentyp muss jeweils von der Art und Größe zu den Daten passen, die gespeichert werden sollen, ohne dabei unnötig Platz zu verschwenden.Nach der Festlegung der Datentypen kann der SQL-Code zur Erstellung der Tabellen erzeugt werden.

### Normalisierung vorhandener Datentabellen

Typische Ausgangssitation: Der Kunde hat seine Daten erfasst, indem er einfach alle Informationen zusammen in eine Tabelle geschrieben hat. Dadurch werden viele Daten **redundant** (mehrfach) erfasst, wodurch Fehlerquellen entstehen, durch die es zu Widersprüchen in den Daten kommen kann.

**Normalisierung** ist ein mehrstufiger Prozess, in dem Redundanzen entfernt werden, vor allem, indem die Daten auf mehrere Tabellen verteilt werden. Die Ergebnisse dieser Prozesschritte nennt man **Normalformen**. Eine typische Anforderung (auch in IHK-Prüfungen) ist die **Normalisierung zur dritten Normalform** (3NF).

Die Anforderungen der Normalformen sind folgende:

#### Erste Normalform (1NF)

- Eine Relation befindet sich in der ersten Normalform, wenn alle Attribute nur einfache (**atomare**) Attributwerte aufweisen.
  - Zusammengesetzte Attributwerte werden auf mehrere Spalten verteilt.
  - Mehrwertige Attributwerte werden auf mehrere Zeilen verteilt.

#### Zweite Normalform (2NF)

- Eine Relation befindet sich in der zweiten Normalform, wenn
  1. sie in der ersten Normalform ist und
  2. jedes Nicht-Schlüssel-Attribut vom Primärschlüssel voll funktional abhängig ist.

#### Dritte Normalform (3NF)

- Eine Relation befindet sich in der dritten Normalform, wenn
  1. sie in der zweiten Normalform ist und
  2. jedes Nichtschlüsselattribute nicht transitiv vom Primärschlüssel abhängig ist, d.h. aus keinem Nichtschlüsselattribut folgt ein anderes Nichtschlüsselattribut.
