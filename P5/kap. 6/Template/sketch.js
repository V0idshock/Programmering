let a = 1,b = 0,c = 5;
let w,h;
function setup() {
  createCanvas(windowWidth,windowHeight);
  w = width, h = height;
  translate(w/2, h/2);
  strokeWeight(1);
  line(-w/2,0,w/2,0);
  line(0,-h/2,0,h/2);
  a *= 0.001;
  b *= 0.001;
  c *= -10;
  stroke(255,0,0);
  drawQuadraticLine(a,b,c,7);
  drawRoots(a,b,d(a,b,c));
}

function drawQuadraticLine(A, B, C, Points) {
  strokeWeight(2);
  let past = createVector(-w/2,yQuadratic(-w/2,A,B,C));
  for (let i = -w/2; i < w; i += w/(Points-1)) {
    let now = createVector(i,yQuadratic(i,A,B,C));
    line(past.x,-past.y,now.x,-now.y);
    past = now;
  }
}

function drawRoots(A,B,D) {;
  if(D >= 0) {
  stroke(0,255,0);
  strokeWeight(5)
  point((-B+sqrt(D))/(2*A),0);
  point((-B-sqrt(D))/(2*A),0);
  }
}

function yQuadratic(x,A,B,C) {
  return A*x*x+B*x+C;
}

function d(A,B,C) {
return B*B-4*A*C;
}