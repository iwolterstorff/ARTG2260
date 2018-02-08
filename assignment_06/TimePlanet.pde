class TimePlanet extends Planet {

  TimeUnit unit;

  TimePlanet(String texturePath, TimeUnit unit) {
    super(texturePath);
    this.unit = unit;
  }

  TimePlanet(float rad, float dist, String texturePath, TimeUnit unit) {
    super(rad, dist, texturePath);
    this.unit = unit;
  }

  @Override
    void update() {
    this.rotDeg += this.rotVel;
    switch (unit) {
    case SECONDS: 
      this.revDeg = second() * 6;
      break;
    case MINUTES: 
      this.revDeg = minute() * 6;
      break;
    case HOURS:   
      this.revDeg = (hour() / 24) * 36;
      break;
    }
  }
}

public enum TimeUnit {
  SECONDS, MINUTES, HOURS
}