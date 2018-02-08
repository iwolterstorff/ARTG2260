class Planet {
  float rad;
  float dist;
  float rotDeg;
  float revDeg;
  float rotVel;
  float revVel;
  
  PImage texture;
  
  PShape planet;
  
  Planet(float rad, float dist, float rotDeg, float revDeg, PImage texture) {
    this.rad = rad;
    this.dist = dist;
    this.rotDeg = rotDeg;
    this.revDeg = revDeg;
    this.texture = texture;
    rotVel = 1.0;
    revVel = 1.0;
    
    planet = createShape(SPHERE, rad);
    planet.setTexture(texture);
  }
  
  Planet(float rad, float dist, float rotDeg, float revDeg, String texturePath) {
    this(rad, dist, rotDeg, revDeg, loadImage(texturePath));
  }
  
  Planet(PImage texture) {
    this(200, height / 10, 0, 0, texture);
  }
  
  Planet(float rad, float dist, String texturePath) {
    this(rad, dist, 0, 0, texturePath);
  }
  
  Planet(String texturePath) {
    this(loadImage(texturePath));
  }
  
  void update() {
    rotDeg += rotVel;
    revDeg += revVel;
  }
  
  void display() {
    pushMatrix();
    translate((width / 2) + (cos(radians(revDeg))) * dist, (height / 2) + (sin(radians(revDeg))) * dist, -1000);
    rotateX(-PI/6.0);
    rotateY(radians(rotDeg));
    shape(planet);
    popMatrix();
    this.update();
  }
  
  
  
}