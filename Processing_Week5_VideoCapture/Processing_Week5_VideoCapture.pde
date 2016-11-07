import processing.video.*;

Capture video;

void setup() {
  size(640, 480);

  video = new Capture(this, 640, 480);
  video.start();
}

PImage processVideo(PImage input) {
  PImage output = createImage(640, 480, ARGB);

  int w = 640;
  int h = 480;

  for (int i = 0; i < input.pixels.length; i = i + 1) {
    int y = int(i / w);
    int x = i - y * w;

    if (x > 100 && x < w - 100 && y > 100 && y < h - 100) {
      float br = brightness(input.pixels[i]); // 0.0 - 255.0
      //float r = red(input.pixels[i]);
      //float g = green(input.pixels[i]);
      //float b = blue(input.pixels[i]);

      if (br > 150) {
        output.pixels[i] = color(255);
      }
      else {
        output.pixels[i] = color(0);
      }
    }
    else {
      output.pixels[i] = input.pixels[i];
    }
  }

  return output;
}

void draw() {
  PImage processedImage = processVideo(video);

  if (mousePressed) {
    image(video, 0, 0);
  } else {
    image(processedImage, 0, 0);
  }
}

void captureEvent(Capture camera) {
  camera.read();
}
