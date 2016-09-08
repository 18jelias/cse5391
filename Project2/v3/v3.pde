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

