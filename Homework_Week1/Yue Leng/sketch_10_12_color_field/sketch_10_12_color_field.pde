void setup(){
  size(800,800);
}

void draw(){
  fill(103,72,113);
  
  ellipseMode(CENTER);
  noStroke();
  fill((mouseY/800.0)*106.0,69,118,20);
  ellipse(mouseX,mouseY,100,100);
  
  fill((mouseY/800.0)*213.0,46,98,50);
  ellipse((mouseX+140),(mouseY+140),200,40);
  
  fill((mouseY/800.0)*248.0,218,247,20); 
  ellipse((mouseX+300),(mouseY+300),140,140);
  
  fill((mouseY/800.0)*58.0,194,211,20); 
  ellipse((mouseX+600),(mouseY+600),500,500);
}