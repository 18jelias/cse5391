/*

  Jacquelyn Elias
  Lecture 33: Video mirror

*/

import processing.video.*;

Capture video; //object represents video camera


void setup() {
  size(800, 800);
  video = new Capture(this, 640, 480, 30);
  video.start();
  background(0);
}

void draw() {
  if (video.available()) {
    video.read();
    video.loadPixels(); //or video.read if you want to load vid
  }
  
  for (int i = 0; i < 200; i++) {
    int size = (int)random(20, 30);
    int x = (int)random(video.width);
    int y = (int)random(video.height);
    int loc = x + y * video.width;
    pickColor(loc);
    ellipse(x, y, size, size);
    } 
}

void pickColor(int loc) {
  float r = red(video.pixels[loc]);
  float g = green(video.pixels[loc]);
  float b = blue(video.pixels[loc]);
  
  fill(r, g, b, 100);
  stroke(r, g, b);
}
