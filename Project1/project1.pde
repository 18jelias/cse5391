int Y_AXIS = 1;
int X_AXIS = 2;

void setup() {
  size(800, 600);
}

void draw() {
  color b1 = color(22, 42, 106);
  color b2 = color(54, 71, 70);
  color b3 = color(36, 31, 31);
  setGradient(0, 0, width, height/2, b1, b2, Y_AXIS);
  setGradient(0, height/2, width, (height/4)+height/20, b2, b3, Y_AXIS);
  pushMatrix();
  translate(width/2, (height-height/5));
  for(int i = 0; i < 50; i++) {
    drawSunOutlines(i);
  }
  for(int i = 0; i < 8; i++)
  {
    drawSun(i);
  }
  for(int i = 0; i < 30; i++)
  {
    
    drawMountains(i);
  }
  drawHorizon();
  drawLand();
  popMatrix();
}


void drawHorizon() {
  strokeWeight(15);
  stroke(0);
  line(-width/2, 0, width/2, 0);
}

void drawLand() {
  fill(20, 20, 31);
  rect(-width/2, 0, width, height/5); 
  
}

void drawSunOutlines(int i) {
    fill(252-2*i,242-3*i,60+.5*i,5);
    noStroke();
    arc(0,-10,20+20*i,30+10*i, PI, TWO_PI);
}

void drawSun(int i) {
  fill(219-2*i, 159, 38, 150);
  noStroke();
  ellipse(0, -20, 10*i*.5, 10*i*.5);
}


void drawMountains(int i) {
  noStroke();
  fill(37,6,30);
  ellipse(-width/2+i*30, 10, -20, (int)random(30,50));
}

//Following code written by Casey Reas and Ben Fry on http://processingjs.org/learning/basic/lineargradient/
void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {

  // calculate differences between color components 
  float deltaR = red(c2)-red(c1);
  float deltaG = green(c2)-green(c1);
  float deltaB = blue(c2)-blue(c1);

  // choose axis
  println("about to go to if");
  if (axis == Y_AXIS) {
    /*nested for loops set pixelscin a basic table structure */
    // column
    for (int i=x; i<= (x+w); i++) {
      // row
      for (int j = y; j<= (y+h); j++) {
        color c = color(
        (red(c1)+(j-y)*(deltaR/h)), 
        (green(c1)+(j-y)*(deltaG/h)), 
        (blue(c1)+(j-y)*(deltaB/h)) 
          );
        set(i, j, c);
      }
    }
  } else if (axis == X_AXIS) {
    // column 
    for (int i=y; i<= (y+h); i++) {
      // row
      for (int j = x; j<= (x+w); j++) {
        color c = color(
        (red(c1)+(j-x)*(deltaR/h)), 
        (green(c1)+(j-x)*(deltaG/h)), 
        (blue(c1)+(j-x)*(deltaB/h)) 
          );
        set(j, i, c);
      }
    }
  }
}
//End of pasted code
