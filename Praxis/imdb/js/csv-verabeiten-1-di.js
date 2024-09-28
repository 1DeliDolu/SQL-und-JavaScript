(async () => {
    "use strict";
    const CSV_URL = "data/movies.csv";
    const fetchCSVData = async (url) => {
        try {
            let response = await fetch(url);
            if (!response.ok) {
                throw new Error(`HTTP error! ${response.status}: ${response.status}`);
            }
            //je nach Daten: response.text() oder response.json() oder reponse.blob() verwenden
            let csvData = await response.text();
            console.log(csvData);
            // Zeile für Zeile verarbeiten und einzelne Spalten extrahieren
            // Aufteilen in Zeilen '\n'
            // Für jede Zeile:
            // Aufteilen in Spalten: Trennzeichen ','
            // Problem: wird auch als Tausendertrennzeichen verwendet
            // Ersetze ',' durch ';' wo es nicht innerhalb von Anführungszeichen steht
            // Braucht replace(/,(?=(?:[^"]*"){2})[^"]*$)/g, ';')
        } catch (error) {
            console.error(`Error fetching data from ${url}: ${error.message}`);
        }
    };
    const MOVIES_DATA = await fetchCSVData(CSV_URL);
})();
