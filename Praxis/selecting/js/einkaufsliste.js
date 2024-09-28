(() => {
  "use strict";
  /* Referenzen auf Bedienelemente */
  const ITEM = document.getElementById("item");
  const EINKAUFSLISTE = document.getElementById("einkaufsliste");

  /* Funktionsdeklarationen */
  const enterPressed = (evt) => {
    if (evt.keyCode === 13) {
      enterItem();
    }
  };

  const enterItem = (evt) => {
    let str = ITEM.value.trim();
    if (str.length > 0) addListItem(str);
  };

  const addListItem = (strItem) => {
    let nTxt = document.createTextNode(strItem);
    let nLi = document.createElement("li");
    nLi.appendChild(nTxt);
    EINKAUFSLISTE.appendChild(nLi);
    nLi.addEventListener("click", selectItem);
    ITEM.value = "";
    ITEM.focus();
  };

  const selectItem = (evt) => {
    evt.target.classList.toggle("markiert");
  };

  const deleteItem = (evt) => {
    let markierteItems = document.querySelectorAll("li.markiert");
    markierteItems.forEach((mItem) => {
      /* removeChild() oder remove() 
        mItem.parentNode.removeChild(mItem);
        */
      mItem.removeEventListener('click', selectItem); 
      mItem.remove();
    });
  };

  const moveUp = (evt) => {
    let markierteItems = document.querySelectorAll("li.markiert");
    markierteItems.forEach((mItem) => {
      if (
        mItem !== mItem.parentNode.firstElementChild &&
        !mItem.previousElementSibling.classList.contains("markiert")
      ) {
        mItem.previousElementSibling.before(mItem);
      }
    });
  };

  const moveDown = (evt) => {
    let markierteItems = document.querySelectorAll("li.markiert");
    let reverseList = new Array(...markierteItems).reverse();
    reverseList.forEach((mItem) => {
      if (
        mItem !== mItem.parentNode.lastElementChild &&
        !mItem.nextElementSibling.classList.contains("markiert")
      ) {
        mItem.nextElementSibling.after(mItem);
      }
    });
  };

  const sortList = (evt) => {
    let items = new Array();
    EINKAUFSLISTE.childNodes.forEach((n)=>{
      // console.log(n.firstChild.nodeValue, n.innerText, n.textContent);
      let txt = n.textContent;
      if( ! items.includes(txt)) { items.push(txt); }
    } );
    items.sort();
    if(evt.target.id === 'sortdesc') { items.reverse(); }
    leereEinkaufsListe();
    items.forEach((item) => {
      addListItem(item);
    });
  };

  const speicherListe = (evt) => {
    let alteListe = localStorage.getItem('einkaufsliste');
    if(
      ! EINKAUFSLISTE.hasChildNodes() ||
      ( alteListe && 
        ! confirm('Vorhandene Liste im Speicher überschreiben?'))
      ){
          return;
    }
    let itemsToStore = new Array();
    EINKAUFSLISTE.childNodes.forEach((n)=>{
      itemsToStore.push(n.textContent);
    })   
    localStorage.setItem('einkaufsliste', JSON.stringify(itemsToStore));
  };

  const ladeListe = (evt) => {
    let listeAusSpeicher = localStorage.getItem('einkaufsliste');
    if( ! listeAusSpeicher || 
      (EINKAUFSLISTE.hasChildNodes() &&
      ! confirm('Möchten Sie die angezeigte Liste mit Daten aus dem Speicher überschreiben?'))
    ) {
      return;
    }
    leereEinkaufsListe();
    let itemsToShow = JSON.parse(listeAusSpeicher);
    itemsToShow.forEach((item)=>{
      addListItem(item);
    });
  };

  const leereListe = (evt) => {
    if((EINKAUFSLISTE.hasChildNodes() || localStorage.getItem('einkaufsliste'))
      && ! confirm('Angezeigte Liste und Liste im Speicher löschen?')
    ) {
      return;
    }
    localStorage.removeItem('einkaufsliste');
    leereEinkaufsListe();
  };

  const leereEinkaufsListe = () => {
    while(EINKAUFSLISTE.hasChildNodes()) {
      let n = EINKAUFSLISTE.firstChild;
      n.removeEventListener('click', selectItem);
      n.remove();
    }
  };

  /* EventListener zuweisen */
  ITEM.addEventListener("keydown", enterPressed);
  document.getElementById("enter").addEventListener("click", enterItem);
  document.getElementById("delete").addEventListener("click", deleteItem);
  document.getElementById("up").addEventListener("click", moveUp);
  document.getElementById("down").addEventListener("click", moveDown);
  document.getElementById("sortasc").addEventListener("click", sortList);
  document.getElementById("sortdesc").addEventListener("click", sortList);
  document.getElementById("store").addEventListener("click", speicherListe);
  document.getElementById("load").addEventListener("click", ladeListe);
  document.getElementById("deleteall").addEventListener("click", leereListe);
})();
