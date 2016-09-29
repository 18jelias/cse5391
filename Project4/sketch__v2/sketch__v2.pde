float theta;
int z;
int lX;
int lY;
int lZ;

void setup() {
  size(800,600,P3D);
  theta = 0.0;
  z = -300;
  lX = 0; 
  lY = 0;
  lZ = 0;
}


void draw() {
  background(0);
  pushMatrix();
  rotateY(theta);
  rotateX(theta/4);
  translate(width/2, height/2, z);
  fill(0);
  beginShape();
  vertex(150,150,150);
  vertex(150,150,-150);
  vertex(150,-150,-150);
  vertex(150,-150,150);
  endShape();
    beginShape();
  vertex(-150,150,150);
  vertex(-150,150,-150);
  vertex(-150,-150,-150);
  vertex(-150,-150,150);
  endShape();
    noFill();
  stroke(255);
  box(300);
  line(-130, 150, -150, 90,-150, 150);
  line(90, -150, 150, -60, 150, -150);
    line(-60, 150, -150, 40, -150, 150);
  line(40, -150, 150, -30, 150, -150);
    line(-30, 150, -150, -10,-150, 150);
  line(-10, -150, 150, 140, 150, -150);
    line(140, 150, -150, 80, -150, 150);
  line(80, -150, 150, -45, 150, -150);
    line(-45, 150, -150, -130,-150, 150);
  line(-130, -150, 150, 50, 150, -150);
    line(50, 150, -150, -40, -150, 150);
  line(-40, -150, 150, -80, 150, -150);
    line(-80, 150, -150, 120,-150, 150);
  line(120, -150, 150, 135, 150, -150);
    line(135, 150, -150, -80, -150, 150);
  line(-80, -150, 150, 90, 150, -150);
    line(-130, -150, -150, 90,150, 150);
  line(90, 150, 150, -60, -150, -150);
    line(-60, -150, -150, 40, 150, 150);
  line(40, 150, 150, -30, -150, -150);
    line(-30, -150, -150, -10,150, 150);
  line(-10, 150, 150, 140, -150, -150);
    line(140, -150, -150, 80, 150, 150);
  line(80, 150, 150, -45, -150, -150);
    line(-45, -150, -150, -130,150, 150);
  line(-130, 150, 150, 50, -150, -150);
    line(50, -150, -150, -40, 150, 150);
  line(-40, 150, 150, -80, -150, -150);
    line(-80, -150, -150, 120,150, 150);
  line(120, 150, 150, 135, -150, -150);
    line(135, -150, -150, -80, 150, 150);
  line(-80, 150, 150, 90, -150, -150);

  pushMatrix();
  fill(123, 45, 90, 100);
  int alpha = 0;
  for (int i = 0; i < 20; i++) {
    beginShape();
    rotateZ(alpha); 
    vertex(0, 0, 0);
    vertex(50, 00, 100);
    vertex(90, 70, -90);
    endShape(CLOSE);
    alpha++;
  }
  popMatrix();
    pushMatrix();
    fill(60, 80, 140, 100);
  for (int i = 0; i < 20; i++) {
    beginShape();
    rotateZ(alpha); 
    vertex(0, 0, 0);
    vertex(30, 70, 80);
    vertex(45, 35, 70);
    endShape(CLOSE);
    alpha++;
  }
  popMatrix();
  popMatrix();
  
}


void keyPressed() {
  if(keyCode == LEFT) {
    z -=1;
    theta-=0.01;
  } else if (keyCode == RIGHT) {
    z += 1;
    theta+=0.01;
  }
}
