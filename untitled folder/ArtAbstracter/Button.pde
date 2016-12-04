class Button {
  
  int x;
  int y;
  int l;
  int w;
  color c;
  color hover;
  String s;
  int tSize;
  PFont bFont;
  PImage image;
  
  
  Button(int x, int y) {
    this.x = x;
    this.y = y;
    image = loadImage("camera-solid.png");
    this.c = color(196,37,97);
    this.l = 50;
    this.w = 50;
    
  }
 
  
  boolean isClicked() {
    println(x, y);
    if ((mouseX >= x - l / 2 && mouseX <= (x + l / 2)) && 
        (mouseY >= y - w / 2 && mouseY <= (y + w / 2))) {
       return true;  
        
    } else {
      return false;
    }   
  }
  
  boolean isHovered() {
    if ((mouseX >= x - l / 2 && mouseX <= (x + l / 2)) && 
        (mouseY >= y - w / 2 && mouseY <= (y + w / 2))) {
       return true;  
        
    } else {
      return false;
    }   
  }
    
  
  void draw() {
    pushStyle();
    hover=color(209,202,202);
    if(isHovered()) {
      fill(hover);
    } else {
      fill(c);
    }
    rectMode(CENTER);
    ellipse(x, y, l, w);
    imageMode(CENTER);
    image(image, x,y, l/2,w/2);
    fill(color(29,157,167));
    popStyle();
  }
  
}
