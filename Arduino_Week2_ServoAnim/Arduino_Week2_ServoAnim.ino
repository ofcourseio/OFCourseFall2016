#include <Servo.h>

Servo servo;

int photoresistorPin = 0;

void setup() {
  int servoPin = 9;
  servo.attach(servoPin);

  Serial.begin(9600);
}

void loop() {
  int distance = 50;

  float value = analogRead(photoresistorPin);
  //  Serial.println(value);

  if (value > 900) {
    for (int i = 0; i < 5; i = i + 1) {
      servo.write(90 + distance);
      delay(200);
      servo.write(90 - distance);
      delay(200);

      distance = distance - 10;
      if (distance < 0) {
        distance = 0;
      }
    }
  }

  delay(100);
}
