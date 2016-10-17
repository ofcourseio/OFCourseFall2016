void setup(){
  size(600,600);
  background(178,0,0);
}

void draw(){
  if(mouseX<width-mouseX){
    noStroke();
    fill(178,0,0);
    rect(0,0,600,600);
    strokeWeight(30);
    stroke(0,0,139);
    line(mouseX,0,mouseX,600);
    strokeWeight(10);
    stroke(255,165,0);
    line(600-mouseX,0,600-mouseX,600);
    
  }
  if(mouseX>width-mouseX){
    noStroke();
    fill(255,165,0);
    rect(0,0,600,600);
    strokeWeight(30);
    stroke(178,0,0);
    line(mouseX,0,mouseX,600);
    strokeWeight(10);
    stroke(0,0,139);
    line(600-mouseX,0,600-mouseX,600);
  }
    
}







