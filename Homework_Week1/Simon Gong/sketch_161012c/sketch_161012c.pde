float a = random(100.0);

void setup(){
size(1280,720);

}

void draw(){
  background(#EDE9B6);
  
  if (mousePressed == true){
    stroke(255);
  }else{
    stroke(0);
  }
  
  for (int i=20; i<1280; i+=100)
  for (int p=20; p<1280; p+=100){
  fill(#FFFFFF);  
  ellipse(i,p,mouseX/10,mouseX/10);
  fill(#2163CB);
  ellipse(i+50,p+50,(1280-mouseX)/10,(1280-mouseX)/10);
  }
  
  strokeWeight(2);
  fill(#2163CB);
  ellipse(mouseX,mouseY,200,200);
  fill(#EAD936);
  triangle(mouseX,mouseY,0,650,200,720);
  fill(#C6223B);
  triangle(0,0,mouseX,mouseY,mouseX-100,mouseY-250);
  fill(#000000);
  triangle(0,720,mouseX,mouseY,mouseX-100,mouseY-250);
  fill(#2163CB);
  triangle(1280,0,mouseX,mouseY,mouseX-100,mouseY-250);
  fill(#EAD936);
  triangle(1280,720,mouseX,mouseY,mouseX-100,mouseY-250);
  triangle(200,0,mouseX,mouseY,mouseX-100,mouseY-250);
  triangle(300,0,mouseX,mouseY,mouseX-100,mouseY-250);
  
  noStroke();
  fill(random(255));
  ellipse(mouseX,mouseY,10+mouseX/10.0,10+mouseX/10.0);
  }