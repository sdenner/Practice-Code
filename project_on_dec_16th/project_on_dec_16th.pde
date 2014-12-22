//shooting stars and stationary flickering stars

ArrayList<Fountain> raindrops = new ArrayList <Fountain>(); 
PImage star;


void setup() {
  noStroke();
  colorMode(HSB, 360, 100, 100, 100);
  size(600, 600);
  star = loadImage("star-8-512.jpg");
  
}

void draw() {
  background(0);
  raindrops.add(new Fountain() );
  image(star);

  for (int i = 0; i < raindrops.size (); i++) {
    Fountain f = raindrops.get(i);
    f.display();
    f.move();
    f.bounce();
  }

}

class Fountain {
  PVector loc, vel, acc;
  float sz;

  Fountain() {
    loc = new PVector(width/2, height*.1);
    vel = new PVector(random(-3, 3), random(-3, 0));
    acc = new PVector(0, .1);
    sz = random(5, 30);
  }
  void display() {
    ellipse(loc.x, loc.y, sz, sz);
  }

  void move() {
    loc.add(vel);
    vel.add(acc);
  }


  void bounce() {

    if (loc.y+sz/2 > height) {
      loc.y = height-sz/2;      //bounces off bottom
      vel.y= -abs(vel.y) * .7;
    }
    if (loc.x + sz/2 > width) {
      loc.x = width-sz/2;        //bounces off of right side
      vel.x = -abs(vel.x) *.7;
    }
    if (loc.x - sz/2 < 0) {
      loc.x = 0+sz/2;            //bounces off of left side
      vel.x = abs(vel.x) *.7;
    }
  }
}

