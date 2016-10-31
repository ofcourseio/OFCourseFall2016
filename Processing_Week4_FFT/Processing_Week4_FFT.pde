import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioInput audioInput;
FFT fft;

void setup() {
  size(512, 500);

  minim = new Minim(this);

  audioInput = minim.getLineIn();

  fft = new FFT(audioInput.bufferSize(), audioInput.sampleRate());

  println("buffersize: " + audioInput.bufferSize()
  + " samplerate: " + audioInput.sampleRate());
}

void draw() {
  background(0);
  stroke(255);

  // sends values to FFT
  fft.forward(audioInput.mix);

  // draws how "vibrations" in the air look like
  for(int i = 0; i < audioInput.bufferSize() - 1; i++) {
    line(i, 50 + audioInput.left.get(i)*50, i+1, 50 + audioInput.left.get(i+1)*50);
    line(i, 150 + audioInput.right.get(i)*50, i+1, 150 + audioInput.right.get(i+1)*50);
  }

  float maxValue = 0.0;
  int maxValueIdx = 0;

  // draws FFT bands
  for(int i = 0; i < fft.specSize(); i = i + 1) {
    float amplitude = fft.getBand(i);

    // change color of big values to red
    if (amplitude > 20.0) {
      stroke(255, 0, 0);
    }
    else {
      stroke(255);
    }

    line(i, height, i, height - amplitude);

    // find max value
    if (fft.getBand(i) > maxValue) {
      maxValue = fft.getBand(i);
      maxValueIdx = i;
    }
  }

  text("max value: " + maxValue
  + " freq: " + fft.indexToFreq(maxValueIdx), 10, 210);
}
