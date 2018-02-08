class Planet {
  float rad;
  float dist;
  float rotDeg;
  float revDeg;
  
  PImage texture;
  
  Planet(float rad, float dist, float rotDeg, float revDeg, PImage texture) {
    this.rad = rad;
    this.dist = dist;
    this.rotDeg = rotDeg;
    this.revDeg = revDeg;
    this.texture = texture;
  }
  
  Planet(float rad, float dist, float rotDeg, float revDeg, String texturePath) {
    this(rad, dist, rotDeg, revDeg, loadImage(texturePath));
  }
  
  Planet(PImage texture) {
    this(0, height / 10, 0, 0, texture);
  }
  
  Planet(String texturePath) {
    this(loadImage(texturePath));
  }
  
  
}