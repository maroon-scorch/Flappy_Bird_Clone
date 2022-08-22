class Button {
  String label;
  float x;    // top left corner x position
  float y;    // top left corner y position
  float w;    // width of button
  float h;    // height of button
PImage clicked,unclicked;
  Button(String labelB, float xpos, float ypos, float widthB, float heightB, PImage c, PImage uc) {
    label = labelB;
    x = xpos;
    y = ypos;
    w = widthB;
    h = heightB;
    clicked = c;
    unclicked = uc;
  }
  
  void Draw() {
    
     if (MouseIsOver()) {
      strokeWeight(4);
      stroke(255,0,0);
      image(clicked,x,y,w,h);
    // rect(x, y, w, h, 10);
    // noStroke();
     strokeWeight(1);

  }
  else {
      strokeWeight(4);
      stroke(255,0,0);
      image(unclicked,x,y,w,h);
    // rect(x, y, w, h, 10);
    // noStroke();
     strokeWeight(1);
  }

draw = true;

  }
  
  boolean MouseIsOver() {
    if (mouseX > x && mouseX < (x + w) && mouseY > y && mouseY < (y + h)) {

      return true;
    }
    return false;
  }
  
  boolean drawn(){
  return draw;
  }
  
  void setDraw(boolean b){
  draw = b;
  }

}