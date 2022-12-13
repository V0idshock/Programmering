
Player player;
void setup() {
  size(1000, 1000);
  player = new Player(new PVector(width/2, height/2));
  frameRate(60);
}

void draw() {
  background(220);
  player.update();
  player.show();
}

class Player{
  float speed = 10;
  PVector pos;
  PVector vel = new PVector(0,0);
  Player(PVector POS) {
    pos = POS;
  }
  
  void show() {
    stroke(0);
    strokeWeight(10);
    point(pos.x,pos.y);
  }

  void update() {
    if(up == true) {this.vel.y -= 2;}
    if(down == true) {this.vel.y +=2;}
    if(left == true) {this.vel.x -=2;}
    if(right == true) {this.vel.x +=2;}
    this.pos.add(this.vel.mult(0.8));
    if(this.vel.mag() > speed) { this.vel.setMag(speed); }
    healthBar(this.pos.x,this.pos.y+30,1,4);
  }
}

void healthBar(float X, float Y, float H, float MAX) {
  rectMode(CENTER);
  noStroke();
  fill(0);
  rect(X,Y,30,10);
  fill(255,0,0);
  rect(X+15*((H/MAX)-1),Y,(H/MAX)*30,7);
}
