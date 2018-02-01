//  Ian Wolterstorff
//  wolterstorff.i@husky.neu.edu
//  ARTG 2260: Programming Basics
//  Assignment 04

ImageStage[] stages;

final int DEFAULT_TIME = 4000;

int initialTime;
int currentTime;
int currentIndex;

class ImageStage {
  PImage image;
  String caption;
  float time;
  boolean isVertical;

  ImageStage(PImage image, String caption, float time) {
    this.image = image;
    this.caption = caption;
    this.time = time;
    isVertical = (image.height > image.width);
  }

  ImageStage(PImage image, String caption) {
    this(image, caption, DEFAULT_TIME);
  }

  // defined with both argument orders for compatibility with an earlier class which I removed
  ImageStage(String caption, PImage image) {
    this(image, caption, DEFAULT_TIME);
  }

  void display(int offset) {
    fill(48, 60, 116);
    textAlign(CENTER);
    imageMode(CENTER);
    PImage localImg = image;
    if (isVertical) {
      localImg.resize(0, 500);
    } else {
      localImg.resize(600, 0);
    }
    // tint(255, map(millis() % DEFAULT_TIME, 0, 4000, 0, 255));
    tint(255, map(constrain(sin(map((millis() - initialTime) % DEFAULT_TIME, 0, DEFAULT_TIME, 0, PI)), 0, PI/4), 0, PI/4, 0, 255));
    image(localImg, width / 2, height / 2);
    textSize(40);
    text(caption, width / 2, height - offset);
  }

  void display() {
    this.display(40);
  }
}


void setup() {
  size(1024, 768);

  initialTime = currentTime = millis();
  currentIndex = 0;

  stages = new ImageStage[]{new ImageStage("I was born in Maine", loadImage("US-ME-EPS-02-6001.png")), 
    new ImageStage("At 14, I moved to Connecticut", loadImage("US-CT-EPS-02-6001.png")), 
    new ImageStage("My father lives here", loadImage("US-VT-EPS-02-6001.png")), 
    new ImageStage("And now I live here!", loadImage("US-MA-EPS-02-6001.png")), 
    new ImageStage("Having grown up near the sea, \nI am very fond of boats.", loadImage("IMG_7883.JPG")), 
    new ImageStage("My specific interests lie at the intersection \nbetween design and technology.", loadImage("1-designers-developers-opt.jpg")), 
    new ImageStage("In my life my hobbies have included robotics", loadImage("32386410050_d328826675_b.jpg")), 
    new ImageStage("and music", loadImage("32710268474_e08bf7d398_b.jpg")), 
    new ImageStage("My favorite animal is the octopus", loadImage("AB921605-B94F-4D2A-A1798DD43488550D_source.jpg")), 
    new ImageStage("BUT I ALSO LOVE DOGGOS", loadImage("Samoyed-2.jpg"))
  };
}


void draw() {
  background(255, 182, 193);
  if (currentIndex > stages.length - 1) {
    return;
  }
  if (currentIndex == 4 || currentIndex == 5) {
    stages[currentIndex].display(80);
  } else {
    stages[currentIndex].display();
  }
  if (millis() > currentTime + stages[currentIndex].time) {
    currentTime = millis();
    currentIndex++;
  }
}