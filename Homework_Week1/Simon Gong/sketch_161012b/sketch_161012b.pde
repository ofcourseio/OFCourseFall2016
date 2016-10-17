void setup(){
size(1280,720);
background(#000000);
}

void draw(){
float a=mouseX;
float b=mouseY;
float c=1280-mouseX;
float d=720-mouseY;
float e=640-mouseX;
float f=360-mouseY;

stroke(#FFFFFF);
fill(#000000);
strokeWeight((mouseX/256));

ellipse(a,b,e,e);
ellipse(c,d,e,e);
ellipse(a,d,e,e);
ellipse(c,b,e,e);

point(a,b);
point(c,d);
point(c,b);
point(a,d);
}