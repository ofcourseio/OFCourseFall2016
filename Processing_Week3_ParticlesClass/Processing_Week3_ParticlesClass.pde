// distance function

float distance(float x1, float y1, float x2, float y2) {
  return sqrt(
    (x1 - x2) * (x1 - x2)
    + (y1 - y2) * (y1 - y2)
    );
}

// BALL "BLUEPRINT"

class Ball {
  float x = 0;
  float y = 0;
  float speedX = 0;
  float speedY = 0;

  float life = 0.0;

  int r = 0;
  int g = 0;
  int b = 0;

  int size = 10;

  Ball(float newX, float newY, float newSpeedX, float newSpeedY, int newR, int newG, int newB) {
    x = newX;
    y = newY;
    speedX = newSpeedX;
    speedY = newSpeedY;

    r = newR;
    g = newG;
    b = newB;
  }

  void runAway(int mx, int my) {
    float d = distance(mx, my, x, y);
    float force = 0.2;

    if (d < 20) {
      life = 1.0;

      if (mx < x) { speedX = speedX + force; }
      if (mx > x) { speedX = speedX - force; }
      if (my < y) { speedY = speedY + force; }
      if (my > y) { speedY = speedY - force; }
    }

    float max = 3.0;

    if (speedX > max) { speedX = max; }
    if (speedX < -max) { speedX = -max; }
    if (speedY > max) { speedY = max; }
    if (speedY < -max) { speedY = -max; }
  }

  void update() {
    x = x + speedX * life;
    y = y + speedY * life;

    life = life - 0.01;
    if (life < 0) { life = 0; }

    if (y > height - size / 2 || y < size / 2) {
      speedY = -speedY;
    }
    if (x > width - size / 2 || x < size / 2) {
      speedX = -speedX;
    }
  }

  void draw() {
    noStroke();
    fill(r, g, b);

    ellipse(x, y, size, size);
  }
}

// BALL "OBJECT" ARRAY

Ball[] balls = new Ball[100];

// PROCESSING STUFF

void setup() {
  size(400, 400);

  for (int i = 0; i < balls.length; i = i + 1) {
    balls[i] = new Ball(
      random(width),
      random(height),
      0,
      0,
      int(random(255)),
      int(random(255)),
      int(random(255))
      );
  }
}

void draw() {
  background(120);

  for (int i = 0; i < balls.length; i = i + 1) {
    balls[i].runAway(mouseX, mouseY);

    for (int j = 0; j < balls.length; j = j + 1) {
      if (i != j) {
        balls[i].runAway(
          int(balls[j].x),
          int(balls[j].y)
          );
      }
    }

    balls[i].update();
    balls[i].draw();
  }
}
