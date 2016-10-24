int potentiometer1 = 5;
int potentiometer2 = 4;

void setup() {
  Serial.begin(9600);
}

void loop() {
  int value1 = analogRead(potentiometer1);
  int value2 = analogRead(potentiometer2);

  Serial.print(value1);
  Serial.print(" ");
  Serial.println(value2);

  delay(100);
}
