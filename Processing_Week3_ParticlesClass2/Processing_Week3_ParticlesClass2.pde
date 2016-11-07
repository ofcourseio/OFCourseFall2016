class Ball {
  float x = 0;
  float y = 0;
  float speedX = 0;
  float speedY = 0;
  float life = 0.0;
  int r = 10;

  Ball() {
  }

  void setPosition(int newX, int newY) {
    x = newX;
    y = newY;
  }

  void setSpeed(float newSpeedX, float newSpeedY) {
    speedX = newSpeedX;
    speedY = newSpeedY;
  }

  void setLife(float newLife) {
    life = newLife;
  }

  void update() {
    y = y + speedY;
    x = x + speedX;

    if (y > height - r / 2 || y < r / 2) {
      speedY = -speedY;
    }
    if (x > width - r / 2 || x < r / 2) {
      speedX = -speedX;
    }

    life = life - 0.001;
    if (life < 0) {
      life = 0;
    }
  }

  void draw() {
    noStroke();
    fill(0, 0, 200, life * 250);

    ellipse(x, y, r, r);
  }
}

Ball[] balls = new Ball[100];

int lastIndex = 0;

void setup() {
  size(400, 400);

  for (int i = 0; i < balls.length; i = i + 1) {
    balls[i] = new Ball();
  }
}

void draw() {
  background(255);

  for (int i = 0; i < balls.length; i = i + 1) {
    balls[i].update();
    balls[i].draw();
  }

  if (mousePressed) {
    if (lastIndex == balls.length) {
      lastIndex = 0;
    }

    int mod = 2;

    balls[lastIndex].setPosition(mouseX, mouseY);
    balls[lastIndex].setSpeed(random(-mod, mod), random(-mod, mod));
    balls[lastIndex].setLife(1.0);

    lastIndex = lastIndex + 1;
  }
}
