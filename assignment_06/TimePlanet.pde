class TimePlanet extends Planet {

  TimeUnit unit;

  int lastMillis;
  int lastSecond;

  TimePlanet(String texturePath, TimeUnit unit) {
    super(texturePath);
    this.unit = unit;
    lastSecond = second();
  }

  TimePlanet(float rad, float dist, String texturePath, TimeUnit unit) {
    super(rad, dist, texturePath);
    this.unit = unit;
    lastSecond = second();
  }

  void updateMillis() {
    this.lastMillis = millis();
    this.lastSecond = second();
  }

  @Override
    void update() {
    if (lastSecond != second()) {
      updateMillis();
    }
    this.rotDeg += this.rotVel;
    switch (unit) {
    case SECONDS: 
      this.revDeg = second() * 6 + map(millis() - lastMillis, 0, 1000, 0, 6.0);
      println(map(millis() - lastMillis, 0, 1000, 0, 6.0));
      break;
    case MINUTES: 
      this.revDeg = (minute() * 6) + ((float) second() / 10.0);
      break;
    case HOURS:   
      this.revDeg = map(hour() % 12, 0, 12, 0, 360) + (minute() / 2);
      break;
    }
  }
}

public enum TimeUnit {
  SECONDS, MINUTES, HOURS
}