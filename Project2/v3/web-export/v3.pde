//https://processing.org/examples/smokeparticlesystem.html

ParticleSystem ps1;
ArrayList<ParticleSystem> smoke;
final int R = 1;
final int G = 2;
final int B = 3;

void setup() {
  size(1200, 800);
  smoke = new ArrayList<ParticleSystem>();
  PVector p = new PVector(-0.05, 0);
  ps1 = new ParticleSystem(width/2, height/2, R, p);
}

void draw() {
  background(0);
  drawParticleSystems();
}

void drawParticleSystems() {
  ps1.run();
  for (int i = 0; i < 100; i++) {
    ps1.addParticles();
  }
}

void drawLight() {
  
}

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
    lifespan = 75;
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
      fill(0+lifespan, 34,100, lifespan); 
    } else if (c == 2) {
      fill(34, lifespan,100, lifespan); 
    } else if (c == 3) {
      fill(100, 34,lifespan, lifespan); 
    }
    ellipse(loc.x, loc.y, 10, 10);
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
class ParticleSystem {
  ArrayList<Particle> particles;
  PVector center;
  int numOfParticles;
  int c;
  PVector a;
  
  ParticleSystem(int x, int y, int c, PVector a) {
    particles = new ArrayList<Particle>();
    center = new PVector();
    numOfParticles = 1000;
    center.x = x;
    center.y = y;
    this.c = c;
    this.a = a;
    for(int i = 0; i < numOfParticles; i++) {
      particles.add(new Particle(center, c, a.get()));
    }
  }
  
  void run() {
    for(int i = particles.size()-1; i>=0; i--) {
      Particle p = particles.get(i);
      p.run();
      if(p.isDone()) {
        particles.remove(i);
      }
    }
    
  }
  
  void accelerate(PVector f) {
    for (Particle p : particles) {
      p.accelerate(f);
    }
  }
  
  void addParticles() {
    particles.add(new Particle(center, c, a.get()));
  }
  
}

