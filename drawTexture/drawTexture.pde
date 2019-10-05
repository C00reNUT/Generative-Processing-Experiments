float xstart, xnoise, ynoise; 
int cnt; 
boolean saveImages = false; 

void setup() {
     size(800,800); 
     smooth(); 
     background(255);
      xstart = random(10); 
      xnoise = xstart; 
      ynoise = random(10); 
      cnt = 0; 
     

}

void draw()
{
  background(255);
       for(int y = 0; y <= height; y+= 5) {
     ynoise += 0.1; 
     xnoise = xstart; 
     for (int x = 0; x <= width; x+=5) {
       xnoise += 0.1; 
       //drawPoint(x,y,noise(xnoise,ynoise)); 
       drawBlobs(x,y,noise(xnoise,ynoise)); 
      //drawLines(x,y,noise(xnoise,ynoise)); 
      cnt++; 
     }
  }
  
  if(saveImages) {save(cnt+".tiff");}
}


  void drawPoint(float x, float y, float noiseFactor) {
 float len = 10*noiseFactor; 
 ellipse(x, y, len,len); 
  }
  
  void drawLines(float x, float y, float noiseFactor) { 
   pushMatrix(); 
   translate(x,y); 
   rotate(noiseFactor * radians(360)); 
   stroke(0,150); 
   line(0,0,20,0); 
   popMatrix(); 
  }
  
  void drawBlobs(float x, float y, float noiseFactor) { 
    pushMatrix(); 
    translate(x,y); 
    rotate(noiseFactor * radians(650)); 
    float edgeSize = noiseFactor * 35; 
    float grey = 150 + (noiseFactor * 120); 
    float alph = 150 + (noiseFactor * 120); 
    noStroke(); 
    fill(grey, alph); 
    ellipse(0,0,edgeSize, edgeSize/2); 
    popMatrix();
  }
