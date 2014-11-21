PVector loc;
PVector vel;
PVector acc;

int sz = 50;

void setup(){
  size (600,600);
  //initialize location variables
  locx = width/2;
  locy = height/2;
  
  //initialize velocity
  velx = random(-1,1);
  vely = random(-1,1);
  //keep velocity constrained between -8, 8
  constrain(velx, -8, 8);
  constrain(vely, -8, 8);
  
  //initialize acceleration
  accx = .00007;
  accy = .000006;
}

void draw(){
  //velocity increases by acceleration
  velx += accx;
  vely += accy;
  //location increases with velocity
  locx += velx;
  locy += vely;
  
  ellipse(locx, locy, sz,sz);
  
  if (locx - sz/2 > width){
    locx = -sz/2;
  }
  if(locx + sz/2 < 0){
    locx = width;
  }
  if (locy +sz/2 > height){
    locy = -sz/2;
  }
  if (locy - sz/2 < 0){
    locy = height;
  }
}
