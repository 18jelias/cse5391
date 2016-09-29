float alpha = 0.0;

void setup() {
  size(800, 600, P3D);
  lights();
}

void draw() {
  background(0);
  rotateY(alpha);
  pushMatrix();
  translate(width/2, height/2, 0);
  noFill();
  stroke(255);
  strokeWeight(2);
  int theta = 0;
  pushMatrix();
  fill(123, 45, 90, 100);
  for (int i = 0; i < 20; i++) {
    beginShape();
    rotateZ(theta); 
    vertex(0, 0, 0);
    vertex(10, 20, 30);
    vertex(20, 20, 10);
    endShape(CLOSE);
    theta++;
  }
  popMatrix();
  pushMatrix();
  noFill();
  for (int i = 0; i < 20; i++) {
    beginShape();
    rotateZ(theta); 
    vertex(0, 0, 0);
    vertex(30, 70, 80);
    vertex(45, 35, 70);
    endShape(CLOSE);
    theta++;
  }
  popMatrix();
  popMatrix();
  alpha+=0.02;
}

