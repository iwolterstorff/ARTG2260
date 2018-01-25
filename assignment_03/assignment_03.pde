// Ian Wolterstorff
// ARTG 2260
// wolterstorff.i@husky.neu.edu
// Assignment 03
// "Floral Americana"



ArrayList<PVector> loPoints = new ArrayList<PVector>();

ArrayList<Flower> loFlowers = new ArrayList<Flower>();

class Flower {
  float x;
  float y;
  float radius;
  float rotation;

  Flower(float x, float y, float radius, float rotation) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.rotation = rotation;
  }

  void display() {
    pushMatrix();
    translate(x, y);
    stroke(0);
    
    // RELIES ON ONLY ONE DIMENSION OF WINDOW
    // should fix someday
    scale(radius / (width / 2));
    
    rotate(rotation);
    
    color flower = color(0, 204, 204, 200);
    
    if (radius % 0.02 == 0) {
      flower = color(127, 255, 0, 200);
    }

    fill(flower);

    // ALL THE COMMENTED CODE IS FROM WHEN I WAS TRYING TO MAKE THE CORNERS ROUNDED
    // I would like to know if there is an easy way to do that

    arc(width / 2, height / 2, width, height, radians(5), radians(85), PIE);
    arc(width / 2, height / 2, width, height, radians(95), radians(175), PIE);
    arc(width / 2, height / 2, width, height, radians(185), radians(265), PIE);
    arc(width / 2, height / 2, width, height, radians(275), radians(355), PIE);

    lineAngleFromCenter(width / 2, radians(5));
    lineAngleFromCenter(height / 2, radians(85));
    lineAngleFromCenter(height / 2, radians(95));
    lineAngleFromCenter(width / 2, radians(175));
    lineAngleFromCenter(width / 2, radians(185));
    lineAngleFromCenter(height / 2, radians(265));
    lineAngleFromCenter(height / 2, radians(275));
    lineAngleFromCenter(width / 2, radians(355));

    fill(255, 179, 255, 200);
    ellipse(width / 2, height / 2, width / 8, height / 8);

    //arc(width / 2, height / 2, width, height, radians(10), radians(80));
    //arc(width / 2, height / 2, width, height, radians(100), radians(170));
    //arc(width / 2, height / 2, width, height, radians(190), radians(260));
    //arc(width / 2, height / 2, width, height, radians(280), radians(350));

    float lineLength = (width / 2) - (width / 20);

    //lineAngleFromCenter(lineLength, radians(175));
    //lineAngleFromCenter(lineLength, radians(185));
    //lineAngleFromCenter(lineLength, radians(5));
    //lineAngleFromCenter(lineLength, radians(355));
    //lineAngleFromCenter(lineLength, radians(85));
    //lineAngleFromCenter(lineLength, radians(95));
    //lineAngleFromCenter(lineLength, radians(265));
    //lineAngleFromCenter(lineLength, radians(275));

    //PVector topLeft = getEPFromCenter(height / 2, radians(260));
    //PVector topRight = getEPFromCenter(height / 2, radians(280));
    //PVector leftTop = getEPFromCenter(width / 2, radians(180));
    //PVector leftBot = getEPFromCenter(width / 2, radians(170));
    //PVector botLeft = getEPFromCenter(height / 2, radians(95));
    //PVector botRight = getEPFromCenter(height / 2, radians(85));
    //PVector rightBot = getEPFromCenter(width / 2, radians(5));
    //PVector rightTop = getEPFromCenter(width / 2, radians(10));

    //bezier(topLeft.x, topLeft.y, topRight.x, topRight.y, 
    //getEPFromCenter(lineLength, radians(275)).x, 
    //getEPFromCenter(lineLength, radians(275)).y, 
    //getEPFromCenter(lineLength, radians(265)).x, 
    //getEPFromCenter(lineLength, radians(265)).y);
    //printCoord(getEndpoint(width / 2, height / 2, lineLength, (radians(85))).x, getEndpoint(width / 2, height / 2, lineLength, radians(85)).y);
    //printCoord(topLeft.x, topLeft.y);
    
    popMatrix();
  }
}

void setup() {
  size(1024, 1024);
  background(245, 245, 220);
  smooth();
  
  for (int i = 0; i < 5; i++) {
    loFlowers.add(new Flower(random(width), random(height), random(70, 250), random(0, (2 * PI))));
  }
}

// Draw a line given starting coordinates, length, and angle off the X axis IN RADIANS
void lineAngle(float startX, float startY, float length, float theta) {
  PVector end = getEndpoint(startX, startY, length, theta);
  line(startX, startY, end.x, end.y);
}

void lineAngleFromCenter(float length, float theta) {
  lineAngle(width / 2, height / 2, length, theta);
}

PVector getEndpoint(float startX, float startY, float length, float theta) {
  // help from https://math.stackexchange.com/questions/39390/determining-end-coordinates-of-line-with-the-specified-length-and-angle
  return new PVector((startX + (length * cos(theta))), (startY + (length * sin(theta))));
}

PVector getEPFromCenter(float length, float theta) {
  return getEndpoint(width / 2, height / 2, length, theta);
}

void printCoord(float x, float y) {
  println("X: " + x + " Y: " + y);
}

void draw() {
  stroke(255, 0, 0);
  strokeWeight(4);
  for (PVector p : loPoints) {
    point(p.x, p.y);
  }
  for (Flower f : loFlowers) {
    f.display();
  }
  saveFrame("wolterstorff_ian.png");
}

void mousePressed() {
  loPoints.add(new PVector(mouseX, mouseY));
  println("X: " + mouseX + " Y: " + mouseY);
}