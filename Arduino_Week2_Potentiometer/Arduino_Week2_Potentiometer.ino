int potentiometer = 5;
int led = 2;

void setup() {
  pinMode(led, OUTPUT);
}

void loop() {
  int value = analogRead(potentiometer);

  if (value >= 512) {
    digitalWrite(led, HIGH);
  }
  else {
    digitalWrite(led, LOW);
  }

  delay(20);
}
