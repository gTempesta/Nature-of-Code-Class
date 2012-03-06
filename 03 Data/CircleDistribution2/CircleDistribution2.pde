float x;
float y;
float radius;
float circleRadius;  
float totalPoints; 
float breakPoint;

void setup() {
  size(480, 480);
  smooth();
  background(69, 69, 69);
  totalPoints =3;
  circleRadius = 10;
  breakPoint=20;
}

void draw() {

  smooth();
  x=width/2;
  y=height/2;


  for (int radius = 0; radius < 50; radius += circleRadius) {
    totalPoints = int((TWO_PI*radius)/circleRadius);
    for (int i = 0; i < totalPoints; i++) {
      // polar to cartesian coordinate transformation!
      float theta = map(i, 0, totalPoints, 0, TWO_PI);
      float xt = x + radius * sin(theta);
      float yt = y + radius * cos(theta);
      strokeWeight(1);
      fill(255, 255, 255);       
      ellipse(xt, yt, circleRadius, circleRadius);
    }
  }

  stroke(0);
  strokeWeight(2);
  noFill();
  ellipse(x, y, 50, 50);

  noLoop();
}
