# Daten erfassen

Im **Normalisierungsbeispiel Firma-Personal-Projekt** finden Sie [Beispiel-Code zur Daten-Erfassung](../Normalisierung/Firma-Personal-Projekt%20(Herdt)/Daten.ipynb) mit dem **INSERT-Statement** und mit **Transaktionen**.

Das *Syntaxschema* für den **INSERT** Befehl ist wie folgt:

```sql
INSERT TabellenName (Attributliste, ..., ...)
VALUES  (Werteliste, ..., ...),
        (Werteliste, ..., ...),
        (Werteliste, ..., ...),
        ... ;
```

Natürlich kann auf diese Weise auch nur ein einzelner Datensatz angegeben werden, anstatt – wie abgebildet – mehrere Datensätze auf einmal.

In der *Attributliste* dürfen die Attribute ausgelassen werden, die **NULL** zulassen oder als **IDENTITY** automatisch befüllt werden.

Zulässig, aber *nicht empfehlenswert* ist, die Attributliste nicht anzugeben. In diesem Fall müssen die Attributwerte für alle Attribute in der Reihenfolge der Tabellendefinition angegeben werden.

## Transaktionen

Wenn mehrere Datensätze abhängig von einander eingegeben werden müssen, dann sollten die zusammengehörigen INSERTs in eine **Transaktion** verpackt werden.

Die **Transaktionssteuerung** ermöglicht, dass die Datenbank immer einen konsistenten Zustand hat, indem entweder alle INSERTs dauerhaft gespeichert werden, oder – im Falle eines Fehlers – die vor dem Fehler erfolgten INSERTs wieder annuliert werden. Dadurch wird das **[ACID-Prinzip](https://de.wikipedia.org/wiki/ACID)** relationaler Datenbanken umgesetzt.

Die Bestätigung der Transaktion heißt **COMMIT**, die Annulierung **ROLLBACK**.

**TRY** und **CATCH** Code-Blöcke erlauben, dass das **COMMIT** nur dann ausgeführt wird, wenn bis zum Ende des TRY-Blocks kein Fehler aufgetreten ist. Bei einem Fehler wird der TRY-Block nicht weiter ausgeführt. Stattdessen werden die Anweisungen des CATCH-Blocks ausgeführt.

In **[Transact-SQL](https://de.wikipedia.org/wiki/Transact-SQL)** wird eine Transaktion folgendermaßen strukturiert:

```sql
BEGIN TRANSACTION

BEGIN TRY
   -- Zusammengehörige DML Anweisungen ausführen
   INSERT INTO ...
   INSERT INTO ... 
   UPDATE ...
   
   -- Commit der Transaktion, wenn kein Fehler aufgetreten ist
   COMMIT TRANSACTION
END TRY
BEGIN CATCH
   -- Dieser Codeblock wird ausgeführt, sollte eine der Anweisungen einen Fehler verursachen.
   -- Rollback der Transaktion
   ROLLBACK TRANSACTION
END CATCH

```

## Import größerer Datenmengen

Mit dem **BULK INSERT** Befehl können Sie eine größere Anzahl von Datensätzen unter Anderem aus **CSV-Dateien** importieren.

Anleitungen und Beispiele hierzu finden Sie in der **[Transact-SQL Referenz](https://learn.microsoft.com/de-de/sql/t-sql/statements/bulk-insert-transact-sql)**.
