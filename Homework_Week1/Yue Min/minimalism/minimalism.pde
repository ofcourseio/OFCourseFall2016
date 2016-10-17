int i=1;
void setup(){
  size(500,800);
  background(0);
 frameRate(10);
}

void draw(){
  noStroke();
  ellipseMode(CENTER);
  fill(255,10);
  ellipse(250,mouseY,mouseX,mouseX);
}