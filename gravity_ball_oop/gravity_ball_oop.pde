//declare and initialize the GravityBall array
GravityBall[] g = new GravityBall[100];

void setup() {
  size(800,600);
  colorMode(HSB, 360, 100, 100, 100);
  for (int i = 0, i < g.length; i++) {
    g[i] = new GravityBall(map(i, 0, g.length, 0, width, 2*1+5);
  }
}

void draw() {
  background (0);
  for (int i = 0; i < g.length; i++) {
    g[i].display();
    g[i].move();
    g[i].bounce();
  }
}
