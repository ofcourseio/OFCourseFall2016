import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioOutput audioOutput;

class SineInstrument implements Instrument {
  Oscil oscil;
  ADSR adsr;

  SineInstrument(float frequency, float amplitude) {
    oscil = new Oscil(frequency, amplitude, Waves.SINE);
    // float maxAmp,
    // float attTime,
    // float decTime,
    // float susLvl,
    // float relTime
    adsr = new ADSR(0.5, 0.01, 0.1, 0.2, 0.7);

    oscil.patch(adsr);
  }

  void noteOn(float duration) {
    adsr.noteOn();
    adsr.patch(audioOutput);
  }

  void noteOff() {
    adsr.unpatchAfterRelease(audioOutput);
    adsr.noteOff();
  }
}

void setup() {
  size(200, 600);

  minim = new Minim(this);
  audioOutput = minim.getLineOut();
}

int x = 0;

void circle(float x, float y, float r) {
  ellipse(x, y, r, r);
}

void drawSineCircle(int n) {
  int circleSize = 20;

  for (int i = 0; i < n; i = i + 1) {
    float speedModifier = 10.0 + i * 20;
    float circlePositionX = sin(x / speedModifier) * width / 2 + width / 2;
    float circlePositionY = (height / (n + 1)) * (i + 1);

    fill(100);

    if (int(circlePositionX) == width / 2) {
      fill(255, 0, 0);

      audioOutput.playNote(0, 0.5, new SineInstrument(200 + 50 * i, 0.5));
    }

    circle(circlePositionX, circlePositionY, circleSize);
  }

  x = x + 1;
}

void draw() {
  background(255);

  drawSineCircle(20);
}
