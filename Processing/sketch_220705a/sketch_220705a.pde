// Image size
int size_x = 500;
int size_y = 500;

void setup() {
  size(500, 500);
  frameRate(50);
}

void draw() {
    noStroke();
  
  for(int x = 0; x < size_x; x++) {
   for(int y = 0; y < size_y; y++) {
     float X = cos(HALF_PI / size_x * x );
     float Z = sin(HALF_PI / size_x * x );
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
