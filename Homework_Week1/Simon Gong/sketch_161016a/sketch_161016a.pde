int circlePosition=0;
 
 void setup(){
   size(1280,720);
   background(#000000);
 }
 
 void draw(){
   fill(#E3002D,10);
   rect(0,0,1280,720);
   fill(#FFFFFF);
   ellipse(mouseX,mouseY,mouseX,mouseX);
   for(int y = 0; y<= height; y=y+72){
   for(int x = 0; x<= width; x=x+128){
   ellipse(x,y,5,5);
   fill(#E3002D,20);
   strokeWeight(pmouseX/500);
   line(x,y,mouseX,mouseY);
   fill(#E3002D,10);
   bezier(x,y,mouseX,mouseY,mouseX,mouseY,640,360);
   }
   }
   
   fill(#FFFFFF);
   ellipseMode(CENTER);
   ellipse(mouseX-15,mouseY-15,10,10);
   ellipse(mouseX-15,mouseY+15,10,10);
   ellipse(mouseX+15,mouseY-15,10,10);
   ellipse(mouseX+15,mouseY+15,10,10);
   fill(#E3002D);
   ellipseMode(CENTER);
   ellipse(mouseX,mouseY,50,50);
   mouseX=mouseX-10;
   mouseY=mouseY+10;
   }
  