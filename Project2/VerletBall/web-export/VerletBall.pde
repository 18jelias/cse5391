class VerletBall {

  PVector pos, posOld;
  PVector push;
  float radius;
  int r,g,b; 

  VerletBall() {
  }

  VerletBall(PVector pos, PVector push, float radius) {
    this.pos = pos;
    this.push = push;
    this.radius = radius;
    this.posOld  = new PVector(pos.x, pos.y);
    r=5;
    g=18;
    b=177;

    // start motion
    pos.add(push);
  }

  void verlet() {
    PVector posTemp = new PVector(pos.x, pos.y);
    pos.x += (pos.x-posOld.x);
    pos.y += (pos.y-posOld.y);
    posOld.set(posTemp);
  }

  void render() {
    fill(r,g,b);
    ellipse(pos.x, pos.y, radius*2, radius*2);
  }

  void boundsCollision() {
    if (pos.x>width-radius) {
      pos.x = width-radius;
      posOld.x = pos.x;
      pos.x -= push.x;
    } else if (pos.x<radius) {
      pos.x = radius;
      posOld.x = pos.x;
      pos.x += push.x;
    }

    if (pos.y<radius) {
      pos.y = radius;
      posOld.y = pos.y;
      pos.y += push.y;
    } 

    if (pos.y>height-radius) {
      pos.y = height-radius;
      posOld.y = pos.y;
      pos.y -= push.y;
    }
  }
}

class VerletStick {
  
  VerletBall b1, b2;
  PVector vecOrig;
  float len;
  int adcolor;

  VerletStick(){
  }

  VerletStick(VerletBall b1, VerletBall b2){
    this.b1 = b1;
    this.b2 = b2;
    vecOrig  = new PVector(b2.pos.x-b1.pos.x, b2.pos.y-b1.pos.y);
    len = dist(b1.pos.x, b1.pos.y, b2.pos.x, b2.pos.y);
    adcolor = -1;
  }

  void render(){
    beginShape();
    vertex(b1.pos.x, b1.pos.y);
    vertex(b2.pos.x, b2.pos.y);
    endShape();
  }

  void constrainLen(){
    float stiffness = .002;
    PVector delta = new PVector(b2.pos.x-b1.pos.x, b2.pos.y-b1.pos.y);
    float deltaLength = delta.mag();
    float difference = ((deltaLength - len) / deltaLength);
    println(difference);
    b1.pos.x += delta.x * (0.5f * stiffness * difference);
    b1.pos.y += delta.y * (0.5f * stiffness * difference);
    b2.pos.x -= delta.x * (0.5f * stiffness * difference);
    b2.pos.y -= delta.y * (0.5f * stiffness * difference);
  }

}



/**
 * Verlet Integration
 * Pos  = pos + (pos-posOld)
 * alternative to  x += speed
 */

int particles = 2;
VerletBall[] balls = new VerletBall[particles];
int bonds = 1;
VerletStick[] sticks = new VerletStick[bonds];

void setup() {
  size(600, 400);
  float theta = PI/4.0;
  float shapeR = 40;
  PVector push = new PVector(1.5, 2.2);
  for (int i=0; i<particles; i++) {
    PVector p = new PVector(width/2+cos(theta)*shapeR, height/2+sin(theta)*shapeR);
    balls[i] = new VerletBall(p, push, 10);
    theta += TWO_PI/particles;
  }
  sticks[0] = new VerletStick(balls[0], balls[1]);
}

void draw() {
  background(255);
  sticks[0].render();
  sticks[0].constrainLen();

  balls[0].verlet();
  balls[0].render();
  balls[0].boundsCollision();

  balls[1].verlet();
  balls[1].render();
  balls[1].boundsCollision();
}




