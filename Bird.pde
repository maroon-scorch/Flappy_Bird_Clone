class Bird{

  PVector location, acceleration;
  float mass = 1;
  

  int count = 0;
  int preMillis = 0;
  Bird(float xi, float yi){

    location = new PVector(xi,yi);
    //velocity = new PVector(xs,ys);

    acceleration = new PVector(0,0);
  }
  
  void Draw(){

     if(millis()-preMillis>250){
  if(count>=3){
  count = 0;
  preMillis = millis();
  }
  else{
  count++;
  preMillis = millis();
  }
  } 
   // print(count);
    if(alive)
    image(bird[count],location.x,location.y);
    else
    death();
   // image(bird[3],location.x,location.y);

  }
  
    void move()
  {
 velocity.add(acceleration);
 location.add(velocity);
 acceleration.mult(0);

  }
  
  void bounce()
  {
    if(location.y<0)
 {

  location.y = 0;
  velocity.y = 0;

 }
    if(location.y>height-bird[1].height-20)
 {

   location.y = height-bird[1].height-20;
   alive = false;

 }
  }

  void applyForce(PVector force)
  {
    if(alive){
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
    }    
  }
  
  void touchPipe(Pipe p){
  PImage img = p.Pipeimg();
    float x = p.Pipex();
    float y = p.Pipey();
    
    if((location.x+bird[1].width-15>x)&&(location.y+bird[1].height-25>y)&&(location.x+10<x+img.width)&&(location.y<y+img.height)){

   alive = false;
    }
    
    if(location.x == x && alive)
    score++;

    
  }
  
    void touchPipe(Flip p){
  PImage img = p.Pipeimg();
    float x = p.Pipex();
    float y = p.Pipey();
    
    if((location.x+bird[1].width-15>x)&&(location.y+bird[1].height+25>y)&&(location.x+10<x+img.width)&&(location.y+20<y+img.height)){

   alive = false;
    }
    
  }
  
  void death(){
  
  image(bdead,location.x,location.y);
  
  
  }
  
  void down(){
  
    location.y+=10;
  }
  
  float gety(){
  return location.y;
  }
  
  void setLocation(float x, float y){
  
  location.x = x;
  location.y = y;
  
  
  }



}