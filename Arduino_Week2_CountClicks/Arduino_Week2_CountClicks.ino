int led1 = 0;
int led2 = 1;
int led3 = 2;

int button = 8; // pin where button is connected
int prevButtonState = 0;

int clicks = 0;

void setup() {
  pinMode(led1, OUTPUT);
  pinMode(led2, OUTPUT);
  pinMode(led3, OUTPUT); // "sending electricity"

  pinMode(button, INPUT); // "reading electricty"
}

void loop() {
  int buttonState = digitalRead(button); // 0 -> not clicked, 1 -> clicked;

  if (buttonState == 1 && prevButtonState == 0) {
    clicks = clicks + 1;
  }

  prevButtonState = buttonState;

  if (clicks == 4) {
    clicks = 0;
  }

  if (clicks == 0) {
    digitalWrite(led1, LOW);
    digitalWrite(led2, LOW);
    digitalWrite(led3, LOW);
  }
  if (clicks == 1) {
    digitalWrite(led1, HIGH);
    digitalWrite(led2, LOW);
    digitalWrite(led3, LOW);
  }
  if (clicks == 2) {
    digitalWrite(led1, HIGH);
    digitalWrite(led2, HIGH);
    digitalWrite(led3, LOW);
  }
  if (clicks == 3) {
    digitalWrite(led1, HIGH);
    digitalWrite(led2, HIGH);
    digitalWrite(led3, HIGH);
  }

  delay(50);
}
