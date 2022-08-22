class Flip{
  float x,y;
  PImage p;
  
  Flip(float xi, float yi, PImage pip){
  x = xi;
  y = yi;
  p = pip;
  }
  
  void Draw(Pipe obj){
  image(p,x,y);
  backgroundScroll(p);
  
  if(x+p.width<0){
  x=width;
 //p.resize(p.width,(int)random(300,600));
 // y = p.height;  
 changeY(obj);
  }
  }

void backgroundScroll(PImage img){
if(alive)
  x--;
}

float Pipex(){
return x;
}

float Pipey(){
return y;
}

PImage Pipeimg(){
return p;
}

void changeY(Pipe obj){

//y = 
p.resize(p.width,(int)(obj.Pipey()-200));


}

void setLocation(float xi, float yi){
x = xi;
y = yi;
  
}


}