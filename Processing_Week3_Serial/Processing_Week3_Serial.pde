import processing.serial.*;

Serial serial;

float x = 0;
float y = 0;

void setup() {
  size(400, 400);

  String ports[] = serial.list();

  for (int i = 0; i < ports.length; i = i + 1) {
    println(i + ": " + ports[i]);
  }

  serial = new Serial(this, ports[1], 9600);
}

void draw() {
  background(0);

  int size = 6;
  ellipse(x, y, size, size);
}

void serialEvent(Serial serialPort) {
  String textFromSerial = serialPort.readStringUntil('\n');

  if (textFromSerial != null) {
    // textFromSerial => "123\n"
    // trim(textFromSerial) => "123"
    // int("123") => 123
    // size = int(trim(textFromSerial));

    String textValues[] = split(textFromSerial, " ");

    x = (int(trim(textValues[0])) / 1024.0) * width;
    y = (int(trim(textValues[1])) / 1024.0) * height;

    println(x + " " + y);
  }
}
