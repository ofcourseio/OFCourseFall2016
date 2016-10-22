class Car {
  int x = 0;
  int y = 0;
  int r = 0;
  int g = 0;
  int b = 0;
  int speed = 1;
  int direction = 1;
  int carWidth = 40;
  int screenSize = 0;

  Car(int posX, int posY, int newScreenSize) {
    x = posX;
    y = posY;
    screenSize = newScreenSize;
  }

  void setColor(int colorR, int colorG, int colorB) {
    r = colorR;
    g = colorG;
    b = colorB;
  }

  void setWidth(int newWidth) {
    carWidth = newWidth;
  }

  void setSpeed(int newSpeed) {
    speed = newSpeed;
  }

  void update() {
    x = x + direction * speed;

    if (x > screenSize) {
      direction = -1;
    }
    if (x < 0) {
      direction = 1;
    }
  }

  void draw() {
    int carHeight = 12;
    int size = 6;

    fill(r, g, b);
    rect(x, y, carWidth, carHeight);

    fill(0);
    ellipseMode(CENTER);
    ellipse(x + 4, y + carHeight, size, size);
    ellipse(x + carWidth - 4, y + carHeight, size, size);
  }
} // end of class

Car car1 = new Car(10, 10, 400);
Car car2 = new Car(10, 40, 400);

void setup() {
  size(400, 400);
}

void draw() {
  background(255);

  car1.update();
  car2.update();

  car1.draw();
  car2.draw();

  car1.setSpeed(2);
  car2.setSpeed(3);

  car1.setColor(255, 255, int(mouseX / 400.0 * 255.0));
  car2.setWidth(int(mouseY / 400.0 * 100.0));
}
