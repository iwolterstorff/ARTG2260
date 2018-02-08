/////////////////////////////////////
//    Ian Wolterstorff            //
//    wolterstorff.i@husky.neu.edu//
//    ARTG2260                    //
//    "Solar Time"                //
////////////////////////////////////


import processing.pdf.*;

PImage backdrop;

Planet[] planets;

boolean pRecord;

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
  
  if (pRecord) {
    beginRaw(PDF, "frame.pdf");
  }
  
  for (Planet p : planets) {
    p.display();
  }
  
  if (pRecord) {
    endRaw();
    pRecord = false;
  }
}

void keyReleased() {
  switch (key) {
    case 's': case 'S':
      saveFrame();
      break;
    case 'p': case 'P':
      // I couldn't make the PDF recording work.... sorry
      //pRecord = true;
      break;
  }
}
      