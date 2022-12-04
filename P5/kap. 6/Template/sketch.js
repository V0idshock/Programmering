
function setup() {
  createCanvas(400, 400);
  background(200);
  sum(3.2,5);
}


function sum(a, b){
  if(typeof a == "number" && typeof b == "number"){
    let c = a+b;
    text(c,width/2,height/2);
  }
}
