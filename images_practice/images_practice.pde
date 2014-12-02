PImage juuzou;

void setup() {
  size(800, 600);
  //initialize image
  juuzou = loadImage("juuzou2.png");
  
}

void draw() {
  background(0);
  image(juuzou, mouseX, mouseY, juuzou.width, juuzou.height);
}
