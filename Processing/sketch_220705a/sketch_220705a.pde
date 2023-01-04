// Image size
int size_x = 800;
int size_y = 800;
float r = 0;

void setup() {
  size(800, 800);
  frameRate(50);
}

void draw() {
    noStroke();
    r += 0.01;
  
  for(int x = 0; x < size_x; x++) {
   for(int y = 0; y < size_y; y++) {
     float X = cos(HALF_PI / size_x * x + r);
     float Z = sin(HALF_PI / size_x * x + r);
     if(noise(X*6, Z*6, y*0.025) > 0.5){
       fill(255,255,150);
       if(noise(X*6, Z*6, y*0.025) > 0.55)
       fill(0,150,0);
       if(noise(X*6, Z*6, y*0.025) > 0.63)
       fill(100,100,100);
       if(noise(X*6, Z*6, y*0.025) > 0.75)
       fill(255);
       if(y > 470 || y < 30)
       fill(200,200,255);
     }
     else
     fill(0,0,150);
     square(x, y, 1);
   }
  }
}
