//Smoke code used from https://processing.org/examples/smokeparticlesystem.html
//Oscillation code used from http://natureofcode.com/book/chapter-3-oscillation/

ArrayList<ParticleSystem> smoke;
ArrayList<OscillatingEllipse> oscillators;
final int R = 1;
final int G = 2;
final int B = 3;

void setup() {
  size(1200, 800);
  smoke = new ArrayList<ParticleSystem>();
  oscillators = new ArrayList<OscillatingEllipse>();
  initilizePs();
  for (int i = 0; i < 100; i++) {
    oscillators.add(new OscillatingEllipse());
  }
}

void draw() {
  background(0);
  pushMatrix();
  translate(width/2, height-300);
  drawParticleSystems();
  for (OscillatingEllipse o : oscillators) {
    o.draw();
  }
  popMatrix();
}

void drawParticleSystems() {
  for (ParticleSystem ps : smoke) {
    ps.run();
    for (int i = 0; i < 50; i++) {
      ps.addParticles();
    }
  }
}

void initilizePs() {
  PVector p1 = new PVector(-0.05, 0);
  PVector p2 = new PVector(-0.09, 0);
  PVector p3 = new PVector(-0.03, 0);
  PVector p4 = new PVector(0.04, 0);
  PVector p5 = new PVector(0.09, 0);
  PVector p6 = new PVector(0.04, 0);
  PVector p7 = new PVector(0.09, 0);
  PVector p8 = new PVector(-0.08, 0);
  smoke.add(new ParticleSystem(-200, 0, R, p1, 1000));
  smoke.add(new ParticleSystem(-150, -150, B, p2, 2000));  
  smoke.add(new ParticleSystem(0, -200, G, p3, 500));  
  smoke.add(new ParticleSystem(150, -150, R, p4, 800));  
  smoke.add(new ParticleSystem(200, 0, B, p5, 1000));
  smoke.add(new ParticleSystem(150, 150, G, p6, 1300));    
  smoke.add(new ParticleSystem(0, 200, G, p7, 1300));  
  smoke.add(new ParticleSystem(-150, 150, G, p8, 1300));
}

