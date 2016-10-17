boolean isClicked = false;

void setup() {
  size(400, 400);
}

void draw() {
  background(255);

  stroke(0);

  if (isClicked) {
    fill(255);
  } else {
    fill(0);
  }

  rect(100, 100, 200, 200);
}

void mouseClicked() {
  if (mouseX > 100 && mouseX < 100 + 200 && mouseY > 100 && mouseY < 100 + 200) {
    if (isClicked) {
      isClicked = false;
    } else {
      isClicked = true;
    }
  }
}