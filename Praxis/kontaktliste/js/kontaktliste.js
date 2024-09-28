(() => {
  "use strict";

  const MYFORM = document.querySelector("#jsondemo>form");
  const anzeigeButton = document.querySelector("#anzeigen");
  const ABLAGE = document.getElementById("ablage");
  const intLimit = 200; // Limit für die Bildgröße in KiB
  let kontaktListe = JSON.parse(localStorage.getItem("kontaktListe")) || [];

  // Funktion zum Validieren des Formulars
  const validateForm = () => {
    const nachname = MYFORM.nachname.value.trim();
    const vorname = MYFORM.vorname.value.trim();
    const geburtsdatum = MYFORM.geburtsdatum.value.trim();
    const beruf = MYFORM.beruf.value.trim();
    const email = MYFORM.email.value.trim();

    if (!nachname || !vorname || !geburtsdatum || !beruf || !email) {
      alert("Bitte füllen Sie alle Felder aus.");
      return false;
    }

    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailPattern.test(email)) {
      alert("Bitte geben Sie eine gültige E-Mail-Adresse ein.");
      return false;
    }

    return true;
  };

  // Funktion zum Speichern oder Bearbeiten des Kontakts
  const speicherKontakt = evt => {
    evt.preventDefault();

    if (!validateForm()) {
      return;
    }

    let formData = new FormData(MYFORM);
    let neuerKontakt = {};
    for (let [key, value] of formData) {
      neuerKontakt[key] = value;
    }

    if (neuerKontakt.uuid === "") {
      neuerKontakt.uuid = crypto.randomUUID();
      kontaktListe.push(neuerKontakt);
    } else {
      const index = kontaktListe.findIndex(k => k.uuid === neuerKontakt.uuid);
      kontaktListe[index] = neuerKontakt;
    }

    localStorage.setItem("kontaktListe", JSON.stringify(kontaktListe));
    resetForm();
    zeigeListe();
  };

  // Funktion zum Löschen des Kontakts
  const deleteKontakt = evt => {
    const uuid = evt.target.dataset.uuid;
    kontaktListe = kontaktListe.filter(k => k.uuid !== uuid);
    localStorage.setItem("kontaktListe", JSON.stringify(kontaktListe));
    zeigeListe();
  };

  // Funktion zum Anzeigen der Kontaktliste
  const zeigeListe = () => {
    const ausgabeDiv = document.querySelector("#ausgabe");
    if (kontaktListe.length === 0) {
      ausgabeDiv.innerHTML = "<p>Keine Kontakte vorhanden.</p>";
      return;
    }

    let tableHTML = `
      <table>
        <thead>
          <tr>
            <th>Foto</th>
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
          <td>${kontakt.bild ? `<img src="${kontakt.bild}" alt="Kontaktfoto" style="width:50px;height:50px;">` : 'Kein Bild'}</td>
          <td>${kontakt.nachname}</td>
          <td>${kontakt.vorname}</td>
          <td>${kontakt.geburtsdatum}</td>
          <td>${kontakt.beruf}</td>
          <td>${kontakt.email}</td>
          <td>
            <img class="edit" src="images/icons/pencil.svg" alt="Bearbeiten" title="Bearbeiten" data-uuid="${kontakt.uuid}">
            <img class="delete" src="images/icons/delete.svg" alt="Löschen" title="Löschen" data-uuid="${kontakt.uuid}">
          </td>
        </tr>
      `;
    });

    tableHTML += "</tbody></table>";
    ausgabeDiv.innerHTML = tableHTML;

    document.querySelectorAll(".edit").forEach(img => {
      img.addEventListener("click", editKontakt);
    });

    document.querySelectorAll(".delete").forEach(img => {
      img.addEventListener("click", deleteKontakt);
    });
  };

  // Funktion zum Bearbeiten des Kontakts
  const editKontakt = evt => {
    const uuid = evt.target.dataset.uuid;
    const kontakt = kontaktListe.find(k => k.uuid === uuid);

    MYFORM.nachname.value = kontakt.nachname;
    MYFORM.vorname.value = kontakt.vorname;
    MYFORM.geburtsdatum.value = kontakt.geburtsdatum;
    MYFORM.beruf.value = kontakt.beruf;
    MYFORM.email.value = kontakt.email;
    MYFORM.uuid.value = kontakt.uuid;

    ABLAGE.innerHTML = ""; // Vorherige Bilder entfernen
    if (kontakt.bild) {
      let img = document.createElement("img");
      img.src = kontakt.bild;
      ABLAGE.appendChild(img);
    }
  };

  const showPicture = evt => {
    const img = document.createElement("img");
    img.src = evt.target.result;

    // Vorheriges Bild entfernen
    const oldImage = document.querySelector("#ablage > img");
    if (oldImage) oldImage.remove();

    // Bild an die Ablage anhängen
    ABLAGE.appendChild(img);

    // Bild als Base64 im versteckten Input speichern
    if (MYFORM.bild) { // Überprüfen, ob das Element existiert
        MYFORM.bild.value = evt.target.result;
    } else {
        console.error("Das Eingabefeld für das Bild wurde nicht gefunden.");
    }
};

  const handleError = evt => {
    console.error(evt.target.error);
  };

  const handleDrop = evt => {
    evt.preventDefault(); // Standardverhalten verhindern
    let objFile = evt.dataTransfer.files[0];
    if (["image/jpeg", "image/png", "image/gif", "image/svg+xml"].includes(objFile.type)) {
      if (objFile.size / 1024 > intLimit) {
        return alert(`Die Bildgröße darf nicht größer als ${intLimit} KiB sein.`);
      }
      let reader = new FileReader();
      reader.addEventListener('load', showPicture);
      reader.addEventListener('error', handleError);
      reader.readAsDataURL(objFile);
    } else {
      alert('Dieser Dateityp wird nicht unterstützt.');
    }
  };

  const doNotDrop = evt => {
    evt.preventDefault();
  };

  ABLAGE.addEventListener("drop", handleDrop, false);
  document.documentElement.addEventListener("dragover", doNotDrop, false);
  document.documentElement.addEventListener("drop", doNotDrop, false);

  MYFORM.addEventListener("submit", speicherKontakt);
  anzeigeButton.addEventListener("click", zeigeListe);
})();
