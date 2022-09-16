

let cat;

class Cat{
  constructor(x, y){
this.xPos = x;
this.yPos = y;
  }
 display() {
  circle(this.xPos, this.yPos, 50)
 }
}

function setup() {
  createCanvas(400, 400);
  cat = new Cat(200, 200);
}


function draw() {
  background(220);
  cat.display();
}

