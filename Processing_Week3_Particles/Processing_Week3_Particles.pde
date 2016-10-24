float positionsX[] = new float[100];
float positionsY[] = new float[100];
float speedX[] = new float[100];
float speedY[] = new float[100];
float life[] = new float[100];

int lastIndex = 0;

float distance(float x1, float y1, float x2, float y2) {
  return sqrt(
       (x1 - x2) * (x1 - x2)
     + (y1 - y2) * (y1 - y2)
  );
}

void setup() {
  size(400, 400);

  for (int i = 0; i < positionsX.length; i = i + 1) {
    positionsX[i] = 0;
    positionsY[i] = 0;
    speedX[i] = 0;
    speedY[i] = 0;
    life[i] = 0;
  }
}

void draw() {
  background(255);

  int r = 10;

  for (int i = 0; i < positionsX.length; i = i + 1) {
    noStroke();
    fill(0, 0, 200, life[i] * 50);

    float x1 = positionsX[i];
    float y1 = positionsY[i];

    ellipse(x1, y1, r, r);

    positionsY[i] = positionsY[i] + speedY[i];
    positionsX[i] = positionsX[i] + speedX[i];

    if (positionsY[i] > height - r / 2 || positionsY[i] < r / 2) {
      speedY[i] = -speedY[i];
    }
    if (positionsX[i] > width - r / 2 || positionsX[i] < r / 2) {
      speedX[i] = -speedX[i];
    }

    life[i] = life[i] - 0.001;
    if (life[i] < 0) {
      life[i] = 0;
    }

    for (int j = 0; j < positionsX.length; j = j + 1) {
      float x2 = positionsX[j];
      float y2 = positionsY[j];

      float d = distance(x1, y1, x2, y2);

      if (d < 50 && life[i] > 0.1 && life[j] > 0.1) {
        stroke(0, 0, 200, (d / 50.0) * 120.0);
        line(x1, y1, x2, y2);
      }
    }
  }

  if (mousePressed) {
    if (lastIndex == positionsX.length) {
      lastIndex = 0;
    }

    positionsX[lastIndex] = mouseX;
    positionsY[lastIndex] = mouseY;

    int mod = 2;

    speedX[lastIndex] = random(-mod, mod);
    speedY[lastIndex] = random(-mod, mod);

    life[lastIndex] = 1.0;

    lastIndex = lastIndex + 1;
  }
}
