
int x=150;
int y=150;
double grav = 1.2;
double birdYVelocity = 0;

int pipeX=500;
int pipeY=-100;
int speed=5;
int score=0;
PImage back;
PImage pipeBottom;
PImage pipeTop;
PImage bird;
void setup(){
  size(500,500);
   back = loadImage("flappyBackground.jpg");
   back.resize(500,500);
   pipeBottom = loadImage("bottomPipe.png");
   pipeBottom.resize(100,300);
   pipeTop = loadImage("topPipe.png");
   pipeTop.resize(100,300);
   bird = loadImage("bird.png");
   bird.resize(70,70);
}

void draw(){
  
   background(back);
            image (pipeBottom,pipeX,pipeY+500);
            image (pipeTop,pipeX,pipeY);
            image (bird, x, y); 
  
  //background(#79CCD6);
//fill(#FFE75D);  
//stroke(#FFE75D);
//ellipse(x, y, 50, 50);

//stroke(#23A02C);
//fill(#23A02C);
//rect(pipeX, pipeY, 100, 300);
//rect(pipeX, pipeY+500, 100, 300);

if (pipeX>-100){
  pipeX-=speed;
}
else{
  pipeX=500;
  score++;
  pipeY+= random(250)-125;
  if(pipeY<-100){
   pipeY=-100; 
  }
  else if (pipeY>0){
    pipeY=0;
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
if (intersectsPipes()){
x=150;
y=150;
grav = 1.2;
birdYVelocity = 0;
pipeX=500;
pipeY=-100;
speed=5;
score=0;
}
textSize(32);
fill(#FFFFFF);
text("score: "+ score, 10, 32);

}


void keyPressed(){
  grav=1.2;
  birdYVelocity = 5;
}

boolean intersectsPipes() { 
         if (y < pipeY+300 && x+25 > pipeX && x+35 < (pipeX+100)){
            return true;     
          }
        else if (y> pipeY+450 && x+25 > pipeX && x+35 < (pipeX+100)) {
            return true; 
          }
        else if (y>450){
          return true;
        }
        else { return false; }
}
