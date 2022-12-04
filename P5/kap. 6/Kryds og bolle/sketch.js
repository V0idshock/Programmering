let playerSymbols = ['X','O']
let posX, posY;
let gameSize = 50;
let currentPlayer = true;
let game = [
  ['X','',''],
  ['','X',''],
  ['','','X']
]

function setup() {
  createCanvas(windowWidth,windowHeight);
  background(200);
  posX = width/2;
  posY = height/2;
  console.log("created game");
}

function draw() {
  drawGame(game, posX, posY, gameSize, color(0,0,0), color(255,0,255));
}

function drawGame(board, X, Y, size, color1, color2) {
  textSize(size);
  rectMode(CENTER);
  textAlign(CENTER,CENTER);
  fill(color1);
  square(X+size, Y+size-2.5,size*3+10);
  for(let y = 0; y < 3; y++){
    for(let x = 0; x < 3; x++){
      fill(color2);
      square(X+x*size, Y+y*size-2,size-5);
      fill(color1);
      text(board[y][x], X+x*size, Y+y*size);
    }
  }
}

function mouseMoved(){

}

function mousePressed(){
  console.log("mouse was clicked");
  if(mouseButton === LEFT){
    console.log("mouse button was left");
    for(let y = 0; y < 3; y++){
      for(let x = 0; x < 3; x++){
        if(insideSquare(mouseX, mouseY,posX+x*gameSize, posY+y*gameSize, (gameSize-5)/2)){
          game[y][x] = playerSymbols[int(currentPlayer)];
          currentPlayer = !currentPlayer;
          y = 3; // to break outer loop
          break;
        }
        else{ console.log("not in " + x + "" + y);}
      }
    }
  }
}

function insideSquare(x1,y1,x2,y2,bSize) {
  console.log("testing boundry");
  if((x1<x2+bSize && x1>x2-bSize) && (y1<y2+bSize && y1>y2-bSize))
  { return true; }
  else{ return false; }
}