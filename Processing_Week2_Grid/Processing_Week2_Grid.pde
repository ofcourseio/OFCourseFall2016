void setup() {
  size(400, 400);
}

float distance(int ax, int ay, int bx, int by) {
  int a = (ax - bx) * (ax - bx);
  int b = (ay - by) * (ay - by);
  return sqrt(a + b);
}

void drawGrid(int n) {
  int size = width / n;

  for (int i = 0; i < n; i = i + 1) {
    for (int j = 0; j < n; j = j + 1) {
      int x = i * size;
      int y = j * size;

      float d = distance(x + size / 2, y + size / 2, mouseX, mouseY);
      float c = constrain(d, 0, 255);

      fill(255 - c);
      rect(x, y, size, size);
    }
  }
}

void drawCircles(int n) {
  ellipseMode(CENTER);

  stroke(120);

  for (int i = 0; i < n; i = i + 1) {
    int size = (width / n) * (n - i);

    float d = distance(mouseX, mouseY, width / 2, height / 2);

    fill(abs(size - d * 3.0));
    ellipse(width / 2, height / 2, size, size);
  }
}

void draw() {
  background(120);
  noStroke();

  //drawGrid(20);

  drawCircles(20);
}
