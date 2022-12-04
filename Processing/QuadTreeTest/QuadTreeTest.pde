class Point {
  float x,y;
  Point(float X, float Y){
    this.x = X;
    this.y = Y;
  }
}

class Rectangle {
  float x,y,w,h;
  Rectangle(float X, float Y, float W, float H) {
    this.x = X;
    this.y = Y;
    this.w = W;
    this.h = H;
  }
  
  boolean contains(Point point) {
    return (point.x >= x - w && point.x <= x + w && point.y >= y - h && point.y <= y + h);
  }
}

class QuadTree {
  Rectangle boundary;
  int capacity;
  ArrayList<Point> points = new ArrayList<Point>();
  boolean divided = false;
  QuadTree(Rectangle Boundry, int n) {
    this.boundary = Boundry;
    this.capacity = n;
  }
  
  QuadTree northeast;
  QuadTree northwest;
  QuadTree southeast;
  QuadTree southwest;
  
  void subdivide() {
    float x = this.boundary.x;
    float y = this.boundary.y;
    float w = this.boundary.w;
    float h = this. boundary.h;
    Rectangle ne = new Rectangle(x+w/2, y-h/2, w/2, h/2);
    this.northeast = new QuadTree(ne, capacity);
    Rectangle nw = new Rectangle(x-w/2, y-h/2, w/2, h/2);
    this.northwest = new QuadTree(nw, capacity);
    Rectangle se = new Rectangle(x+w/2, y+h/2, w/2, h/2);
    this.southeast = new QuadTree(se, capacity);
    Rectangle sw = new Rectangle(x-w/2, y+h/2, w/2, h/2);
    this.southwest = new QuadTree(sw, capacity);
    divided = true;
  }
  
  boolean insert(Point point){
    
    if(!boundary.contains(point)) {
      return false;
    }
    
    if(this.points.size() < this.capacity) {
      this.points.add(point);
      return true;
    } else {
      if(!divided) {
        this.subdivide();
        divided = true;
      }
      if(northeast.insert(point)) {return true;
      } else if(northwest.insert(point)) {return true;
      } else if(southeast.insert(point)) {return true;
      } else if(southwest.insert(point)) {return true;
      }
      else {return false;}
    }
  }
  
  void show() {
    stroke(0);
    strokeWeight(1);
    noFill();
    rectMode(CENTER);
    rect(boundary.x,boundary.y,boundary.w*2,boundary.h*2);
    if(divided) {
      this.northeast.show();
      this.northwest.show();
      this.southeast.show();
      this.southwest.show();
    }
    for (Point p : points) {
      strokeWeight(4);
      point(p.x,p.y);
    }
  }
}

void setup() {
  size(400,400);
  Rectangle boundary = new Rectangle(200,200,200,200);
  QuadTree qt = new QuadTree(boundary, 1);
  
  for(int i = 0; i < 50; i++) {
    Point p = new Point(random(width), random(height));
    qt.insert(p);
  }
  qt.show();
}
