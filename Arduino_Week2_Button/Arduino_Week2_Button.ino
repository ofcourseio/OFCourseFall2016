int button1 = 8;

int led1 = 0;
int led2 = 1;
int led3 = 2;

void setup() {
  pinMode(button1, INPUT);

  pinMode(led1, OUTPUT);
  pinMode(led2, OUTPUT);
  pinMode(led3, OUTPUT);

  //  Serial.begin(9600);
}

void loop() {
  int value = digitalRead(button1);

  if (value == 1) {
    digitalWrite(led1, HIGH);
    digitalWrite(led2, HIGH);
    digitalWrite(led3, HIGH);
  }
  else {
    digitalWrite(led1, LOW);
    digitalWrite(led2, LOW);
    digitalWrite(led3, LOW);
  }

  //  Serial.println(value);
  delay(100);
}
