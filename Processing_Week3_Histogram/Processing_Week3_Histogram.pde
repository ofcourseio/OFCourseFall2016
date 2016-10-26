import processing.serial.*;

BarGraph graphSerial1 = new BarGraph(0, 0, 400, 200, 100);
BarGraph graphSerial2 = new BarGraph(0, 200, 400, 200, 100);

Serial serial;

void setup() {
  size(400, 400);

  String ports[] = serial.list();

  for (int i = 0; i < ports.length; i = i + 1) {
    println(i + ": " + ports[i]);
  }

  serial = new Serial(this, ports[1], 9600);
}

void draw() {
  background(255);

  graphSerial1.draw();
  graphSerial2.draw();
}

void serialEvent(Serial serialPort) {
  String textFromSerial = serialPort.readStringUntil('\n');

  if (textFromSerial != null) {
    String textValues[] = split(textFromSerial, " ");

    graphSerial1.addValue(int(trim(textValues[0])));
    graphSerial2.addValue(int(trim(textValues[1])));
  }
}
