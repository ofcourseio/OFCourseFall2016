
void setup(){
  size(500,500);
  background(255);
 frameRate(60);
}

void draw(){


//success 1
ellipseMode(CENTER);
ellipse(mouseX,mouseY,mouseX/5,mouseX/5);
ellipse(500-mouseX,500-mouseY,mouseX/5,mouseX/5);



}