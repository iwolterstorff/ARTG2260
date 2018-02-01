//  Ian Wolterstorff
//  wolterstorff.i@husky.neu.edu
//  ARTG 2260: Programming Basics
//  Assignment 04

Stage[] stages;

class Stage {
  String caption;
  float time;

  Stage(String caption, float time) {
    this.caption = caption;
    this.time = time;
  }

  void display() {
    textAlign(CENTER);
    text(caption, width / 2, height / 2);
  }
}

class ImageStage extends Stage {
  PImage image;
  boolean isVertical;

  ImageStage(String caption, float time, PImage image) {
    super(caption, time);
    this.image = image;
    isVertical = (image.height > image.width);
  }
  
  ImageStage(String caption, PImage image) {
    this(caption, 3000, image);
  }

  @Override
    void display() {
    textAlign(CENTER);
    imageMode(CENTER);
    PImage localImg = image;
    if (isVertical) {
      localImg.resize(0, 600);
    } else {
      localImg.resize(400, 0);
    }
    image(localImg, width / 2, height / 2);
    textSize(18);
    text(caption, width / 2, ((5.0 / 6.0) * height));
  }
}


void setup() {
  size(1024, 768);
  
  stages = new Stage[]{new ImageStage("I was born in Maine", loadImage("US-ME-EPS-02-6001.png")),
                             new ImageStage("At 14, I moved to Connecticut", loadImage("US-CT-EPS-02-6001.png"))};
}



void draw() {
  background(128, 128, 128);
  //noLoop();
  //text(mouseX + ", " + mouseY, 10, 10);
  stages[1].display();
}



//void displayMaine() {
//  PImage localMe = me;
//  localMe.resize(0, 300);
//  image(localMe, 160, 195);
//  text("I was born in Maine", 130, 550);
//  fill(255, 0, 0);
//  star(202, 457, 10, 5, 5);
//}

//void displayConnecticut() {
//  PImage localCt = ct;
//  localCt.resize(240, 0);
//  image(localCt, 650, 230);
//  text("At 14, I moved to Connecticut", 640, 550);
//  fill(255, 0, 0);
//  star(750, 355, 10, 5, 5);
//}

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