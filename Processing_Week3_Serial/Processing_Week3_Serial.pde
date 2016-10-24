import processing.serial.*;

Serial serial;

int size = 0;

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

  ellipse(width / 2, height / 2, size, size);
}

void serialEvent(Serial serialPort) {
  String textFromSerial = serialPort.readStringUntil('\n');

  if (textFromSerial != null) {
    // textFromSerial => "123\n"
    // trim(textFromSerial) => "123"
    // int("123") => 123

    size = int(trim(textFromSerial));
  }
}
