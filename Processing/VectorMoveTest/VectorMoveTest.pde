// The end of all
int timer = 0;
ArrayList<projectile> Projectiles = new ArrayList<projectile>();
enemy[] Enemies = new enemy[0];
player Player = new player();
PVector mouse = new PVector();
void setup() {
  fullScreen();
  for(int i = 0; i < 10; i++) { Enemies = (enemy[]) append(Enemies, new enemy()); }
}

void draw() {
  mouse.set(mouseX,mouseY);
  background(200);
  Player.update();
  Player.show();
  for(int i = 0; i < Enemies.length; i++){
    if(i%2==0){
    enemyWanderBehavior(Enemies[i],5,Player.pos);
    }
    else{
    enemyFollowBehavior(Enemies[i],Player.pos,5);
    }
    if (timer > 100) {
      Enemies[i].shoot(Player.pos);
      timer = 0;
    }
    timer++;
  }
  for (int i = Projectiles.size() - 1; i >= 0; i--) {
    projectile bullet = Projectiles.get(i);
    bullet.move();
    if (bullet.checkhit(Player)) { Projectiles.remove(i); }
    else { bullet.display(); }
  }
}



void enemyFollowBehavior(enemy subject, PVector target, float Speed) {
  if(subject.pos.dist(target) > 100){
    subject.moveWardsPoint(target,Speed);
  }
  else if(subject.pos.dist(target) < 50){
    subject.moveWardsPoint(target,-Speed);
  }
  subject.pointWardsPoint(target);
  subject.display();
}

void enemyWanderBehavior(enemy subject, float Speed, PVector target){ //<>//
if(subject.pos.dist(subject.objective) < 100){
  subject.objective.set(random(0,width),random(0,height));
}
subject.moveWardsPoint(subject.objective,Speed);
subject.pointWardsPoint(target);
subject.display();
}
