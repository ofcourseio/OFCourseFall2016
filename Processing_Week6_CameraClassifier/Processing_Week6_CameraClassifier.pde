// wekinator: 100 inputs
// wekinator: 1 output, 2 classes

import netP5.*;
import oscP5.*;

import processing.video.*;

Capture camera;

float brightnesses[][] = new float[10][10];

OscP5 oscP5;
NetAddress address;

float recognizedClass = 0;

void setup() {
  size(640, 480);

  camera = new Capture(this, 640, 480);
  camera.start();

  oscP5 = new OscP5(this, 12000);
  address = new NetAddress("127.0.0.1", 6448);
}

void draw() {
  background(255);
  noStroke();

  calculateBrigthnesses(camera);

  int size = 10;
  int mod = 10;

  for (int x = 0; x < size; x = x + 1) {
    for (int y = 0; y < size; y = y + 1) {
      fill(brightnesses[x][y]);
      rect(x * mod, y * mod, mod, mod);
    }
  }

  stroke(0);
  text("class: " + recognizedClass, 10, 110);

  OscMessage message = new OscMessage("/wek/inputs");
  for (int x = 0; x < size; x = x + 1) {
    for (int y = 0; y < size; y = y + 1) {
      message.add(brightnesses[x][y]);
    }
  }
  oscP5.send(message, address);
}

void calculateBrigthnesses(PImage image) {
  int size = 10;

  int w = 640;
  int h = 480;

  for (int x = 0; x < size; x = x + 1) {
    for (int y = 0; y < size; y = y + 1) {
      int pixelIndex = (x * w / size) + (y * h / size) * w;
      brightnesses[x][y] = brightness(image.pixels[pixelIndex]);
    }
  }
}

void captureEvent(Capture c) {
  c.read();
}

void oscEvent(OscMessage wekinatorMessage) {
  if (wekinatorMessage.checkAddrPattern("/wek/outputs")) {
    recognizedClass = wekinatorMessage.get(0).floatValue();
  }
}
