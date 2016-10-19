int ledPin = 7;
int shortPause = 500;
int longPause = 2000;

void setup() {
  pinMode(ledPin, OUTPUT);
}

void setLed(int state, int pin, int pauseTime) {
  digitalWrite(pin, state);
  delay(pauseTime);
}

void blinkLed(int pin, int pauseTime) {
  setLed(HIGH, pin, pauseTime);
  setLed(LOW, pin, pauseTime);
}

void repeatBlink(int repetitions, int pin, int pauseTime) {
  int i = 0;

  for(i = 0; i < repetitions; i = i + 1) {
    blinkLed(pin, pauseTime);
  }
}

// blink LED
void loop() {
  // - - -
  repeatBlink(3, ledPin, longPause);

  // . . .
  repeatBlink(3, ledPin, shortPause);

  // - - -
  repeatBlink(3, ledPin, longPause);
}
