void setup(){
  size(500,500);
  background(255);
 frameRate(60);
}

void draw(){

rectMode(CORNER);
fill(0);
rect(0,0,500,500);
noStroke();
fill(255,50);
bezier(0,250,mouseX,mouseX,mouseX,mouseX,250,250);
bezier(0,220,mouseX+10,mouseX+10,mouseX+10,mouseX+10,220,250);
bezier(0,190,mouseX+20,mouseX+20,mouseX+20,mouseX+20,190,250);
bezier(0,160,mouseX+30,mouseX+30,mouseX+30,mouseX+30,160,250);

bezier(250,250,500-mouseX,500-mouseX,500-mouseX,500-mouseX,500,250);
bezier(280,250,500-mouseY-10,500-mouseY-10,500-mouseY-10,500-mouseY-10,500,220);
bezier(310,250,500-mouseY-20,500-mouseY-20,500-mouseY-20,500-mouseY-20,500,190);
bezier(340,250,500-mouseY-30,500-mouseY-30,500-mouseY-30,500-mouseY-30,500,160);