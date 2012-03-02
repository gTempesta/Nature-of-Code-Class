ArrayList psystems;

void setup() {
  size(640, 360);
  colorMode(RGB, 255, 255, 255, 100);
  psystems = new ArrayList();
  smooth();
}

void draw() {
  background(0);

  // Cycle through all particle systems, run them and delete old ones
  for (int i = psystems.size()-1; i >= 0; i--) {
    ParticleSystem psys = (ParticleSystem) psystems.get(i);
    psys.run();
    if (psys.dead()) {
      psystems.remove(i);
    }
  }
}

// When the mouse is pressed, add a new particle system
void mousePressed() {
  psystems.add(new ParticleSystem(int(random(5, 25)), new PVector(mouseX, mouseY)));
}

