# Referentielle Integrität

> Im Bereich der relationalen Datenbanken wird die referentielle Integrität dazu verwendet die Konsistenz und die Integrität der Daten sicherzustellen. Dazu werden Regeln aufgestellt, wie und unter welchen Bedingungen ein Datensatz in die Datenbank eingetragen wird.
Bei der referentiellen Integrität können Datensätze die einen Fremdschlüssel aufweisen nur dann gespeichert werden, wenn der Wert des Fremdschlüssels einmalig in der referenzierten Tabelle existiert. Im Falle, dass ein referenzierter Wert nicht vorhanden ist, kann der Datensatz nicht gespeichert werden.

**Quelle:** [Datenbanken Verstehen](https://www.datenbanken-verstehen.de/datenmodellierung/referentielle-integritaet/)

Referentielle Integrität wird bei der Erstellung des Fremdschlüssels (FK, Foreign Key) festgelegt, wobei vier verschiedene Verhalten beim Ändern **ON UPDATE** oder Löschen **ON DELETE** eines referenzierten Primärschlüssels (PK, Primary Key).

| Einstellung | Verhalten | Anmerkung |
| --- | --- | --- |
| NO ACTION | Ändern bzw. Löschen des PK nicht möglich, sofern FKs darauf verweisen  | Datenintegrität ist gesichert! |
| CASCADE | Änderung bzw. Löschen werden an FK Datensätze weitergegeben | Booom! |
| SET NULL | Der FK wird NULL.  | Der Datensatz verliert seine Zuordnung. |
| SET DEFAULT | Der FK erhält den Default Wert. | Der Default Wert muss in der referenzierten PK Tabelle vorhanden sein und eine sinnvolle Zuordnung erlauben. |

[Und hier geht's zur Demo...](Referentielle%20Integrit%C3%A4t%20Demo.ipynb)
