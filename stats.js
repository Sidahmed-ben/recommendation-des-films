import { omk } from "./omk.js";

import { pa } from "./authParams.js";

let myOmk = new omk(pa);

myOmk.getUser((u) => {
  console.log(u);
});

function putAleaData(e, d) {
  let aleaData = {},
    propsRt = [];
  d["o:resource_template_property"].forEach((p) => {
    let prop = myOmk.getPropTerm(p["o:property"]["o:id"]);
    aleaData[prop] = "blabla";
  });
  myOmk.createRessource(aleaData);
}

function displayRT() {
  const resourceDiv = d3.select(".RT");
  resourceDiv.append("h4").text("Liste des Resource template");
  myOmk.getRT((u) => {
    let ulRT = resourceDiv.append("ul"),
      liRT = ulRT.selectAll("li").data(u).enter().append("li");
    liRT
      .append("a")
      .attr("href", (d) => d["@id"])
      .attr("target", "_blanck")
      .text((d) => d["o:label"]);
    liRT
      .append("button")
      .attr("type", "button")
      .attr("class", "btn btn-danger mx-3")
      .html('<i class="bi bi-shuffle"></i>')
      .on("click", putAleaData);
  });
}

displayRT();
