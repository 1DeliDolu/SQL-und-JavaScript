# Datenbank und Tabellen erstellen

Im **Normalisierungsbeispiel Firma-Personal-Projekt** finden Sie [Beispiel-Code zur Erstellung der Datenbank und Tabellen](../Normalisierung/Firma-Personal-Projekt%20(Herdt)/Struktur.ipynb).

Hier werden Anweisungen aus diesem Beispiel erläutert:

## USE MASTER

Mit **USE** wechselt das Abfragefenster zu einer anderen Datenbank.

Während der Entwurf der Tabellen verfeinert wird, möchte ich möglicherweise die Datenbank löschen und neu erstellen.
Wenn gerade Verbindungen mit der Datenbank bestehen, kann sie nicht gelöscht werden.

Daher wechsle ich vor dem Löschen in die Master-Datenbank, eine immer auf dem Microsoft SQL Server vorhandene System-Datenbank.

Falls andere Abfragefenster oder andere Benutzer auf die Datenbank zugreifen, müssen die Verbindungen vor dem Löschen getrennt werden. Das geht gut über die GUI des SQL Server Management Studios.

## DROP DATABASE IF EXISTS

**DROP DATABASE** löscht die Datenbank. **IF EXISTS** führt den Befehl nur dann aus, falls die Datenbank tatsächlich vorhanden ist, und vermeidet so Fehler, wenn die Datenbank nicht vorhanden ist.

## GO

**GO** ist kein SQL Befehl, sondern ein SQL Server spezifischer **Batch-Operator**, der die an den Server geschickten Befehle in **Batches** portioniert.

Einige **DDL-Befehle** funktionieren nur, wenn Sie am Anfang eines batches oder alleine in einem Batch stehen.

In solchen Fällen wird die **GO** Anweisung benötigt, wenn das Programm weitere Anweisungen enthält.

## CREATE TABLE

Mit **CREATE TABLE** wird die Tabelle erstellt.

In runden Klammern werden – untereinander und durch Komma getrennt – die Attribute definiert.

Für jedes Attribut werden Name, Datentyp und – optional – die Einstellung festgelegt, ob für das Attribut ein Wert erforderlich ist.

**NULL**: der Wert darf entfallen.
**NOT NULL**: ein Wert muss immer angegeben werden.

Außerdem können am Ende der Spaltendefinition **Schlüssel** und andere **Constraints** festgelegt werden. Schlüssel und Constraints bilden eigene Objekte in der Datenbank. Im Beispiel verwende ich **CONSTRAINT-Syntax**, mit der ich selbst die Namen dieser Objekte festlege. So kann ich mit **DROP CONSTRAINT** bei Bedarf diese Objekte wieder entfernen, ohne den Namen erst ermitteln zu müssen.

## CONSTRAINT

Ein **CONSTRAINT** ist eine Einschränkung zu den zulässigen Werten eines Attributs.

Ich benutze *Prefixe* zur Benennung der Constraints, so dass die Namen eindeutig auf die Art des Constraints hinweisen.

Folgende Arten von Constraints sind möglich:

| Typ | Art der Einschränkung | Prefix | Anmerkung
| --- | --- | --- | --- |
| PRIMARY KEY | Die Werte dieses Attributs müssen eindeutig sein | pk_ | Ich kombiniere das Prefix mit dem Namen der Tabelle. |
| FOREIGN KEY | Es sind nur Werte zulässig, die in dem referenzierten PK Attribut vorkommen | fk_ | Ich kombiniere das Prefix mit dem Namen der Tabelle und dem Namen der referenzierten Tabelle. |
| DEFAULT | Standard-Wert | df_ | Wenn bei INSERT kein Wert angegeben wird, bekommt das Attribut automatisch den Default-Wert |
| UNIQUE | Werte dieses Attributs müssen eindeutig sein | uq_ | Zu dem Unique-Attribut wird ein INDEX erstellt |
| CHECK | Bei Einfügen des Wertes wird geprüft, ob der Wert einer Regel entspricht | ck_ | Z. Bsp. IN(Werteliste), >= Wert, <= Wert oder BETWEEN Wert1 AND Wert2 |

### Constraints in der Beispiel-Datenbank

- Jede Tabelle hat einen PRIMARY KEY.
- Personal und Arbeitet_An haben FOREIGN KEYs.
- Tätigkeit enthält einen DEFAULT, einen CHECK und einen UNIQUE Constraint.

### Demonstration zu Constraints

Wie sich Constraints in der Praxis auswirken, können Sie in der [Constraint-Demo](../Normalisierung/Firma-Personal-Projekt%20(Herdt)/Constraint-Demo.ipynb) ausprobieren.
