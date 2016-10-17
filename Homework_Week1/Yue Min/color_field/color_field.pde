int i=1;
void setup(){
  size(500,800);
  background(0);
 frameRate(10);
}

void draw(){

  
  //1.Color Field
  
ellipseMode(CENTER);
noStroke();
fill(mouseX/500.0*255,0,mouseY/800.0*255,4);
ellipse(mouseX,mouseY,mouseY,mouseY);
ellipse(mouseX,mouseY,500-mouseX,500-mouseX);

}