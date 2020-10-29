int w = 800;
int h = 600;
int frogX = 600;
int frogY = 400;
int speed = 6;


car BeanMobile = new car(780, 200, 8);
car BananaMobile = new car(780, 300, 8);
car DuesenbergSJLAPhaeton = new car(780, 400, 8);

public class car{
int carX = 300;
int carY = 300;
int carspeed = 8;



public car(int x, int y, int z){
  carX = x;
  carY = y;
  carspeed = z;
}
void display()
  {
    fill(#FFD16C);
    rect(carX , carY,  75, 50);
   
  }
  
void move(){
  carX-=carspeed;
}  
}

void setup(){
  size(800, 600);

}

void draw(){
  background(#506993);
  fill(#6EAA7C);
ellipse(frogX, frogY, 50, 50);
  
  BeanMobile.display();
  BananaMobile.display();
  DuesenbergSJLAPhaeton.display();
 
 BeanMobile.move();
 BananaMobile.move();
 DuesenbergSJLAPhaeton.move();
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
      if(frogY>600){
              frogY=600;
            }
      if(frogX>800){
              frogX=800;
            }
      if(frogX<0){
              frogX=0;
            }
       
    }
}
