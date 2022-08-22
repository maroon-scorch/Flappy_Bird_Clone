import processing.sound.*;
SoundFile die,flap,theme,hit,mainmenu_theme;
float themelength;
int preMillis = 0;
boolean once = true;
boolean flapup = true;
boolean firsttime = true;

PImage title;
PImage img;
PImage res,res1;
PImage exit,exit1;
PImage[] bird = new PImage[4]; 
PImage bdead;
PImage paper; 
PImage start;

PImage pipe,flip,pipe1,flip1,dead;
Pipe test,test1;
Flip opp,opp1;
Bird flappy, mainmenu_flappy;

PVector velocity = new PVector(0,0);
PVector gravity = new PVector(0, 0.3);
PVector up = new PVector(0,-0.6);

boolean alive = true;

int score = 0;
float endx;

boolean savior = true;
boolean savior1 = true;

boolean main = true;

boolean draw = false;

int stage = 0;
int preSec = 0;
  
Button restart,end,start_b;

void setup(){
  
// Images:
// --------------------------------------------
// Title:
// I made this at https://cooltext.com/Logo-Design-Fun
title = loadImage("Images/title.png");
// --------------------------------------------
// Background Image:
// Royalty free image from https://www.shutterstock.com/ ID: 443879794
img = loadImage("Images/background.png");
// --------------------------------------------
// Bird:
// Free Art Assets from user bevouliin.com at:
// https://opengameart.org/content/free-game-asset-grumpy-flappy-bird-sprite-sheets
bird[0] = loadImage("Images/Bird/Frame-1.png");
bird[1] = loadImage("Images/Bird/frame-2.png");
bird[2] = loadImage("Images/Bird/frame-3.png");
bird[3] = loadImage("Images/Bird/frame-4.png");

for(int i = 0; i<bird.length; i++)
bird[i].resize(72,61);

bdead = loadImage("Images/Bird/bird-death.png");
bdead.resize(72,61);
// --------------------------------------------
// Buttons:
// I made this myself at https://fontmeme.com/pixel-fonts/
res = loadImage("Images/Button/restart.png");
res1 = loadImage("Images/Button/restart1.png");

// I made this myself at https://fontmeme.com/pixel-fonts/
exit = loadImage("Images/Button/exit.png");
exit1 = loadImage("Images/Button/exit1.png");
// I made this myself from https://www.pixilart.com/
start = loadImage("Images/Button/start.png");
// --------------------------------------------
// Pipe:
// I made this myself from https://www.pixilart.com/
pipe = loadImage("Images/Pipe/pipe.png");
pipe.resize(167,pipe.height);
//pipe.resize(167,(int)random(200,800));

// I made this myself from https://www.pixilart.com/
pipe1 = loadImage("Images/Pipe/pipe-alt.png");
pipe1.resize(167,pipe.height);
//pipe1.resize(167,(int)random(200,800));

// I made this myself from https://www.pixilart.com/
flip = loadImage("Images/Pipe/flip.png");
flip.resize(167,height-pipe.height-200);

flip1 = loadImage("Images/Pipe/flip.png");
flip1.resize(167,height-pipe.height-200);
// --------------------------------------------
// Sound Effects:
//Sound Effect from <a href="https://pixabay.com/sound-effects/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=music&amp;utm_content=40282">Pixabay</a>
die = new SoundFile(this,"Sound Effect/death-rattle-40282.wav");

//Sound Effect from <a href="https://pixabay.com/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=music&amp;utm_content=6270">Pixabay</a>
flap = new SoundFile(this,"Sound Effect/fast-simple-chop-5-6270.wav");

//Sound Effect from <a href="https://pixabay.com/sound-effects/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=music&amp;utm_content=6037">Pixabay</a>
hit = new SoundFile(this,"Sound Effect/hit-someting-6037.wav");

// Theme:
//Sound Effect from <a href="https://pixabay.com/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=music&amp;utm_content=68698">Pixabay</a>
theme = new SoundFile(this,"Sound Effect/8bit-music-for-game-68698.wav");

//Sound Effect from <a href="https://pixabay.com/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=music&amp;utm_content=65586">Pixabay</a>
mainmenu_theme = new SoundFile(this,"Sound Effect/lv-3-65586.wav");
themelength = theme.duration();
// --------------------------------------------
// Program:
size(800,900);

flappy = new Bird(width/2, height/2);
mainmenu_flappy = new Bird(width/2,height/2);

test = new Pipe(600,height-pipe.height+10,pipe);
opp = new Flip(600,-10,flip);

test1 = new Pipe(test.Pipex()+400+pipe.width,height-pipe.height+10,pipe1);
opp1 = new Flip(test.Pipex()+400+pipe.width,-10,flip1);

restart = new Button("RESTART?",350,400,100,50,res,res1);
end = new Button(" ",350,460,100,50,exit,exit1);
start_b = new Button(" ",width/2 - start.width/2,height/2 + start.height/2,start.width,start.height,start,start);

}

void draw() {
 
  if(stage == 0){
  
  backgroundScroll(img);
  mainmenu_flappy.Draw();
  
  if(second()-preSec>mainmenu_theme.duration()){
    preSec = second();
    main = true;
  }
  
  if(main==true){
   mainmenu_theme.play();
   mainmenu_theme.amp(1.0);
   
   main = false;
  }
  
  start_b.Draw();
  
  image(title, width/2 - title.width/2, height/4);
  
  }
  if(stage==1){
  fill(255);
 // textFont();
  textAlign(CENTER,CENTER);
  textSize(50);

  if((millis()-preMillis > 1000*themelength || firsttime) && alive){
  
  theme.play();
   theme.amp(0.25);
   preMillis = millis();
  firsttime = false;
   
  }
  
    if(alive){
  backgroundScroll(img);
  }
  else{
    
    if(savior){
    endx = frameCount % img.width;
  savior = false;  
  }
    //print(x);
    copy(img, (int)endx, 0, img.width, height, 0, 0, img.width, height);
  }
  
  
  //  backgroundScroll(img);

  if(!alive){
   velocity.y = 0;
   gravity.y = 0;
   
   if(savior1){
        hit.play();
   hit.amp(1.0);
   delay(500);
   savior1 = false;
 }
   
   flappy.down();
   
   theme.stop();

   if(once)
   {
   die.play();
   die.amp(1);
   once = false;
  }
  }
  
//if(velocity.y<0 && flapup){
if(velocity.y<0 && flapup){
  flap.play();
  flap.amp(1);
  flapup = false;
  
}
if(velocity.y>0){
flapup = true;
}
  

  test.Draw();
test1.Draw();
opp.Draw(test);
opp1.Draw(test1);
  
   flappy.applyForce(gravity);
  flappy.Draw();
  flappy.move();
  flappy.bounce();
 if(mousePressed == true && alive)
  flappy.applyForce(up);
  
flappy.touchPipe(test);
flappy.touchPipe(test1);

flappy.touchPipe(opp);
flappy.touchPipe(opp1);




fill(0);
for(int x = -1; x < 2; x++){
//  for(int y = -1; y < 2; y++){
//    text("LIKE THIS!", 20+x,20+y);
//  }
    text(score, width/2+x,100);
    text(score, width/2,100+x);
}
fill(255);
text(score,width/2,100);

// Bird is dead and fallen off
if(!alive && flappy.gety() == height-bird[1].height-20){

     strokeWeight(4);
      stroke(255);
      textSize(20);

     rect(250, 350, 300, 200, 7);
     fill(255);
     rect(250+10, 350+10, 300-20, 200-20, 7);
     fill(0);
     text("Oops, you died...", 400,370);

restart.Draw();
end.Draw();
}
}
 
}

void backgroundScroll(PImage img){
  int x = frameCount % img.width;
  copy(img, x, 0, img.width, height, 0, 0, img.width, height);
  int x2 = img.width - x;
  
  if (x2 < width) {    
    copy(img, 0, 0, img.width, height, x2, 0, img.width, height);
  } 
}

void mouseClicked()
{
  if((restart.MouseIsOver() == true)&&restart.drawn()){
    
    flappy.setLocation(width/2, height/2);
    gravity.y = 0.3;
    
    test.setLocation(600,height-pipe.height+10);
    test1.setLocation(test.Pipex()+400+pipe.width,height-pipe.height+10);
    opp.setLocation(600,-10);
    opp1.setLocation(test.Pipex()+400+pipe.width,-10);
    
    alive = true;
draw = false;
savior = true;
savior1 = true;
firsttime = true;
once = true;
score = 0;
  }
  
  if(end.MouseIsOver() == true && end.drawn())
  exit();
  
  if(start_b.MouseIsOver() == true && start_b.drawn()){
    stage = 1;
    main = false;
    mainmenu_theme.stop();
    start_b.setDraw(false);
  
  }
}
//void mouseClicked(){
// // if(mousePressed == true)
//  flappy.applyForce(up);
//}