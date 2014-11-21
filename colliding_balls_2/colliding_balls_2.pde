//declare loc, vel, acc, mouse
PVector loc, vel, acc, mouse;
int sz = 50;

void setup(){
  size(800,600);
  //initialize variables
  loc = new PVector(width/2, height/2);
  vel = PVector.random2D();
  acc = new PVector(0,0);
  mouse = new PVector();
}

void draw(){
  
