Stock stock;
float timer;

void setup() {
  stock = new Stock();
  timer = frameCount + 3 * frameRate;
  size(800,800);
}

void draw() {
  timer--;
  if(timer < frameCount) {
  background(220);
  stock.updatePrice(random(0,height));
  drawStock(stock.pastPrices, 1);
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

void drawStock(FloatList PASTPRICES, float PRICE) {
  for(int i = 1; i < PASTPRICES.size(); i++){
    strokeWeight(5);
    line((width/50)*(i-1),PASTPRICES.get(i-1),(width/50)*i,PASTPRICES.get(i));
  }
}
