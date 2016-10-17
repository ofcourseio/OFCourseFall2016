void setup(){
  size(600,600);
  background(255);
}


void draw(){
  fill(255);
  rect(0,0,600,600);
  line(0,100,mouseX,mouseY);
  line(mouseX,mouseY,600,100);
  line(0,500,mouseX,mouseY+100);
  line(mouseX,mouseY+100,600,500);
  line(mouseX,mouseY,mouseX,mouseY+100);


}




