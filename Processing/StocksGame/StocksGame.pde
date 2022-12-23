Stock stock;
float timer = 0;

void setup() {
  stock = new Stock();
  size(800,800);
}

void draw() {
  background(220);
  drawStock(stock.pastPrices.copy(),stock.price,mouseX,mouseY,width/2,height/2,color(0,255,0),0);
  timer--;
  if(timer < frameCount) {
  stock.updatePrice(random(0,100));
  timer = frameCount + 3 * frameRate;
  }
}

class Stock {
  FloatList pastPrices = new FloatList();
  float price;
  Stock() {
    
  }
  void updatePrice(float NEWPRICE){
    this.pastPrices.push(this.price);
    this.price = NEWPRICE;
    if(this.pastPrices.size() > 50){
      this.pastPrices.remove(0);
    }
  }
}

void drawStock(FloatList PASTPRICES, float PRICE, float X, float Y, float W, float H, color LINECOLOR, color BACKGROUNDCOLOR) {
  PASTPRICES.push(PRICE);
  strokeWeight(5);
  fill(BACKGROUNDCOLOR);
  rect(X,Y,W,H);
  stroke(LINECOLOR);
  for(int i = 1; i < PASTPRICES.size(); i++){
    line((W/50)*(i-1)+X,
          map(PASTPRICES.get(i-1),0,100,0,H)+Y,
         (W/50)*i+X,
          map(PASTPRICES.get(i),0,100,0,H)+Y);
  }
}
