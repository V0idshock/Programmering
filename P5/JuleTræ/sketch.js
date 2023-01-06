kree = [];
function setup() {
  createCanvas(windowWidth, windowHeight);
  for(let i = 0; i < 1; i++) {
    kree.push(new Tree(0,200,100,150,0,3));
  }
}

function draw() {
  translate(mouseX, mouseY);
  background(220);
  for(let i = 0; i < kree.length; i++) {
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
    this.baubles = [];
    this.branches = [];
    for (let i = 0; i < Amount; i++) {
      this.branches.push(new Branch(this.x, this.y-(this.height*i/5),this.width,this.height));
      colorMode(HSB);
      for(let n = 0; n < 3; n++){
        let H = random(this.branches[i].h);
        let W = this.branches[i].w*(1-H/this.branches[i].h);
        this.baubles.push(new Bauble(this.branches[i].x + this.branches[i].w/2 + random(-W/2 , W/2), this.branches[i].y - H,10,color(random(255),255,100)));
      }
      colorMode(RGB);
    }
  }

  draw() {
    noStroke();
    fill(120,60,10);
    rectMode(CENTER);
    rect(this.x + this.width/2, this.y+10, 20,20);
    for (let i = 0; i < this.branches.length; i++) {
      this.branches[i].draw();
    }
    for (let i = 0; i < this.baubles.length; i++) {
      this.baubles[i].draw();
    }
  }
}

class decoration {
  constructor(X,Y){
    this.x = X;
    this.y = Y;
  }
}

class Bauble extends decoration{
  constructor(X,Y,S, COLOR) {
    super(X,Y);
    this.Color = COLOR;
    this.size = S;
  }

  draw() {
    ellipseMode(CENTER);
    fill(this.Color)
    circle(this.x,this.y,this.size);
  }

}

class Branch {
  constructor(X,Y,W,H) {
    this.x = X;
    this.y = Y;
    this.w = W;
    this.h = H;
  }

  draw() {
    strokeWeight(1);
    fill(0,100,0);
    triangle(this.x, this.y, this.x + this.w, this.y, this.x + (this.w / 2), this.y-this.h);
  }
}