class Particle {
  PVector loc; 
  PVector v;
  PVector a;
  int lifespan;
  int c;
  
  Particle(PVector center, int c, PVector a) {
    v = new PVector();
    this.a = a.get();
    v.x = randomGaussian()*.3;
    v.y = randomGaussian()*.3 -1;
    lifespan = 100;
    this.c = c;
    loc = center.get();
  }
  
  void run() {
    create();
    update();
  }
  
  void create() {
    pushStyle();
    noStroke();
    if (c == 1) {
      fill(0+lifespan, 34,130, lifespan); 
    } else if (c == 2) {
      fill(34, lifespan, 100, lifespan); 
    } else if (c == 3) {
      fill(80, 34,lifespan, lifespan); 
    }
    ellipse(loc.x, loc.y, 20, 20);
    popStyle();
  }
  
  void accelerate(PVector f) {
    a.add(f);
  }
  
  void update() {
    v.add(a);
    loc.add(v);
    lifespan-=1;
    
  }
  
  boolean isDone() {
    if(lifespan <= 0) {
      return true;
    } else {
      return false;
    }
  }
}
