
int x=150;
int y=150;
double grav = 1.2;
double birdYVelocity = 0;

int pipeX=500;
int pipeY=-100;
int speed=5;


void setup(){
  size(500,500);
  
}

void draw(){
  background(#79CCD6);
fill(#FFE75D); 
stroke(#FFE75D);
ellipse(x, y, 50, 50);

stroke(#23A02C);
fill(#23A02C);
rect(pipeX, pipeY, 100, 300);
rect(pipeX, pipeY+500, 100, 300);

if (pipeX>-100){
  pipeX-=speed;
}
else{
  pipeX=500;
  pipeY+= random(250)-125;
  if(pipeY<-100){
   pipeY=-100; 
  }
  else if (pipeY>10){
    pipeY=10;
  }
}
 
if (y<475){
  if(birdYVelocity>0){
y-=birdYVelocity; 
birdYVelocity-=0.2;
  }
  else{
y+=grav;
grav+=0.1;
  }
}

}
void mousePressed(){
  grav=1.2;
  birdYVelocity = 5;
}
