class entity{
  PVector pos;
  float r;
  
  // constructors
  entity(float X, float Y){ pos = new PVector(X,Y); }
  entity(){ pos = new PVector(random(0,width),random(0,height)); }
}

class player extends entity{
    float MAXHEALTH = 100;
    float HEALTH = 100;
    PVector vel = new PVector(0,0);
    float speed = 10;
  player(float X, float Y){ super(X,Y); }
  player(){ super(); }
  
    void update() {
    if(up == true) {this.vel.y -= 2;}
    if(down == true) {this.vel.y +=2;}
    if(left == true) {this.vel.x -=2;}
    if(right == true) {this.vel.x +=2;}
    this.pos.add(this.vel.mult(0.8));
    if(this.vel.mag() > speed) { this.vel.setMag(speed); }
    healthBar(this.pos.x,this.pos.y+30,HEALTH,MAXHEALTH);
  }
  
    void show() {
    stroke(0);
    strokeWeight(10);
    point(pos.x,pos.y);
  }
}



class enemy extends entity{
  PVector objective;
  
  // constructors
  enemy(float X, float Y){ super(X,Y); objective = new PVector(X,Y); }
  enemy(){ objective = pos.copy(); }
  
  // direction and movement functions
  void moveWardsPoint(PVector target, float Speed) { pos.add(target.copy().sub(pos).setMag(Speed)); }
  void pointWardsPoint(PVector target) { r = target.copy().sub(pos).heading(); }
  void moveWardsAngle(float Angle, float Speed){ pos.add(PVector.fromAngle(Angle).mult(Speed)); }
  void shoot(PVector target) { Projectiles.add( new projectile(pos,target.copy().sub(pos).heading())); }
  // display function
  void display(){ pushMatrix(); translate(pos.x,pos.y); rotate(r); drawEnemy(); popMatrix();
 }
}

class projectile extends entity{
  projectile(PVector POS, float R){ super(POS.x,POS.y); r = R;}
  
  void move() { pos.add(PVector.fromAngle(r).mult(20)); } 
  void display() { fill(0,255,0); circle(pos.x,pos.y,10); }
  
  boolean checkhit(player PLAYER) {
    if(dist(PLAYER.pos.x,PLAYER.pos.y, this.pos.x, this.pos.y) < 10) {
      PLAYER.HEALTH -= 1;
      return true;
    }
    else{
    return ((pos.x < 0 || pos.x > width) || (pos.y < 0 || pos.y > height));
    }
  }
}

void drawEnemy(){
  strokeWeight(1);
    rectMode(CENTER);
    ellipseMode(CENTER);
    fill(255,0,0);
    square(0,0,20);
    circle(20,0,5);
}
