//draw generative static images in each of the styles: 
//minimalism, bauhaus,

//brutalism
//void setup(){
  
//  size(300,700);
//  background(0);

//}
//void draw(){
  
  
//  strokeJoin(MITER);
//  fill(255,255,255);
//  stroke(255,255,255,2);
//  strokeWeight(2);
//  rectMode(ROUND);
//  rect(40,mouseY,3,50);
//  rect(60,mouseY,3,50);
//  rect(80,mouseY,3,50);
//  rect(100,mouseY,3,50);
//  rect(120,mouseY,3,50);
//  rect(140,mouseY,3,50);
//  rect(160,mouseY,3,50);
//  rect(180,mouseY,3,50);
//  rect(200,mouseY,3,50);
//  rect(220,mouseY,3,50);
//  rect(240,mouseY,3,50);
//  rect(260,mouseY,3,50);
//  background(150,150,150,1);
  


//}

//op art

void setup(){
  size(600,600);
  background(255);
  fill(0);
  ellipseMode(CENTER);
  ellipse(300,300,80,80);

}

void draw(){

  noFill();
  stroke(0,0,0,5);
  strokeWeight(5);
  ellipse(300,300,mouseY,mouseY);

  bezier(0,300,150,300,150,mouseY,300,mouseY);
  bezier(600,300,450,300,450,mouseY,300,mouseY);

}

//color field

//void setup(){
  
//  size(500,800);
//  background(255);
  
 
//}
//void draw(){
  
//  //background(255,255,255);
//  noStroke();
//  fill((mouseY/800.0)*255.0,255-((mouseX/500)*255.0),100,1);
//  ellipse(mouseX,mouseY,200,400);
  
//}