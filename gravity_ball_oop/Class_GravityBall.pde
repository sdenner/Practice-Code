PVector loc, vel, acc;
float sz;
float hue, sat, bright, alpha;

GravityBall() {
  sz = 50;
  loc = new PVector(random(sz, width-sz)random(height/2));
  vel = new PVector(0,0);
  acc = new PVector(0,.1);
  hue = random(360);
  sat = 100;
  bright = 100;
  alpha = 70;
}
