(async () => {
    "use strict";
    const CSV_URL = "data/movies.csv";

    // Funktion zum Abrufen und Verarbeiten der CSV-Daten
    const fetchCSVData = async (url) => {
        try {
            let response = await fetch(url);
            console.log(response);
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            let csvData = await response.text();
            //console.log(csvData);

            // CSV-Daten Zeile für Zeile verarbeiten
            return csvData.split("\n")
                .filter(row => row.trim() !== '') // Leere Zeilen entfernen
                .map(row => row.replace(/,(?=(?:[^"]*"[^"]*")*[^"]*$)/g, ';').split(";"));
        } catch (error) {
            console.error(`Error fetching data from ${url}:`, error.message);
        }
    };

    // CSV-Daten in ein Array von Objekten umwandeln
    const mapMoviesToObject = (moviesData) => {
        let movies = [];
        let props = moviesData[0]; // Erste Zeile enthält die Spaltennamen
        moviesData.slice(1).forEach((movie, idx) => { // Index hinzufügen
            let movieObj = { index: idx + 1 }; // Der Index beginnt bei 1
            props.forEach((prop, index) => {
                movieObj[prop] = movie[index];
            });
            movies.push(movieObj);
        });
        return movies;
    };

    // Korrekturen an den Filmeigenschaften vornehmen
    const fixMovieProps = (movieObj) => {
        movieObj.index= movieObj.index.replace('.', '');
        // movie_name : ersetze Anführungszeichen durch nichts
        movieObj.movie_name = movieObj.movie_name.replace(/["]/g, "");

        // year_of_release : entferne Klammern
        movieObj.year_of_release = movieObj.year_of_release.replace(/[\(\)]/g, "");

        // gross_total : entferne $ und M
        movieObj.gross_total = movieObj.gross_total.replace(/[$,M]/g, "");
        if (movieObj.gross_total === '') { movieObj.gross_total = '0'; }

        // votes : entferne Anführungszeichen und Kommas
        movieObj.votes = movieObj.votes.replace(/["]/g, "").replace(/,/g, '');

        // index : entferne Punkt
        movieObj.index = movieObj.index.replace('.', '');

        // run_time : entferne Leerstelle und min
        movieObj.run_time = movieObj.run_time.replace(/[ min]/g, "");

        // genre : entferne Anführungszeichen und Leerzeichen, splitte durch Komma
        movieObj.genre = movieObj.genre.replace(/["]/g, "").split(',').map(genre => genre.trim());

        return movieObj;
    };

    // JSON in XML umwandeln
    const jsonToXML = (movies) => {
        let strXml = `<?xml version="1.0" encoding="UTF-8"?>\n<movies>\n`;
        movies.forEach(movie => {
            strXml += `
            <movie>
                <index>${movie.index}</index>
                <movie_name>${movie.movie_name}</movie_name>
                <year_of_release>${movie.year_of_release}</year_of_release>
                <category>${movie.category}</category>
                <run_time>${movie.run_time}</run_time>
                <genres>
                ${movie.genre.map(g => `<genre>${g}</genre>`).join("")}
                </genres>
                <imdb_rating>${movie.imdb_rating}</imdb_rating>
                <votes>${movie.votes}</votes>
                <gross_total>${movie.gross_total}</gross_total>
            </movie>\n`;
        });
        strXml += `</movies>\n`;
        return strXml;
    };

    // Funktion zum Speichern der XML-Datei
    const saveXmlFile = (blobData, filename) => {
        const BLOB = new Blob([blobData], { type: "application/xml" });
        const LINK = document.createElement("a");
        LINK.href = URL.createObjectURL(BLOB);
        LINK.innerHTML = "Download XML";
        LINK.download = filename;
        document.body.appendChild(LINK);
    };

    // Hier ist der Start des Programms
    const MOVIES_DATA = await fetchCSVData(CSV_URL);
    const MOVIES_DATA_OBJECTS = mapMoviesToObject(MOVIES_DATA).map(fixMovieProps);
    saveXmlFile(jsonToXML(MOVIES_DATA_OBJECTS), "movies.xml");


})();
