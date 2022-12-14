
boolean up = false;
boolean down = false;
boolean left = false;
boolean right = false;

void keyPressed() {
  WASD(key, true);
}

void keyReleased() {
  WASD(key, false);
} 

void WASD(char KEY, boolean state) {
  if(KEY == 'w' || KEY == 'W') { up = state; }
  else if(KEY == 's' || KEY == 'S') { down = state; }
  else if(KEY == 'a' || KEY == 'A') { left = state; }
  else if(KEY == 'd' || KEY == 'D') { right = state; }
}

void healthBar(float X, float Y, float H, float MAX) {
  rectMode(CENTER);
  noStroke();
  fill(0);
  rect(X,Y,30,10);
  fill(255,0,0);
  rect(X+15*((H/MAX)-1),Y,(H/MAX)*30,7);
}
