PVector loc;
PVector vel;
PVector acc;

int sz = 50;

void setup(){
  size (600,600);
  
  colorMode(HSB, 360, 100, 100, 100);
  
  //initialize location variables
  loc = new PVector(width/2,height/2);
  
  //initialize velocity
  vel = new PVector(0,0);

  
  //initialize acceleration
  acc = new PVector(random(-.1, .1), random(-.1,.1));
}

void draw(){
 
  acc.set(random(-.1,.1), random(-.1,.1));
  
  fill(frameCount%360, 100, 100);
  noStroke();

  //add acceleration to velocity
  vel.add(acc);


  //limit velocity to avoid going uncontrollably fast
  vel.limit(5);


  //add velocity to location
  loc.add(vel);
  
  ellipse(loc.x, loc.y, sz,sz);
  
  if (loc.x - sz/2 > width){
    loc.x = -sz/2;
  }
  if(loc.x + sz/2 < 0){
    loc.x = width + sz/2;
  }
  if (loc.y - sz/2 > height){
    loc.y = -sz/2;
  }
  if (loc.y + sz/2 < 0){
    loc.y = height + sz/2;
  }
}
