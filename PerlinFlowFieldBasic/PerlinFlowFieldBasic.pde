FlowField flowfield;
ArrayList<Particle> particles;

boolean debug = false;

void setup() {
  size(1080, 1080);
  
  flowfield = new FlowField(10);
  flowfield.update();
  
  particles = new ArrayList<Particle>();
  for (int i = 0; i < 10000; i++) {
    PVector start = new PVector(random(width), random(height));
    particles.add(new Particle(start, random(2, 8)));
  }
  background(255);
}

void draw() {
  if (keyPressed) {
    saveFrame("screenshot.png");
  }
  flowfield.update();
  
  if (debug) flowfield.display();
  
  for (Particle p : particles) {
    p.follow(flowfield);
    p.run();
  }
}
