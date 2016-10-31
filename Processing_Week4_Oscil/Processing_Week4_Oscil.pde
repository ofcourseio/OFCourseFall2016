import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioOutput audioOutput;
Oscil oscil;

void setup() {
  minim = new Minim(this);
  audioOutput = minim.getLineOut();

  float freq = 440;
  float amplitude = 1.0;

  oscil = new Oscil(freq, amplitude, Waves.SINE);

  oscil.patch(audioOutput);
}

void draw() {
}