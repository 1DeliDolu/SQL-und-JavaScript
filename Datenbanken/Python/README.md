# Python in Azure Data Studio

## Jupyter Notebooks in Azure Data Studio

Jupyter Books und Notebooks sind Ordnerstrukturen und Dateien, mit denen Code für Datenanalyse und Datenbank-Projekte organisiert wird.

Jupyter Books können unterteilt werden in **Sections**, das sind Unterordner. Jede Section bekommt eine Markdown-Datei zur Beschreibung des Inhalts.

Books und Sections können Markdown Dateien zur Dokumentation und Jupyter Notebooks für Code enthalten.

Jupyter Notebooks sind eingeteilt in Zellen: Code-Zellen und Markdown-Zellen.

Einer Code-Zelle wird ein **Kernel** zugeordnet und ein **Server**.

Als **Kernel** stehen folgende zur Auswahl:

- SQL: zur Ausführung von Befehlen auf einem Datenbank-Server
- Python: für allgemeine Aufgaben der Datenanlyse
- Powershell: zum Beispiel für die Verwaltung von Ressourcen in der Azure Cloud

Das hier geöffnete Jupyter Book enthält Demos für die Verwendung von **Python** in Azure Data Studio. Damit lernen wir unterschiedliche Datenkonzepte, Dateiformate und ihre Strukturen kennen, bevor wir uns SQL und Relationalen Datenbanken zuwenden.

## Folgende Demos sind bisher enthalten

- [Installation diverser Python Bibliotheken](vorbereitung.ipynb)
- Information zu Big Data Dateiformaten [Avro, ORC und Parquet](dateiformate-big-data.md)
- [DataFrame einlesen aus unterschiedlichen Dateiformaten](file_to_dataframe.ipynb)
- [Dataframe ausgeben in unterschiedliche Dateiformate](dataframe_to_file.ipynb)
- [Bevölkerungszahlen aus CSV-Datei laden, filtern und plotten](population.ipynb)
- [Studentendaten aus CSV-Datei laden, filtern, ausgeben](studenten.ipynb)
- [SQL Server Datenbank erstellen zu späteren Abfrage mit Python](cd-catalog-db.ipynb)
- [Abfrage von SQL Server mit Python](sql.ipynb)
- [JSON Daten verarbeiten](json.ipynb)
- [XML Daten verarbeiten](xml.ipynb)
- [JSON in CSV umwandeln](json_to_csv.ipynb)

## Python Kurse

Möchten Sie tiefer in Python einsteigen, dann empfehle ich folgende Kurse:

- [Kurse auf kaggle.com](https://www.kaggle.com/learn)
  - [Intro to Programming](https://www.kaggle.com/learn/intro-to-programming)
  - [Python](https://www.kaggle.com/learn/python)
  - [Pandas](https://www.kaggle.com/learn/pandas)
- [freeCodeCamp: Data Analysis with Python](https://www.freecodecamp.org/learn/data-analysis-with-python/)
- [freeCodeCamp: Scientific Computing with Python](https://www.freecodecamp.org/learn/scientific-computing-with-python/)
