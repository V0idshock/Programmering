int cols,rows;
int scl = 150;
int w = 12000;
int h = 9000;

float flying;

float[][] terrain;

void setup(){
  //size(600,600,P3D);
  fullScreen(P3D);
  noCursor();
  cols = w / scl;
  rows = h / scl;
  terrain = new float[cols][rows];
}

void draw(){
  float rotation = map(mouseX, 0, width, PI,-PI);
  flying -= 0.1;
    float yoff = flying;
  for(int y = 0; y < rows; y++){
    float xoff = 0;
    for(int x = 0; x < cols; x++){
      terrain[x][y] = noise(xoff,yoff);
      xoff += 0.2;
    }
    yoff += 0.2;
  }
  
  background(120,120,255);
  //noStroke();
  stroke(0);
  
  translate(width/2,height/2,1000);
  rotateX(map(mouseY, 0, height, PI, 0));
  rotateZ(rotation);
  translate(-w/2,-h/2,-1000);
  
  for(int y = 0; y < rows -1; y++){
    beginShape(TRIANGLE_STRIP);
   for(int x = 0; x < cols; x++){
     float P = terrain[x][y]*255;
      if(P>190){
        fill(255);
      }
      else if(P > 120 && P < 190){
        fill(150);
      }
      else if(P > 45 && P < 120){
        fill(100,155,100);
      }
      else if(P > 40 && P < 45){
        fill(255,255,150);
      }
      else
      fill(0,0,100);
     vertex(x*scl, y*scl, map(terrain[x][y],0,1,-1000,1000));
     vertex(x*scl, (y+1)*scl, map(terrain[x][y+1],0,1,-1000,1000));
     //rect(x*scl,y*scl,scl,scl);
   }
   endShape();
  }
}
