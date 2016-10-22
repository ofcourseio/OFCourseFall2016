boolean isClickedDraw = false;
boolean isClickedClean = false;
boolean prevMousePressed = false;

void setup() {
  size(400, 400);
}

boolean isInsideRectangle(int rx, int ry, int rw, int rh, int mx, int my) {
  boolean output = false;

  if (rx < mx && mx < rx + rw && ry < my && my < ry + rh) {
    output = true;
  }

  return output;
}

void draw() {
  if (mousePressed == true && prevMousePressed == false) {
    if (isInsideRectangle(10, 10, 20, 20, mouseX, mouseY)) {
      if (isClickedDraw == false) {
        isClickedDraw = true;
      } else {
        isClickedDraw = false;
      }
    }

    if (isInsideRectangle(10, 50, 20, 20, mouseX, mouseY)) {
      if (isClickedClean == false) {
        isClickedClean = true;
      } else {
        isClickedClean = false;
      }
    }
  }

  stroke(0);
  if (isClickedDraw) {
    fill(0);

    if (mousePressed) {
      line(pmouseX, pmouseY, mouseX, mouseY);
    }

  } else {
    fill(255);
  }
  rect(10, 10, 20, 20);

  stroke(0);
  if (isClickedClean) {
    fill(0);

    background(255);
  } else {
    fill(255);
  }
  rect(10, 50, 20, 20);

  prevMousePressed = mousePressed;
}
