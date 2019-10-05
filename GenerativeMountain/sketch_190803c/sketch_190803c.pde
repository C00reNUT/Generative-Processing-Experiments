

import processing.pdf.*;
import java.util.Calendar;

boolean savePDF = false;
boolean savePicture = false; 
int cont = 1; 
float iter = 10; 
int n = 1; 


void setup() {
  size(1200, 1200);
  smooth();
  
   // line
   noStroke(); 
  //stroke(255,255,255,100);
  //strokeWeight(1);
  //strokeJoin(ROUND);
  //noFill();
}

void draw() {
  if(n==1 || cont == 1) {
     background(0); 
    drawShapes(); 
  }
}

void drawShapes()
{
  for (int n = 1; n <= width; n+=30)
  {
     fill(255,208,168,5); 
    noiseSeed((int) random(100000));
      int noiseXRange = mouseX/10;
    println("noiseXRange: 0-"+noiseXRange);
    
    beginShape();
    for (int x = 0; x < width; x+=10) {
      float noiseX = map(x, 0,width, 0,3);
      float y = noise(noiseX) * height/iter;   
      vertex(x,y+n);
    }
    vertex(width,height); 
    vertex(0,height); 
    endShape();
  }
  n = 0; 
  if(savePicture){ saveFrame(timestamp()+"_####.png"); } 
}


void mouseReleased() {
  noiseSeed((int) random(100000));
  n = 1; 
}

void keyReleased() {  
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_####.png");
  if (key == 'p' || key == 'P') savePDF = true;
}

String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}
