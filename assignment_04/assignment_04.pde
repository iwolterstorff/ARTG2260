//  Ian Wolterstorff
//  wolterstorff.i@husky.neu.edu
//  ARTG 2260: Programming Basics
//  Assignment 04

PImage me;
PImage ct;
PImage ma;
PImage mi;
PImage vt;

void setup() {
  size(1024, 768);
  
  me = loadImage("US-ME-EPS-02-6001.png");
  ct = loadImage("US-CT-EPS-02-6001.png");
  ma = loadImage("US-MA-EPS-02-6001.png");
  mi = loadImage("US-MI-EPS-02-6001.png");
  vt = loadImage("US-VT-EPS-02-6001.png");
}



void draw() {
  background(128, 128, 128);
  //noLoop();
  text(mouseX + ", " + mouseY, 10, 10);
  displayMaine();
  displayConnecticut();
}


void displayMaine() {
  PImage localMe = me;
  localMe.resize(0, 300);
  image(localMe, 160, 195);
  text("I was born in Maine", 130, 550);
  fill(255, 0, 0);
  star(202, 457, 10, 5, 5);
}

void displayConnecticut() {
  PImage localCt = ct;
  localCt.resize(240, 0);
  image(localCt, 650, 230);
  text("At 14, I moved to Connecticut", 640, 550);
  fill(255, 0, 0);
  star(750, 355, 10, 5, 5);
}

// taken from https://processing.org/examples/star.html
void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}