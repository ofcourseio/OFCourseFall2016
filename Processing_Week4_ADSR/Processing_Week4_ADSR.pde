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
  size(400, 400);

  minim = new Minim(this);
  audioOutput = minim.getLineOut();
}

void draw() {
}

void mouseClicked() {
  audioOutput.playNote(0, 1.0, new SineInstrument(random(100, 200), 1.0));
}
