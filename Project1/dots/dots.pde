void setup() {
  size(800,600);
  background(100);
}

void draw() {
  pushMatrix();
  translate(width/2, height/2);
  for(int i = 0; i < 100; i++)
  {
     fill(0); 
    ellipse(-40+10*i,-80+10*i,10 * 1,10 * i);
  }
  for(int i = 0; i < 100; i++)
  {
    fill(255);
    ellipse(-30+10*i,-85+10*i,10 * 1,10 * i);
  }
  popMatrix();
}

void mousePressed() {
  
}

void keyPressed() {
  if(
}
