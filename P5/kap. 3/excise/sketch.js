
function setup() {
  createCanvas(800, 800, WEBGL);
}

function draw() {
  background(200);
  noStroke();
  colorMode(HSB);
  fill(127.5+cos(radians(frameCount))*127.5,150,255);
  translate(-width/2,-height/2,0);
  translate(mouseX + cos(radians(frameCount))*100,mouseY + sin(radians(frameCount))*100,0);
  rotateX(frameCount/100);
  rotateY(frameCount/100);
box(100,100,100);
}