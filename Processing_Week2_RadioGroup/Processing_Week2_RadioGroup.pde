class Button {
  int x = 0;
  int y = 0;
  int w = 30;
  int h = 30;
  boolean isClicked = false;

  Button(int buttonX, int buttonY) {
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
    stroke(0);
    rect(x, y, w, h);
  }
}

class RadioGroup {
  int x = 0;
  int y = 0;
  int selectedIndex = 0;
  int size = 30;
  int radioCount = 2;

  RadioGroup(int newX, int newY, int newCount) {
    x = newX;
    y = newY;
    radioCount = newCount;
  }

  void checkClicked(int mx, int my) {
    if (mx > x && mx < x + size && my > y && my < y + size * radioCount) {
      for (int i = 0; i < radioCount; i = i + 1) {
        int y1 = y + i * size;
        int y2 = y + (i + 1) * size;

        if (y1 < my && my < y2) {
          selectedIndex = i;
        }
      }
    }
  }

  int getIndex() {
    return selectedIndex;
  }

  void draw() {
    stroke(120, 120, 255);
    strokeWeight(2);

    ellipseMode(CENTER);

    for (int i = 0; i < radioCount; i = i + 1) {
      if (i == selectedIndex) {
        fill(100);
      } else {
        fill(255);
      }

      ellipse(x + size / 2, y + i * size, size, size);
    }
  }
}

Button myButtonDraw = new Button(10, 10);
Button myButtonClean = new Button(10, 40);

RadioGroup myRadioGroupColor = new RadioGroup(10, 100, 3);

void setup() {
  size(400, 400);
}

void draw() {
  fill(255);

  stroke(0);

  if (myRadioGroupColor.getIndex() == 0) {
    stroke(255, 0, 0);
  }
  if (myRadioGroupColor.getIndex() == 1) {
    stroke(0, 255, 0);
  }
  if (myRadioGroupColor.getIndex() == 2) {
    stroke(0, 0, 255);
  }

  if (myButtonDraw.isTheButtonClicked()) {
    if (mousePressed) {
      line(pmouseX, pmouseY, mouseX, mouseY);
    }
  }

  if (myButtonClean.isTheButtonClicked()) {
    background(255);
  }

  myButtonDraw.draw();
  myButtonClean.draw();
  myRadioGroupColor.draw();
}

void mouseClicked() {
  myButtonDraw.checkClicked(mouseX, mouseY);
  myButtonClean.checkClicked(mouseX, mouseY);
  myRadioGroupColor.checkClicked(mouseX, mouseY);
}
