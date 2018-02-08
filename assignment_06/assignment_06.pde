/////////////////////////////////////
//    Ian Wolterstorff            //
//    wolterstorff.i@husky.neu.edu//
//    ARTG2260                    //

float deg;

void setup() {
  fullScreen(P3D);
  deg = 0.0;
  //background(0, 128, 128);
  noStroke();
}

void draw() {
  lights();
  //background(0);
  background(0, 128, 128);
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
  box(100, 200, 100);
  popMatrix();
  deg += 1.0;

}