int potentiometer = 5;

void setup() {
  Serial.begin(9600);
}

void loop() {
  int value = analogRead(potentiometer);

  Serial.println(value);

  delay(100);
}
