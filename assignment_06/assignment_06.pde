/////////////////////////////////////
//    Ian Wolterstorff            //
//    wolterstorff.i@husky.neu.edu//
//    ARTG2260                    //

float deg;

PImage backdrop;

PShape sun;
PImage texture;

void setup() {
  fullScreen(P3D);
  deg = 0.0;
  //background(0, 128, 128);
  noStroke();
  backdrop = loadImage("starfield_ft.tga");
  backdrop.resize(width, height);
  texture = loadImage("2k_mercury.jpg");
  sun = createShape(SPHERE, 200);
  sun.setTexture(texture);
}

void draw() {
  lights();
  //background(0, 128, 128);
  background(backdrop);
  //beginShape();
  //texture(backdrop);
  //vertex(-5000, -5000, -5000, 0, 0);
  //vertex(5000, -5000, -5000, 512, 0);
  //vertex(5000, 5000, -5000, 512, 512);
  //vertex(-5000, 5000, -5000, 0, 512);
  //endShape();
  pushMatrix();
  //background(0, 128, 128);
  //for (int i = 0; i < 6; i++) {
  //  for (int j = 0; j < 6; j++) {
  //    translate(10 * (i - 3), -10, 10 * (j - 3));
  //  }
  //}
  translate(width / 2, height / 2, 500);
  rotateX(-PI/6.0);
  rotateY(radians(deg));
  //box(100, 200, 100);
  shape(sun);
  popMatrix();
  deg += 1.0;

}