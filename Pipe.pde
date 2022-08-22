class Pipe{
  float x,y;
  PImage p;
  
  Pipe(float xi, float yi, PImage pip){
  x = xi;
  y = yi;
  p = pip;
  }
  
  void Draw(){
  //image(p,x,y+round(60*sin(x/100)));
  image(p,x,y);
  backgroundScroll(p);
  
  if(x+p.width<0){
  x=width;
 //p.resize(p.width,(int)random(300,600));
 // y = p.height;  
 changeY();
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

void changeY(){


y = random(300,600);
p.resize(p.width,height-(int)y+10);

}

void setLocation(float xi, float yi){
x = xi;
y = yi;
  
}

}