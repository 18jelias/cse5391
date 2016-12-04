/*
  Jacquelyn Elias
  Abstract art generator
*/

import processing.video.*;
ArrayList<Integer> particles; 
Capture video;
PImage temp1;
PImage temp2;
PImage temp3;
PImage temp4;
PImage temp5;
PImage temp6;
PImage glyh;
Button snap;
boolean go; 
ArrayList<PVector> coords; 

final int PHOTO = 1;
final int EDIT = 2;

int state; 

void setup() {
  size(1024, 800);
  colorMode(HSB, 360, 100, 100);
  video = new Capture(this, width, height, 30);
  video.start();
  snap = new Button(width/2, height-50);
  state = PHOTO;
  go = false;
  loadPixels();
  particles = new ArrayList<Integer>();
  update();
  coords = new ArrayList<PVector>();
  background(0);  
}

void draw() {
  if (state == PHOTO) {
    update();
    snap.draw();
    go = false;
  } else {
    textSize(12);
    fill(0);
    text("Click space to go back to photo mode", 10, 30);
    
  }
}

void mousePressed() {
  if (state == PHOTO) {
    if(snap.isClicked()) state = EDIT;
    update();
  } else {
  int size = 400;
  int w = (int)random(size);
  int h = (int)random(size);
  noStroke();
  temp1 = video.get(mouseX,mouseY,w,h);
  //rect(mouseX, mouseY, w, h);
  w = (int)random(size);
  h = (int)random(size);
  temp2 = video.get(mouseX,mouseY,w,h);
  //rect(mouseX, mouseY, w, h);
  w = (int)random(size);
  h = (int)random(size);
  temp3 = video.get(mouseX,mouseY,w,h);
  //rect(mouseX, mouseY, w, h);
  w = (int)random(size);
  h = (int)random(size);
  temp4 = video.get(mouseX,mouseY,w,h);
  //rect(mouseX, mouseY, w, h);
  w = (int)random(size);
  h = (int)random(size);
  temp5 = video.get(mouseX,mouseY,w,h);
  //rect(mouseX, mouseY, w, h);
  w = (int)random(size);
  h = (int)random(size);
  temp6 = video.get(mouseX,mouseY,w,h);
  go = true;
  
  //rect(mouseX, mouseY, w, h);
  }
}

void mouseReleased() {
  if (go == true) {
    int num = (int)random(4);
    if(num == 1) {
      for(int i = 0; i < random(10); i++) {
        fill(color(hue(temp1.get((int)random(50),(int)random(50))), saturation(temp1.get((int)random(50),(int)random(50))), brightness(temp1.get((int)random(50),(int)random(50))), 100));
        rect(mouseX-(int)random(-40, 40), mouseY-(int)random(-20, 20),(int)random(100), (int)random(200), (int)random(300));
        ellipse(mouseX+(int)random(40),mouseY,(int)random(400),(int)random(400));        
      }

      
    } else if(num == 2) {
      fill(color(hue(temp1.get((int)random(50),(int)random(50))), saturation(temp1.get((int)random(50),(int)random(50))), brightness(temp1.get((int)random(50),(int)random(50))), 100));
      if(mouseY > width/2) {
        for(int i = 0 ; i < random(5); i++) {
          pushMatrix();
          rotate(i);
        rect(mouseX-(int)random(-40, 40), mouseY-(int)random(0, 50),(int)random(100), (int)random(300), (int)random(500));
        rect(mouseX,mouseY,50,100);
        popMatrix();
        }
      } else {
        rect(mouseX-(int)random(-40, 40), mouseY-(int)random(-40, 40),(int)random(-40, 40), (int)random(-100, 100), (int)random(-250, 300));
        rect(mouseX,mouseY,50,100);
      }
      fill(color(40,20,40,50));
      rect(mouseX-300, mouseY+400, 500, 800);

    } else if(num == 3) {
      fill(color(hue(temp1.get((int)random(50),(int)random(50))), saturation(temp1.get((int)random(50),(int)random(50))), brightness(temp1.get((int)random(50),(int)random(50))), 100));
      triangle(mouseX-(int)random(-5,5),mouseY-(int)random(-5,5),mouseX+(int)random(-100,100),mouseY+(int)random(-100,100), mouseX+(int)random(-100,200), mouseY+(int)random(-50,50));
    } 
 
  image(temp1, mouseX, mouseY);
  image(temp2, mouseX, mouseY);
  image(temp3, mouseX, mouseY);
  image(temp4, mouseX, mouseY);
  image(temp5, mouseX, mouseY);
  image(temp6, mouseX, mouseY);
 
  }
}

void keyPressed() {
  if(state == EDIT) {
    state = PHOTO;
    
  } else {
    state = EDIT;
  }
}

void update() {
  if (video.available()) {
    video.read();
    video.loadPixels();
  }
 
  
   for(int i=1; i < video.width; i++) {
    for(int j=1; j< video.height; j++) {
      if(abs(hue(video.get(i,j)) - hue(video.get(i-1,j))) < 30 
                  && abs(saturation(video.get(i,j)) - saturation(video.get(i-1,j))) < 30
                  && abs(brightness(video.get(i,j)) - brightness(video.get(i-1,j))) < 30) {
         video.set(i,j, color(hue(video.get(i-1,j)), saturation(video.get(i-1,j)), brightness(video.get(i-1,j))));
      } else if (abs(hue(video.get(i,j)) - hue(video.get(i,j-1))) < 30 &&
                  abs(saturation(video.get(i,j)) - saturation(video.get(i,j-1))) < 30
                    && abs(brightness(video.get(i,j)) - brightness(video.get(i,j-1))) < 30) {
        video.set(i,j, color(hue(video.get(i,j-1)), saturation(video.get(i,j-1)), brightness(video.get(i,j-1))));
      }
    }
   } 
    
  set(0, 0, video);

}


