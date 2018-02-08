/////////////////////////////////////
//    Ian Wolterstorff            //
//    wolterstorff.i@husky.neu.edu//
//    ARTG2260                    //


PImage backdrop;

Planet[] planets;

void setup() {
  fullScreen(P3D);
  noStroke();
  backdrop = loadImage("2k_stars.jpg");
  backdrop.resize(width, height);
  planets = new Planet[]{
    new Planet(width / 12, 0, "2k_sun.jpg"),
    new TimePlanet(width / 35, height / 3.7, "2k_mercury.jpg", TimeUnit.SECONDS), 
    new TimePlanet(width / 22, height / 2.4, "2k_earth_daymap.jpg", TimeUnit.MINUTES), 
    new TimePlanet(width / 28, height / 1.9, "2k_mars.jpg", TimeUnit.HOURS)
  };
}

void draw() {
  ambientLight(255, 255, 255);
  pointLight(255, 255, 255, width / 2, height / 2, 0);
  background(backdrop);
  for (Planet p : planets) {
    p.display();
  }
}