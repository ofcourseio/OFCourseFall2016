class Button {
  int x = 0;
  int y = 0;
  int w = 30;
  int h = 30;
  boolean isClicked = false;

  Button(int buttonX, int buttonY) {
    println("you created a button");
    x = buttonX;
    y = buttonY;
  }

  void checkClicked(int mx, int my) {
    if (mx > x && mx < x + w && my > y && my < y + h) {
      if (isClicked) {
        isClicked = false;
      } else {
        isClicked = true;
      }
    }
  }

  boolean isTheButtonClicked() {
    return isClicked;
  }

  void draw() {
    if (isClicked) {
      fill(120, 0, 120);
    } else {
      fill(200);
    }
    rect(x, y, w, h);
  }
}

Button myButtonDraw = new Button(10, 10);
Button myButtonClean = new Button(10, 40);

void setup() {
  size(400, 400);
}

void draw() {
  if (myButtonDraw.isTheButtonClicked()) {
    if (mousePressed) {
      point(mouseX, mouseY);
    }
  }

  if (myButtonClean.isTheButtonClicked()) {
    background(255);
  }

  myButtonDraw.draw();
  myButtonClean.draw();
}

void mouseClicked() {
  myButtonDraw.checkClicked(mouseX, mouseY);
  myButtonClean.checkClicked(mouseX, mouseY);
}
