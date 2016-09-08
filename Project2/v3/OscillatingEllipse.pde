class OscillatingEllipse {
  float theta;
  float w;
  float h;
  float a;
  
  
  OscillatingEllipse() {
   theta = random(-0.05, 0.05);
    w = random(30, 500);
    h = random(40, 500);
    a = random(-0.05, 0.05);
    
  }
  
  void draw(){
    noFill();
    strokeWeight(3);
    stroke(255, 80);
    ellipse(0,0, sin(theta)*w, sin(theta)*h);
    theta+=a;
  }
  
}
