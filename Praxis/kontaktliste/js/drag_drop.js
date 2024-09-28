() => {
    "use strict";

    const ABLAGE = document.getElementById("ablage");
    const intLimit = 200;

    const showPicture = evt => {
        // ABLAGE.style.backgroundImage = `url(${evt.target.result})`;
        let img = document.createElement("img");
        img.src = evt.target.result;
        ABLAGE.appendChild(img);
    };

    
    const handleError = evt => {
        console.log(evt.target.error);
    };

    
    const handleDrop = evt => {
        // console.log(evt.dataTransfer.files[0]);
        let objFile = evt.dataTransfer.files[0];
        switch (objFile.type) {
            case "image/jpeg":
            case "image/png":
            case "image/gif":
            case "image/svg+xml":
                // Datenmenge limitieren
                if (objFile.size / 1024 > intLimit) {
                    return alert(`Die Bildgröße darf nicht größer als ${intLimit} KiB sein.`);
                }

                // Bild wird in den Bildspeicher geladen
                let reader = new FileReader();
                reader.addEventListener('load', showPicture);
                reader.addEventListener('error', handleError);
                reader.readAsDataURL(objFile);
                break;
            default:
                alert('Dieser Dateityp wird nicht unterstützt.');
        }
    };

    const doNotDrop = evt => {
        evt.preventDefault();
    };

    ABLAGE.addEventListener("drop", handleDrop, false);
    document.documentElement.addEventListener("dragover", doNotDrop, false);
    document.documentElement.addEventListener("drop", doNotDrop, false);
};
