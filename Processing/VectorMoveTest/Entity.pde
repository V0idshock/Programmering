class entity{
  PVector pos;
  float r;
  
  // constructors
  entity(float X, float Y){ pos = new PVector(X,Y); }
  entity(){ pos = new PVector(random(0,width),random(0,height)); }
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
  void shoot() { Projectiles.add( new projectile(pos)); }
  // display function
  void display(){ pushMatrix(); translate(pos.x,pos.y); rotate(r); drawEnemy(); popMatrix();
 }
}

class projectile extends entity{
  projectile(PVector POS){ super(POS.x,POS.y); r = mouse.copy().sub(pos).heading(); }
  
  void move() { pos.add(PVector.fromAngle(r).mult(20)); }
  
  void display() {
    fill(0,255,0);
    circle(pos.x,pos.y,10);
  }
  
  boolean checkhit() {
    if(dist(mouse.x, mouse.y, pos.x, pos.y) < 10) {
      health -= 1;
      return true;
    }
    else{
    return ((pos.x < 0 || pos.x > width) || (pos.y < 0 || pos.y > height));
    }
  }
}
void drawEnemy(){
    rectMode(CENTER);
    ellipseMode(CENTER);
    fill(255,0,0);
    square(0,0,20);
    circle(20,0,5);
}
