int x = 0;

void setup() {
  size(200, 400);
  background(0);
}

void draw() {
  noStroke();
  fill(0, 0, 0, 45);
  rect(0, 0, 400, 400);

  fill(255,0,0);
  ellipseMode(CENTER);

  float speed = 10;
  float circlePosition = sin(x / speed + 1) * width / 2 + width / 2;

  ellipse(circlePosition, height / 2, 20, 20);

  x = x + 1;
}
