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
