int count = 100;
//declare loc, vel, acc
PVector[]loc = new PVector[count];
PVector[] vel = new PVector[count];
PVector[] acc = new PVector[count];

float[] sz = new float[count];
float[] mass = new float[count];
int minDiam = 10;
int maxDiam = 60;

void setup(){
  size(800,600);
  for (int i = 0; i < count; i++) {
    sz[i] = random(minDiam, maxDiam);
    loc[i] = new PVector(random(sz[i], width-sz[i]),random(sz[i],height-sz[i]));
    vel[i] = PVector.random2D();
    acc[i] = new PVector(0,0);
    mass[i] = map(sz[i], minDiam, maxDiam, .1, 1.5);
  }

}

void draw(){
  background(0);
  
  for(int i = 0; i<count; i++){
    vel[i].add(acc[i]);            //move the balls
    loc[i].add(vel[i]);


  
  //check to see if circles are touching
for (int j = 0; j < count; j++){
  if(i!=j){
    if(loc[i].dist(loc[j]) < sz[i]/2 + sz[j]/2) {
      print("COLLISION DETECTED   ");
      vel[i] = PVector.sub(loc[i], loc[j]);
      vel[i].normalize();
      vel[i].div(mass[i]);
    }
    }
  }
  
  //draw the balls
  ellipse(loc[i].x, loc[i].y, sz[i], sz[i]);
  
  //bounce ball around screen
  if(loc[i].x + sz[i]/2 > width || loc[i].x - sz[i]/2 < 0) {
    vel[i].x *= -1;
  }
  if(loc[i].y +sz[i]/2 > height || loc[i].y - sz[i]/2 < 0){
    vel[i].y *= -1;
  }
  }
}

void mouseReleased() {
  loc[0].set(mouseX, mouseY);
}
  
  

  
