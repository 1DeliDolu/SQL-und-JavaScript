(() => {
  "use strict";

  const MYFORM = document.querySelector("#jsondemo>form");
  const anzeigeButton = document.querySelector("#anzeigen");
  let kontaktListe = JSON.parse(localStorage.getItem("kontaktListe")) || [];

  // Funktion zum Speichern des Kontakts
  const speicherKontakt = (evt) => {
    evt.preventDefault(); // Standardaktion verhindern
    let formData = new FormData(MYFORM);
    let neuerKontakt = {};
    for (let [key, value] of formData) {
      console.log(key, value);  // Kontaktdaten ausgeben
      neuerKontakt[key] = value;
    }
    neuerKontakt.uuid = crypto.randomUUID(); // Eine eindeutige ID für jeden Kontakt
    console.log(neuerKontakt);
    kontaktListe.push(neuerKontakt); // Kontakt zur Liste hinzufügen
    localStorage.setItem("kontaktListe", JSON.stringify(kontaktListe)); // Kontaktliste im localStorage speichern
    MYFORM.reset(); // Formular zurücksetzen
  };

  // Funktion zum Anzeigen der Kontaktliste
  const zeigeListe = (evt) => {
    const ausgabeDiv = document.querySelector("#ausgabe");
    if (kontaktListe.length === 0) {
      ausgabeDiv.innerHTML = "<p>Keine Kontakte vorhanden.</p>";
      return;
    }

    // Tabelle erstellen
    let tableHTML = `
        <table>
            <thead>
                <tr>
                    <th>Nachname</th>
                    <th>Vorname</th>
                    <th>Geburtsdatum</th>
                    <th>Beruf</th>
                    <th>E-Mail</th>
                    <th>Aktionen</th>
                </tr>
            </thead>
            <tbody>
    `;

    kontaktListe.forEach(kontakt => {
      tableHTML += `
            <tr data-uuid="${kontakt.uuid}">
                <td>${kontakt.nachname}</td>
                <td>${kontakt.vorname}</td>
                <td>${kontakt.geburtsdatum}</td>
                <td>${kontakt.beruf}</td>
                <td>${kontakt.email}</td>
                <td><img class="edit" src="images/icons/pencil.svg" alt="Bearbeiten" title="Bearbeiten" data-uuid="${kontakt.uuid}">
                <img  class="delete" src="images/icons/delete.svg" alt="Löschen" title="Löschen" data-uuid="${kontakt.uuid}"></td>
            </tr>
        `;
    });

    tableHTML += "</tbody>";
    tableHTML += "</table>";
    console.log(tableHTML);
    document.getElementById('ausgabe').innerHTML = tableHTML;

    // EventListener für Bearbeiten und Löschen
    document.querySelectorAll('img[data-uuid]').forEach((img) => {
      img.addEventListener('click', editOrDeleteKontakt);
    });
  };

  const editOrDeleteKontakt = (evt) => {
    console.log(evt.target.alt, evt.target.dataset.uuid);

    
  };
  
  const editKontakt = (uuid) => {
    // Find the index of the contact in the kontaktListe with the corresponding uuid
    const index = kontaktListe.findIndex((kontakt) => kontakt.uuid === uuid);
    if (index === -1) {
      console.log("Contact not found!");
      return;
    }
  
    // Open the form with the values of the contact
    const kontakt = kontaktListe[index];
    MYFORM.vorname.value = kontakt.vorname;
    MYFORM.nachname.value = kontakt.nachname;
    MYFORM.email.value = kontakt.email;
    MYFORM.beruf.value = kontakt.beruf;
    MYFORM.geburtsdatum.value = kontakt.geburtsdatum;
    MYFORM.uuid.value = kontakt.uuid;
  
    // Wait for the user to make changes and submit the form
    MYFORM.addEventListener("submit", (evt) => {
      evt.preventDefault();
      // Update the contact with the new values
      kontakt.vorname = MYFORM.vorname.value;
      kontakt.nachname = MYFORM.nachname.value;
      kontakt.email = MYFORM.email.value;
      kontakt.beruf = MYFORM.beruf.value;
      kontakt.geburtsdatum = MYFORM.geburtsdatum.value;
  
      // Update the kontaktListe in LocalStorage
      localStorage.setItem("kontaktListe", JSON.stringify(kontaktListe));
  
      // Clear the form
      MYFORM.reset();
  
      // Close the form or perform any other necessary actions
    });
  };
  
  
  const deleteKontakt = (uuid) => {
    console.log(uuid);
  
    // bei delete:
    // - Kontakt aus der Liste entfernen
    // - finde in kontaktListe den Kontakt mit der entsprechenden UUID
    // - entferne den Kontakt aus der Liste
    // - Aktualisierte Liste in localStorage speichern
    // - Tabellenzeile löschen
  
    // Find the index of the contact with the given UUID in kontaktListe
    const index = kontaktListe.findIndex((kontakt) => kontakt.uuid === uuid);
    // If the contact is found, remove it from the list
    if (index !== -1) {
      kontaktListe.splice(index, 1);
      // Update the localStorage with the updated kontaktListe
      localStorage.setItem('kontaktListe', JSON.stringify(kontaktListe));
      // Remove the corresponding table row from the DOM
      const tableRow = document.querySelector(`tr[data-uuid="${uuid}"]`);
      tableRow.remove(tableRow);
    } else {
      console.log("Contact not found!");
    }
  };
  
  MYFORM.addEventListener('submit', speicherKontakt);
  document.querySelector('#anzeigen').addEventListener('click', zeigeListe);

})();
