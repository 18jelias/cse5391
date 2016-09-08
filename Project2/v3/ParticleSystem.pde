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
