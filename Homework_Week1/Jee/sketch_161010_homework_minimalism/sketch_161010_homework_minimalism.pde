//minimalism
void setup(){
 size(600,600);
 background(255);
}
void draw(){
  //background
  fill(200,200,200);
  noStroke();
  quad(0,200,600,400,600,600,0,600);
  
  //triangle
  fill(255,255,0);
  noStroke();
  triangle(450,100,450,200,300,150);
  stroke(200);
  strokeWeight(5);
  line(450,100,450,200);
  line(450,200,300,150);

  //rectangle intside
  noFill();
  stroke(150);
  strokeWeight(3);
  rectMode(CORNERS);
  rect(220,90,380,510);
  
  //insert circle
  noStroke();
  fill(255);
  ellipse(200,400,150,150);
  
  //rectangle OUTside  
  noFill();
  stroke(150);
  strokeWeight(3);
  rectMode(CORNERS);
  rect(200,50,400,550);
  
  //Dimensional
  strokeWeight(2);
  line(201,51,220,90);
  line(399,51,380,90);
  line(399,549,380,510);
  line(201,549,220,510);
  

  

  
  
  

}