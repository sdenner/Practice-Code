BouncyBall[] balls = new BouncyBall[200];
BlackHole h;

void setup(){
  size(800,600);
  colorMode(HSB, 360, 100,100,100);
  h = new BlackHole();
  for(int i = 0; i < balls.length; i++) {
    balls[i] = new BouncyBall(random(5,60), random(.1,10));
  }
}

void draw(){
  background(0, 0, 100);
  
  for (int i = 0; i< balls.length; i++) {
    h.consumes(balls[i]);
    balls[i].display();
    balls[i].isSuckedIn(h);
    balls[i].move();
    balls[i].wallBounce();
  }
  h.display();
}


class BouncyBall {
  PVector loc, vel, acc;
  float sz;
  float speed;
  float hue;
  
  BouncyBall(float tempsz, float tempspeed) {
    sz = tempsz;
    speed = tempspeed;
    loc = new PVector(random(sz, width-sz), random(sz, height-sz));
    vel = PVector.random2D();
    acc = new PVector();
    vel.setMag(speed);
    hue = random(360);
    
  }
  void display() {
    fill(hue, 100,100,100);
    ellipse(loc.x, loc.y, sz, sz);
    
  }
  
  void move() {
    vel.add(acc);
    loc.add(vel);
  }
  
  void wallBounce(){
    if (loc.x +sz/2 > width) {
      vel.x = -abs(vel.x);
    }
    if (loc.x - sz/2 <0) {
      vel.x = abs(vel.x);
    }
    if (loc.y + sz/2 > height) {
      vel.y = -abs(vel.y);
    }
    if (loc.y - sz/2 < 0) {
      vel.y = abs(vel.y);
    }
  }
  
  void collideWith (BouncyBall other){
    if (loc.dist(other.loc) < sz/2 + other.sz/2) {
      vel = PVector.sub(loc, other.loc);
      vel.setMag(speed);
    }
  }
  
  void goAway(){
    loc.set(width*10, height*10);
    vel.set(0,0);
  }
  
  void teleport() {
    loc.set(mouseX, mouseY);
    vel = PVector.random2D();
  }
  
  void isSuckedIn(BlackHole doom) {
    acc = PVector.sub(doom.loc, loc);
    acc.setMag(.1);
  }
}

class BlackHole {
  PVector loc;
  float sz;
  
  BlackHole(){
    loc = new PVector(random(width), random(height));
    sz = 5;
  }
  
  void display() {
    fill(0);
    ellipse(loc.x, loc.y, sz, sz);
  }
  
  void consumes(BouncyBall food){
    if(loc.dist(food.loc) < sz/2 + food.sz/2) {
      print("yum   ");
      food.teleport();
      sz+=food.sz/100;
      
    }
  }
}
