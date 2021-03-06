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



