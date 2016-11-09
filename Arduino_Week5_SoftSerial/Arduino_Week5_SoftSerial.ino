#include <SoftwareSerial.h>

int txPin = 11;
int rxPin = 12;

SoftwareSerial softSerial(txPin, rxPin);

void setup() {
  softSerial.begin(9600);

  // set bluetooth name
  delay(500);
  softSerial.print("AT+NAME");
  softSerial.println("SZYMON-BLE");
  delay(500);
}

void loop() {
  softSerial.println("hi!");
  delay(100);
}
