//gravity ball
float x, y,sz, velX,velY, gravity;


void setup(){
  size(600,600);
  x = width/2;        //set x value equal to half the width
  y = height*.1;      //set y value equal to .1 times the height
  sz = 50;            
  velX = 0;          // set velX equal to zero
  velY = 0;          //set velY equal to zero
  gravity = 1;       // set the value of gravity (acceleration) to 1
  frameRate(100);
}

void draw(){
  background(0);
  ellipse(x,y,sz,sz);    //draw ellipse
  velY += gravity;       //set velY equal to gravity
  x += velX;
  y += velY;
  
  if(y+sz/2 > height){      //if the ball is greater than the bottom of the screen...
    y = height - sz/2;      //...y is equal to height minus half the size of the radius
    velY = -abs(velY) * .9;    //set velY equal to the negative abs of velY (to change direction) and then multiply by .9 to decrease the value
}
  
}
