//op art
void setup(){
  size(600,600);
  background(0);

}
void draw(){
  background(0);
  translate(300,300);
  noFill();
  stroke(255,255,255,80);
  strokeWeight(3);
  //Horizontal
  bezier(-300,0,mouseX,mouseY,-mouseX,-mouseY,300,0);
  bezier(-300,10,mouseX,mouseY,-mouseX,-mouseY,300,10);
  bezier(-300,-10,mouseX,mouseY,-mouseX,-mouseY,300,-10);
  bezier(-300,30,mouseX,mouseY,-mouseX,-mouseY,300,30);
  bezier(-300,-30,mouseX,mouseY,-mouseX,-mouseY,300,-30);
  bezier(-300,50,mouseX,mouseY,-mouseX,-mouseY,300,50);
  bezier(-300,-50,mouseX,mouseY,-mouseX,-mouseY,300,-50);
  bezier(-300,100,mouseX,mouseY,-mouseX,-mouseY,300,100);
  bezier(-300,-100,mouseX,mouseY,-mouseX,-mouseY,300,-100);
  bezier(-300,200,mouseX,mouseY,-mouseX,-mouseY,300,200);
  bezier(-300,-200,mouseX,mouseY,-mouseX,-mouseY,300,-200);
  bezier(-300,300,mouseX,mouseY,-mouseX,-mouseY,300,300);
  bezier(-300,-300,mouseX,mouseY,-mouseX,-mouseY,300,-300);
  
  //Vertical
  bezier(0,-300,mouseX,mouseY,-mouseX,-mouseY,0,300);
  bezier(10,-300,mouseX,mouseY,-mouseX,-mouseY,10,300);
  bezier(-10,-300,mouseX,mouseY,-mouseX,-mouseY,-10,300);
  bezier(30,-300,mouseX,mouseY,-mouseX,-mouseY,30,300);
  bezier(-30,-300,mouseX,mouseY,-mouseX,-mouseY,-30,300);
  bezier(50,-300,mouseX,mouseY,-mouseX,-mouseY,50,300);
  bezier(-50,-300,mouseX,mouseY,-mouseX,-mouseY,-50,300);
  bezier(100,-300,mouseX,mouseY,-mouseX,-mouseY,100,300);
  bezier(-100,-300,mouseX,mouseY,-mouseX,-mouseY,-100,300);
  bezier(200,-300,mouseX,mouseY,-mouseX,-mouseY,200,300);
  bezier(-200,-300,mouseX,mouseY,-mouseX,-mouseY,-200,300);
  bezier(300,-300,mouseX,mouseY,-mouseX,-mouseY,300,300);
  bezier(-300,-300,mouseX,mouseY,-mouseX,-mouseY,-300,300);
  
  ellipse(0,0,mouseX,mouseX);
  ellipse(0,0,mouseX-150,mouseX-150);
  ellipse(0,0,mouseX-100,mouseX-100);
  ellipse(0,0,mouseX-50,mouseX-50);
  ellipse(0,0,mouseX+50,mouseX+50);
  ellipse(0,0,mouseX+100,mouseX+100);

}


//bezierDetail()
//Examples  
// Move the mouse left and right to see the detail change

//void setup() {
//  size(100, 100, P3D);
//  noFill();
//}

//void draw() {
//  background(204);
//  int d = int(map(mouseX, 0, 100, 1, 20));
//  bezierDetail(d);
//  bezier(85, 20, 10, 10, 90, 90, 15, 80);
//}