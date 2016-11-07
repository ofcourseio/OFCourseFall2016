import processing.video.*;
import gab.opencv.*;

Capture video;
OpenCV opencv;

void setup() {
  size(640, 480);

  video = new Capture(this, 640, 480);
  opencv = new OpenCV(this, 640, 480);

  video.start();
}

void draw() {
  background(0);

  //opencv.useColor();
  opencv.loadImage(video);

  /*
    opencv.invert()
    opencv.threshold(int)
    opencv.blur(int, int)
    opencv.contrast(float)
    opencv.dilate()
    opencv.erode()
  */

  opencv.findCannyEdges(20, 80);

  for (int i = 0; i < 3; i++) {
    opencv.dilate();
  }

  PImage processedImage = opencv.getSnapshot();

  image(processedImage, 0, 0);
}

void captureEvent(Capture camera) {
  camera.read();
}
