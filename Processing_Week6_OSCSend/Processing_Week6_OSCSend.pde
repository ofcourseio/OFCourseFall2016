import netP5.*;
import oscP5.*;

OscP5 oscP5;
NetAddress address;

void setup() {
  size(200, 200);

  // listen for data on port 4000
  int receivePort = 4000;
  oscP5 = new OscP5(this, receivePort);

  // send data to "127.0.0.1" on port 3000
  int sendPort = 3000;
  address = new NetAddress("127.0.0.1", sendPort);
}

void draw() {
  background(255);
}

void mouseClicked() {
  // OSC sends: "/mouse" to 127.0.0.1 on port 3000
  OscMessage message = new OscMessage("/mouse");

  message.add(int(mouseX)); // 0
  message.add(int(mouseY)); // 1

  oscP5.send(message, address);
}