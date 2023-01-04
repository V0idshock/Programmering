Stock stock;
Stock stock2;
float timer = 0;

void setup() {
  stock = new Stock();
  stock2 = new Stock();
  size(800,800);
}

void draw() {
  background(220);
  drawStock(stock.pastPrices.copy(),stock.price,0,0,width/2,height/2,color(0,255,0),0);
  drawStock(stock2.pastPrices.copy(),stock2.price,0,height/2,width/2,height/2,color(0,255,0),0);
  timer--;
  if(timer < frameCount) {
  stock.updatePrice(random(0,100));
  stock2.updatePrice(random(0,100));
  timer = frameCount + 3 * frameRate;
  }
}

class Stock {
  String Name;
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
  strokeWeight(1);
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
