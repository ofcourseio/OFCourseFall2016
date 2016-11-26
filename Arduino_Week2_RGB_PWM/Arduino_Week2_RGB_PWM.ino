int pwmLedPins[] = { 3, 5, 6 };
float modifiers[] = { 0.0, 1.5, 3.0 };
int potentiometerPin = 0;

void setup() {
  for (int i = 0; i < 3; i = i + 1) {
    pinMode(pwmLedPins[i], OUTPUT);
  }
}

void loop() {
  float value = analogRead(potentiometerPin);
  value = value / 1024.0;

  for (int i = 0; i < 3; i = i + 1) {
    float brightness = ((sin(modifiers[i]) + 1.0) / 2.0) * 255;
    modifiers[i] = modifiers[i] + value;
    analogWrite(pwmLedPins[i], brightness);
  }

  delay(10);
}
