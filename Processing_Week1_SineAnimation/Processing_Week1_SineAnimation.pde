int x = 0;

void setup() {
  size(600, 400);
  background(0);
}

void draw() {
  noStroke();
  fill(0, 0, 0, 45);
  rect(0, 0, width, height);

  fill(255,0,0);
  ellipseMode(CENTER);

  float speed = 50;
  float circlePosition1 = sin(x / speed - 1) * width / 2 + width / 2;
  float circlePosition2 = sin(x / speed) * width / 2 + width / 2;
  float circlePosition3 = sin(x / speed + 1) * width / 2 + width / 2;

  ellipse(circlePosition1, height / 2 - 40, 20, 20);
  ellipse(circlePosition2, height / 2, 20, 20);
  ellipse(circlePosition3, height / 2 + 40, 20, 20);

  x = x + 1;
}