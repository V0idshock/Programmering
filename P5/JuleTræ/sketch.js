kree = [];
function setup() {
  createCanvas(windowWidth, windowHeight);
  translate(width/2, height/2);
  for(let i = 0; i < 50; i++) {
    kree.push(new Tree(0,200,100,200,0,3));
  }
}

function draw() {
  translate(width/2, height/2);
  background(220);
  for(let i = 0; i < kree.length; i++) {
    kree[i].move(10);
    kree[i].draw();
  }
}

class Tree {
  constructor(X,Y,W,H,Ratio,Amount) {
    this.x = X;
    this.y = Y;
    this.width = W;
    this.height = H;
    this.ratio = Ratio;
    this.amount = Amount;
  }

  draw() {
    strokeWeight(3);
    stroke(0,80,0);
    fill(120,60,10);
    rect(this.x-this.width/10,this.y,this.width/10*2,this.height/10);
    fill(0,100,0);
    for(let i = 0; i < this.amount; i++) {
      triangle(this.x-this.width, this.y-(i*20*this.height/50), this.x+this.width,this.y-(i*20*this.height/50),this.x,this.y-this.height-(i*20*this.height/50));
    }
  }

  move(Speed) {
    this.x += random(-Speed, Speed);
    this.y += random(-Speed, Speed);
  }
}