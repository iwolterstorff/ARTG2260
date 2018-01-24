ArrayList<PVector> loPoints = new ArrayList<PVector>();

void setup() {
  size(1024, 1024);
  background(255);
  smooth();
  stroke(0);

  fill(0, 128, 128);
  ellipse(width / 2, height / 2, 20, 20);

  line(width / 2, height / 2, width / 2, 0);
  line(width / 2, height / 2, width, height / 2);
  line(width / 2, height / 2, width / 2, height);
  line(width / 2, height / 2, 0, height / 2);

  noFill();
  //arc(width / 2, height / 2, width, height, (3 * PI) / 2, 2 * PI);
  //arc(width / 2, height / 2, width, height, 0, PI / 2);
  //arc(width / 2, height / 2, width, height, PI / 2, PI);
  //arc(width / 2, height / 2, width, height, PI, (3 * PI) / 2);

  //arc(width / 2, height / 2, width, height, radians(5), radians(85));
  //arc(width / 2, height / 2, width, height, radians(95), radians(175));
  //arc(width / 2, height / 2, width, height, radians(185), radians(265));
  //arc(width / 2, height / 2, width, height, radians(275), radians(355));

  arc(width / 2, height / 2, width, height, radians(10), radians(80));
  arc(width / 2, height / 2, width, height, radians(100), radians(170));
  arc(width / 2, height / 2, width, height, radians(190), radians(260));
  arc(width / 2, height / 2, width, height, radians(280), radians(350));

  lineAngle(width / 2, height / 2, (width / 2) - (width / 20), radians(175));
  lineAngle(width / 2, height / 2, (width / 2) - (width / 20), radians(185));
  lineAngle(width / 2, height / 2, (width / 2) - (width / 20), radians(5));
  lineAngle(width / 2, height / 2, (width / 2) - (width / 20), radians(355));
}

// Draw a line given starting coordinates, length, and angle off the X axis IN RADIANS
void lineAngle(float startX, float startY, float length, float theta) {
  // help from https://math.stackexchange.com/questions/39390/determining-end-coordinates-of-line-with-the-specified-length-and-angle
  line(startX, startY, (startX + (length * cos(theta))), (startY + (length * sin(theta))));
}

void draw() {
  stroke(255, 0, 0);
  strokeWeight(4);
  for (PVector p : loPoints) {
    point(p.x, p.y);
  }
}

void mousePressed() {
  loPoints.add(new PVector(mouseX, mouseY));
  println("X: " + mouseX + " Y: " + mouseY);
}