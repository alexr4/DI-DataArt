var data;

function preload() {
  let rows = 100;
  let srequest = "https://opendata.paris.fr/api/records/1.0/search/?dataset=les-arbres&rows=";
  let erequest = "&refine.arrondissement=PARIS+17E+ARRDT";
  data = loadJSON(srequest+rows+erequest);
}

function setup() {
  createCanvas(400, 400);
  console.log(data);
}

function draw() {
  background(220);
}
