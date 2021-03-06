class Firefly {
  float ellipseRad, topSpeed, growShrink;
  PVector location, velocity, acceleration, noff;
  int dir;
  float g;  

  Firefly(int tempGrowShrink) {
    ellipseRad=random(3, 10);
    growShrink=tempGrowShrink;
    topSpeed=1;
    location=new PVector(random(width), random(height));
    velocity=new PVector(0, 0);
    acceleration=new PVector(random(-5,5),random(-5,5));
    g=-ellipseRad*.15;
    
  }

  void render() {
    fill(234, 219, 50); //Firefly Color
    ellipse(location.x, location.y, ellipseRad, ellipseRad);
    //FADE IN FADE OUT
    if (ellipseRad > 9) {
      growShrink = 0;
    } 
    else if (ellipseRad < 0) {
      growShrink = 1;
    }
    if (growShrink == 1) {
      ellipseRad += random(.2, .25);
    } 
    else if ( growShrink== 0) {
      ellipseRad -=random(.2, .25);
    }
    //    println(ellipseRad);
    //    println("growShrink value"+growShrink);
  }
  
   void applyForce(PVector f) {
    acceleration.add(f);
  }
  
  PVector repel(Firefly firefly){
    PVector force = PVector.sub(location,firefly.location);             // Calculate direction of force
    float distance = force.mag();                                 // Distance between objects
    distance = constrain(distance,5.0,25.0);                             // Limiting the distance to eliminate "extreme" results for very close or very far objects
    force.normalize();                                            // Normalize vector (distance doesn't matter here, we just want this vector for direction)
    float strength = (g * ellipseRad * ellipseRad) / (distance * distance); // Calculate gravitional force magnitude
    force.mult(strength);                                         // Get force vector --> magnitude * direction
    return force;
  }

  void movement() {

    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    velocity.limit(topSpeed);

  }

  void inwindow() {

    //    location.x = constrain(location.x, 0+ellipseRad, width-ellipseRad);
    //    location.y = constrain(location.y, 0+ellipseRad, height-ellipseRad);
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

