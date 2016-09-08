//https://processing.org/examples/smokeparticlesystem.html

ParticleSystem ps1;

void setup() {
  size(1200,800);
  ps1 = new ParticleSystem(); 
}

void draw() {
  background(0);
  ps1.run();
}
class Particle {
  PVector loc; 
  int lifespan;
  
  Particle() {
    lifespan = 50;
  }
  
  void run() {
    
  }
  
  void create() {
    pushStyle();
    noStroke();
    fill(255, lifespan); 
    ellipse(loc.x, loc.y, 5, 5);
    popStyle();
  }
  
  void update() {
    
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
  
  ParticleSystem(PVector loc) {
    particles = new ArrayList<Particle>();
    numOfParticles = 100;
    center = loc.get();
    for(int i = 0; i < numOfParticles; i++) {
      particle.add(new Particle());
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
  
  void addParticles() {
    particles.add(new Particle(center));
  }
  
}

