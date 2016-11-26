#include <Servo.h>

Servo servo;

float x = 0;

void setup() {
  int servoPin = 9;
  servo.attach(servoPin);
}

void loop() {
  float angle = ((sin(x) + 1.0) / 2.0) * 180.0;
  x = x + 0.2;

  servo.write(angle);

  delay(100);
}
