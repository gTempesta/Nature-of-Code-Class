class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;

  Mover() {
    location = new PVector(width/2,20);
    velocity = new PVector(0,0);
    acceleration = new PVector(-.25,-.25);
    topspeed = 2;
  }
  
  void applyForce(PVector f) {
    acceleration.add(f);
  }
  
  void update() {
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    stroke(0);
    fill(175);
    line(location.x,location.y,location.x,location.y+70);
    ellipse(location.x,location.y,16,20);
  }

  void checkEdges() {

    if (location.x > width) {
      velocity.x*=-1;
      location.x = width;
    } 
    else if (location.x < 0) {
      velocity.x*=-1;
      location.x = 0;
    }

    if (location.y > height) {
      velocity.y*=-.55;
      location.y = height;
    } 
    else if (location.y < 0) {
      velocity.y*=-.55;
      location.y = 0;
    }

  }

}



