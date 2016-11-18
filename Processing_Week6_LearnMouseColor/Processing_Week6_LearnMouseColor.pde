// wekinator: 2 inputs
// wekinator: 3 outputs (continuous)

import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress address;

float rx = 0; // training X
float ry = 0; // training Y
int rs = 20; // rectangle size
boolean isDragging = false;

float r = 0;
float g = 0;
float b = 0;

void setup() {
  size(400, 200);

  oscP5 = new OscP5(this, 12000); // wekinator sends to 12000
  address = new NetAddress("127.0.0.1", 6448); // send to wekinator on 6448
}

void draw() {
  background(255);

  fill(0);
  rect(rx, ry, rs, rs);

  stroke(0);
  line(width / 2, 0, width / 2, height);

  fill(r * 255, g * 255, b * 255);
  rect(width / 2, 0, width / 2, height);

  OscMessage message = new OscMessage("/wek/inputs");
  message.add(rx);
  message.add(ry);
  oscP5.send(message, address);
}

void mousePressed() {
  if (rx < mouseX && mouseX < rx + rs && ry < mouseY && mouseY < ry + rs) {
    isDragging = true;
  }
}

void mouseDragged() {
  if (isDragging) {
    rx = mouseX;

    if (rx < 0) { rx = 0; }
    if (rx > width / 2 - rs) { rx = width / 2 - rs; }

    ry = mouseY;

    if (ry < 0) { ry = 0; }
    if (ry > height - rs) { ry = height - rs; }
  }
}

void mouseReleased() {
  isDragging = false;
}

void oscEvent(OscMessage wekinatorMessage) {
  if (wekinatorMessage.checkAddrPattern("/wek/outputs")) {
    r = wekinatorMessage.get(0).floatValue();
    g = wekinatorMessage.get(1).floatValue();
    b = wekinatorMessage.get(2).floatValue();
  }
}
