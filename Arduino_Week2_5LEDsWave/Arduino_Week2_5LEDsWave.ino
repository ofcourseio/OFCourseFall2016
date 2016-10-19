int led1 = 0;
int led2 = 1;
int led3 = 2;
int led4 = 3;
int led5 = 4;

int button = 8;

int ledIndex = 0;
int modifier = 1;

bool shouldAnimate = false;
int prevState = 0;

void setup() {
  pinMode(led1, OUTPUT);
  pinMode(led2, OUTPUT);
  pinMode(led3, OUTPUT);
  pinMode(led4, OUTPUT);
  pinMode(led5, OUTPUT);

  pinMode(button, INPUT);
}

void loop() {
  digitalWrite(led1, LOW);
  digitalWrite(led2, LOW);
  digitalWrite(led3, LOW);
  digitalWrite(led4, LOW);
  digitalWrite(led5, LOW);

  if (shouldAnimate) {
    if (ledIndex == 0) {
      digitalWrite(led1, HIGH);
    }
    if (ledIndex == 1) {
      digitalWrite(led2, HIGH);
    }
    if (ledIndex == 2) {
      digitalWrite(led3, HIGH);
    }
    if (ledIndex == 3) {
      digitalWrite(led4, HIGH);
    }
    if (ledIndex == 4) {
      digitalWrite(led5, HIGH);
    }

    ledIndex = ledIndex + modifier;

    if (ledIndex > 4) {
      modifier = -1;
    }
    if (ledIndex < 0) {
      modifier = 1;
    }
  }

  int buttonState = digitalRead(button);

  if (buttonState == 1 && prevState == 0) {
    if (shouldAnimate == true) {
      shouldAnimate = false;
    }
    else {
      shouldAnimate = true;
    }
  }

  prevState = buttonState;

  delay(100);
}
