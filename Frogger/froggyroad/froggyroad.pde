int w = 800;
int h = 800;
int frogX = 400;
int frogY = 650;
int speed = 20;
int z = 5;
PImage back;
 PImage carLeft;
 PImage carRight;
 PImage frog;

car BeanMobile = new car(780, 430, 3);
car BananaMobile = new car(780, 310, 6);
car DuesenbergSJLAPhaeton = new car(780, 190, 5);

car MDX = new car(0, 250, -4);
car BMW = new car(0, 370, -8);

public class car{
int carX = 300;
int carY = 300;
int carspeed = 8;



public car(int x, int y, int z){
  carX = x;
  carY = y;
  carspeed = z;
}

int getX(){
  return carX;
}
int getY(){
  return carY;
}
int getSize(){
  return 75;
}
void display()
  {
    fill(#FFD16C);
    rect(carX , carY,  75, 50);
   
  }
  
void move(){
  carX-=carspeed;
  if (carX < -75){
    carX = 800;
  }
  if (carX > 800){
    carX = -75;
  }
  
}  
}

void setup(){
  size(800, 700);
back = loadImage("froggerBackground.png");
back.resize(800,700);
        carLeft = loadImage("carLeft.png");
        carLeft.resize(75, 50);
        carRight = loadImage("carRight.png");
        carRight.resize(75, 50);
        frog = loadImage("frog.png");
        frog.resize(50,50);
}

void draw(){
  //background(#506993);
  //fill(#6EAA7C);
  background(back);
        image (carLeft, BeanMobile.getX(), BeanMobile.getY());
        image (carRight, BMW.getX(), BMW.getY());
        image (carLeft, BananaMobile.getX(), BananaMobile.getY());
        image (carRight, MDX.getX(), MDX.getY());
        image (carLeft, DuesenbergSJLAPhaeton.getX(), DuesenbergSJLAPhaeton.getY());
        
        image (frog, frogX, frogY);
//ellipse(frogX, frogY, 50, 50);
  
  //BeanMobile.display();
  //BananaMobile.display();
  //DuesenbergSJLAPhaeton.display();
  //MDX.display();
  //BMW.display();
 
 BeanMobile.move();
 BananaMobile.move();
 DuesenbergSJLAPhaeton.move();
 MDX.move();
 BMW.move();
 
 if (intersects(MDX)||intersects(BMW)||intersects(BananaMobile)||intersects(BeanMobile)||intersects(DuesenbergSJLAPhaeton)){
   resetFrog();
 }
 
 
}

void keyPressed()
{
    if(key == CODED){
        if(keyCode == UP)
        {
            //Frog Y position goes up
            frogY-=speed;
            
        }
        else if(keyCode == DOWN)
        {
            //Frog Y position goes down 
            frogY+=speed;
            
        }
        else if(keyCode == RIGHT)
        {
            //Frog X position goes right
            frogX+=speed;
            
            
        }
        else if(keyCode == LEFT)
        {
            //Frog X position goes left
            
            frogX-=speed;
            
        }
      if(frogY<0){
              frogY=0;
            }
      if(frogY>height){
              frogY=height;
            }
      if(frogX>width){
              frogX=width;
            }
      if(frogX<0){
              frogX=0;
            }
       
    }
}

boolean intersects(car car) {
 if ((frogY > car.getY() && frogY < car.getY()+50) &&
                (frogX > car.getX() && frogX < car.getX()+car.getSize())) {
   return true;
  }
 else  {
  return false;
 }
}

void resetFrog(){
  frogX = 400;
  frogY = 650;
}
