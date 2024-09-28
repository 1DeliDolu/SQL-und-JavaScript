(() => {
  "use strict";
  //let bla ="bla nla bla ";
  let elementListen = document.querySelectorAll("main>ul>li");
  const toggleMarkiert = (evr) => {
    {
      evr.target.classList.toggle("markiert");
    }
  };

  elementListen.forEach((element) => {
    element.addEventListener("click", toggleMarkiert);
    //$('main>ul>li').bind("click", toggleMarkiert);
  });
})();

/* ich wolle eine array mit mehreren Name. Ich wolte diese namen mit forEach ausgeben.*/
(() => {
  "use strict";
  let elementListen = ["musik", "kochen", "lesen", "singen"]; // Array mit mehreren Namen
  var strrHtml = "<ul>";
  elementListen.forEach((element) => {
    strrHtml += "<li>" + element + "</li>";
  });
  strrHtml += "</ul>";
  document.getElementById("botto").innerHTML = strrHtml;
})();

// Array mit mehreren Objekten
let codeLayers = [
  ["HTML", "Structure"],
  ["CSS", "Presentation"],
  ["JavaScript", "Behavior/UX"]
];

//for loop/schleife
let strHtml = "<dl>";
for (let i = 0; i < codelLayer.length; i++) {
  strHtml +=
    "<dt>" + codelLayer[i][0] + "</dt><dd>" + codelLayer[i][1] + "</dd>";
}
strHtml += "</dl>";
document.getElementById("bottom").innerHTML = strHtml;

// Template Literals
let strHtmll = "<dl>";
for (let i = 0; i < codelLayer.length; i++) {
  strHtmll += `<dt>${codelLayer[i][0]}</dt><dd>${codelLayer[i][1]}</dd>`;
}
strHtmll += "</dl>";
document.getElementById("bottom").innerHTML = strHtmll;

/*//forEach/schleife
codelLayer.forEach(element => {
  document.getElementById("bott").innerHTML += "<dl><dt>" + element[0] + "</dt><dd>" + element[1] + "</dd></dl>";
})

// Template Literals
codelLayer.forEach(element => {
  document.getElementById("bot").innerHTML += `<dl><dt>${element[0]}</dt><dd>${element[1]}</dd></dl>`;
})*/
