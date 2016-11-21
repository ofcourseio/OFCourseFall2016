import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;

Kinect kinect;

int minDepth = 60;
int maxDepth = 800;

int minX = 0;
int maxX = 0;
int minY = 0;
int maxY = 0;

void setup() {
  size(640, 480);

  kinect = new Kinect(this);
  kinect.initDepth();
}

void draw() {
  background(0);

  int rawDepth[] = kinect.getRawDepth();

  image(processRawData(rawDepth), 0, 0);

  stroke(255);
  text(minDepth + " - " + maxDepth, 10, 20);

  stroke(255, 0, 0);
  line(minX, 0, minX, height);
  line(maxX, 0, maxX, height);
  line(0, minY, width, minY);
  line(0, maxY, width, maxY);
  ellipse((maxX + minX) / 2, (maxY + minY) / 2, 20, 20);
}

PImage processRawData(int rawDepth[]) {
  PImage output = createImage(kinect.width, kinect.height, ARGB);

  minX = kinect.width;
  maxX = 0;
  minY = kinect.height;
  maxY = 0;

  for (int i = 0; i < rawDepth.length; i = i + 1) {
    int y = int(i / kinect.width);
    int x = i - y * kinect.width;

    if (minDepth < rawDepth[i] && rawDepth[i] < maxDepth) {
      output.pixels[i] = color(255);

      if (x < minX) { minX = x; }
      if (x > maxX) { maxX = x; }
      if (y < minY) { minY = y; }
      if (y > maxY) { maxY = y; }
    } else {
      output.pixels[i] = color(0);
    }
  }

  return output;
}

void keyPressed() {
  if (key == 'a') {
    minDepth = minDepth + 10;
  }
  if (key == 'z') {
    minDepth = minDepth - 10;
  }
  if (key == 's') {
    maxDepth = maxDepth + 10;
  }
  if (key == 'x') {
    maxDepth = maxDepth - 10;
  }
}
