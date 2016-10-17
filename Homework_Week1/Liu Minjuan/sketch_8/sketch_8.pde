int x=100;
int y=20;

void setup(){
  size(600,600);
  background(255);
}

void draw(){
  noStroke();
  fill(200);
  triangle(mouseX,mouseY,mouseX+x,mouseY+x,mouseX-x,mouseY+x);
  fill(0);
  triangle(mouseX,mouseY+y,mouseX+x-y*2,mouseY+x-y,mouseX-x+y*2,mouseY+x-y);
  
}







