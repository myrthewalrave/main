class Dot {
  float x, y;
  float radius = 30;
  color dotColor;
  boolean clicked = false;
  boolean active = false;
  float spawnTime;

  Dot(float X, float Y, color c) {
    x = X;
    y = Y;
    dotColor = c;
    spawnTime = millis();
    active = true;
  }

  void display() {
    if (active) {
      fill(dotColor);
      ellipse(x, y, radius * 2, radius * 2);
    }
  }

  boolean isClicked(float mx, float my) {
    float distance = dist(mx, my, x, y);
    return distance <= radius;
  }
}
