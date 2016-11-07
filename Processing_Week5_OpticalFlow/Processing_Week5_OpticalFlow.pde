import processing.video.*;
import gab.opencv.*;

float distance(float x1, float y1, float x2, float y2) {
  return sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2));
}

class Ball {
  float x = 0;
  float y = 0;
  float sx = 0;
  float sy = 0;
  int r = 40;

  Ball(int newX, int newY) {
    x = newX;
    y = newY;
  }

  void updateSpeed(float updateX, float updateY) {
    sx = sx + updateX;
    sy = sy + updateY;

    float max = 10.0;

    if (sx > max)  { sx = max; }
    if (sx < -max) { sx = -max; }

    if (sy > max)  { sy = max; }
    if (sy < -max) { sy = -max; }
  }

  void update() {
    x = x + sx;
    y = y + sy;

    if (y > height - r / 2 || y < r / 2) {
      sy = -sy;
    }
    if (x > width - r / 2 || x < r / 2) {
      sx = -sx;
    }
  }

  void draw() {
    fill(220, 220, 220, 220);
    noStroke();
    ellipse(x, y, r, r);
  }
}

Capture video;
OpenCV opencv;

Ball myBall = new Ball(640/2, 480/2);

void setup() {
  size(640, 480);

  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);

  video.start();
}

void draw() {
  background(0);

  //video.resize(640/2, 480/2);

  opencv.loadImage(video);
  opencv.calculateOpticalFlow();

  image(video, 0, 0, 640, 480);

  stroke(255, 0, 0);
  noFill();
  //opencv.drawOpticalFlow(); // draws line for each of the pixels - SLOW

  int step = 5;
  int mod = 1000;
  float threshold = 0.004;

  for (int x = 0; x < 640 / 2 / step; x = x + 1) {
    for (int y = 0; y < 480 / 2 / step; y = y + 1) {
      int xStep = x * step;
      int yStep = y * step;

      PVector flow = opencv.getAverageFlowInRegion(xStep, yStep, step, step);

      if (flow.x > threshold || flow.x < -threshold ||
          flow.y > threshold || flow.y < -threshold) {
        int lineX = xStep * 2 + step / 2;
        int lineY = yStep * 2 + step / 2;

        line(lineX, lineY, lineX + flow.x * mod, lineY + flow.y * mod);

        float d = distance(lineX, lineY, myBall.x, myBall.y);

        if (d < 100) {
          myBall.updateSpeed(flow.x * mod, flow.y * mod);
        }
      }
    }
  }

  myBall.update();
  myBall.draw();
}

void captureEvent(Capture camera) {
  camera.read();
}
