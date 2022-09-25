
kat=[]

function setup() {
  createCanvas(1000, 1000);
  kat.push(new Cat(200,200,"Mittens"))
  kat.push(new Cat(500,50,"Tom"))
  kat.push(new Cat(100,500,"Emil"))
  kat.push(new Cat(40,40,"Salem"))
  kat.push(new Cat(700,600,"Lucifax"))
  kat.push(new Cat(200,400,"Garfield"))
  kat.push(new Cat(700,300,"Felix"))
  kat.push(new Cat(300,600,"Bigglesworth"))
  kat.push(new Cat(300, 400, "Preben"))
  
  let i = 0;
  while(i < kat.length){
    kat[i].display()
    i++
  }  
}

class Cat
{
  constructor(x,y,name)
  {     
    this.x = x 
    this.y = y
    this.name = name
  }

  display(){
    noStroke();
    fill(100);
    textAlign(CENTER)
    text(this.name,this.x,this.y-20)
    rectMode(CENTER)
    rect(this.x, this.y, 25,25);
  }

  move(){
    this.x += random(-10,10)
    this.y += random(-10,10)


  }
}

function draw() {
  background(200);
  let i = 0;
  while(i < kat.length){
    kat[i].move()
    kat[i].display()
    i++
  }  

}
