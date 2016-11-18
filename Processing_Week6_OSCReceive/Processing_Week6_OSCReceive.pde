import oscP5.*;

OscP5 oscP5;

void setup() {
  size(200, 200);

  // listen for data on port 3000
  int receivePort = 3000;
  oscP5 = new OscP5(this, receivePort);
}

void draw() {}

void oscEvent(OscMessage inputMessage) {
  if (inputMessage.checkAddrPattern("/mouse")) {
    int mx = inputMessage.get(0).intValue();
    int my = inputMessage.get(1).intValue();

    println("got mouse: " + mx + " " + my);
  }
}
