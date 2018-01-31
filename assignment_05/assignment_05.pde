////// JOEEESSSEPHHH AOUNNNNNN 

class Aoun {
  float x;
  float y;
  float xdim;
  float ydim;
  
  Aoun(float x, float y, float xdim, float ydim) {
    this.x = x;
    this.y = y;
    this.xdim = xdim;
    this.ydim = ydim;
  }
  
}

int currentSize;


ArrayList<Aoun> aouns = new ArrayList<Aoun>();

PImage aoun;

void setup() {
  size(1024, 768);
  currentSize = 50;
  aoun = loadImage("aoun.png");
  imageMode(CENTER);
}

void draw() {
  if (mousePressed) {
    aouns.add(new Aoun(mouseX, mouseY, currentSize, currentSize));
  }
  
  for (Aoun a : aouns) {
    image(aoun, a.x, a.y, a.xdim, a.ydim);
  }
}

void keyReleased() {
  if (key == 'a' || key == 'A') {
    currentSize = (currentSize == 50) ? 100 : 50;
  }
}