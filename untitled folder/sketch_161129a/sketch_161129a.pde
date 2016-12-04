/*
  Jacquelyn Elias
  Abstract art generator
*/

import processing.video.*;

Capture video;

void setup() {
  size(800, 800);
  video = new Capture(this, 640, 480, 30);
  video.start();
  background(0);  
}

void draw() {
  if (video.available()) {
    video.read();
    video.loadPixels();
  }
  
  set(0, 0, video);
  
  /*for (int i = 0; i < 200; i++) {
    int x = (int)random(video.width);
    int y = (int)random(video.height);
    int loc = x + y * video.width;
    pickColor(loc);
    point(x, y);
    } 
    */
}

void pickColor(int loc) {
  float r = red(video.pixels[loc]);
  float g = green(video.pixels[loc]);
  float b = blue(video.pixels[loc]);
  
  fill(r, g, b, 100);
  stroke(r, g, b);
}
