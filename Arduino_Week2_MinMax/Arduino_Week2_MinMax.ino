int photoresistorPin = 0;
int ledPins[] = { 8, 9, 10 };

float minValue = 1024;
float maxValue = 0;

void setup() {
  Serial.begin(9600);

  for (int i = 0; i < 3; i = i + 1) {
    pinMode(ledPins[i], OUTPUT);
  }
}

void loop() {
  float value = float(analogRead(photoresistorPin)); // 0.0 - 1024.0

  if (value < minValue) { minValue = value; }
  if (value > maxValue) { maxValue = value; }

  Serial.print(value);
  Serial.print(" | ");
  Serial.print(minValue);
  Serial.print(" | ");
  Serial.print(maxValue);

  value = value - minValue;
  value = value / (maxValue - minValue);
  value = value * 3.0;

  int result = round(value);

  Serial.print(" | ");
  Serial.println(result);

  for (int i = 0; i < 3; i = i + 1) {
    if (i < result) {
      digitalWrite(ledPins[i], HIGH);
    }
    else {
      digitalWrite(ledPins[i], LOW);
    }
  }
}
