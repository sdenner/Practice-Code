GravityBall[] oyea = new GravityBall [100];

void setup() {
  size(800, 600);
  for (int i = 0; i <oyea.length; i++) {
    oyea[i] = new GravityBall();
  }
}
  void draw() {
    background(0);
    for (int i = 0; i < oyea.length; i++) {
      oyea[i].display();
      oyea[i].move();
      oyea[i].bounce();
    }
  }


    class GravityBall {
      PVector loc, vel, acc;
      float sz;

      GravityBall() {
        loc = new PVector (random(sz, width-sz), random(height/2)); //do it like this so that the balls dont look like one ball when its drawn
        vel = new PVector (0, 0);
        acc = new PVector(0, .1);
        sz = 50;
      }

      void display() {
        ellipse(loc.x, loc.y, sz, sz);
      }

      void move() {
        vel.add(acc);
        loc.add(vel);
      }

      void bounce() {
        if (loc.y > height - sz/2) {
          loc.y = height-sz/2;
          vel.y = -abs(vel.y);
        }
      }
    }

