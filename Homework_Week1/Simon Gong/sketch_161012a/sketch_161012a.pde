float q = 400;

void setup(){
  size(1280,720);
  smooth();
  background(#000000);
  textSize(300);
  textAlign(CENTER);
}

void draw(){
  
  translate(640,360);
  float x = random(mouseX,mouseX);
  
  rotate(random(mouseX));
  beginShape();
  vertex(540,360);
  vertex(550,350);
  vertex(545,370);
  vertex(540,330);
  vertex(560,340);
  vertex(565,360);
  endShape();
  
  rotate(0);
  println(x);
  stroke(random(200),100,100);
  strokeWeight(random(0.1));
  line(0,-x,-x,0);
  line(-x,0,0,-x);
  line(0,x,x,0);
  line(-x,0,0,-x);
  
  noFill();
  strokeWeight(random(10));
  ellipse(0,0,(mouseX*400)/1280,(mouseY*400)/720);
  
  fill(#FFFFFF);
  ellipse(mouseX,mouseY,random(20),random(20));
  noStroke();
  
  fill(#FFFFFF,20);
  ellipse(0,0,random(200.0),random(200.0));
  ellipse(0,0,random(q),random(q));
 
}