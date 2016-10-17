int diameter;
int diameter2;
float offset;

void setup(){
  size(600,600);
  background(255);
}


void draw(){
  strokeWeight(15);
  fill(255);
  rect(0,0,600,600);
  for(diameter=560;diameter>90;diameter-=60){
    fill(0);
    ellipse(300,300,diameter,diameter);
  }
  for(diameter2=530;diameter>120;diameter-=60){
    fill(255);
    ellipse(300,300,diameter2,diameter2);
  }
  

  //
  noFill();
  strokeWeight(15);
  for(offset=0;offset<315;offset+=30){
    stroke(0);
    bezier(0,300-offset,300,mouseY/2-offset,300,mouseY/2-offset,600,300-offset);
  }
  for(offset=15;offset<330;offset+=30){
    stroke(255);
    bezier(0,300-offset,300,mouseY/2-offset,300,mouseY/2-offset,600,300-offset);
  }  
  
  
  //
  noFill();
  strokeWeight(15);
  for(offset=0;offset<300;offset+=30){
    stroke(0);
    bezier(0,315+offset,300,610-(mouseY/2-offset),300,610-(mouseY/2-offset),600,315+offset);
  }
  for(offset=15;offset<300;offset+=30){
    stroke(255);
    bezier(0,315+offset,300,610-(mouseY/2-offset),300,610-(mouseY/2-offset),600,315+offset);
  }
}




