ArrayList<Stars> Galaxy = new ArrayList<Stars>();
//new PImage


void setup(){
  size(600,600);
}

void draw() {
  if (mousePressed) {
    Galaxy.add(new Stars());
  }
  background(0);
  Galaxy.add (new Stars() );
  for (int i = Galaxy.size() - 1; i >= 0; i--) {
    Stars s  = Galaxy.get(i);
    s.display();
    s.move();
}
//  if (s.
}

class Stars {
  PVector loc, vel;
  float sz;
  
  Stars() {
    sz = random(5,20);
    loc = new PVector(mouseX, mouseY);
    vel = new PVector(random(-3,3), random(-3,3));
  }
  
  void display() {
    ellipse(loc.x, loc.y, sz, sz);
  }
  
  void move() {
    loc.add(vel);
  }
}
