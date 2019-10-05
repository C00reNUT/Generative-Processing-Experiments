
void drawSimpleSine()
{
float xstep = 1; 
float lastx = -999; 
float lasty = -999;
float angle = 0; 
float y = 50; 
float ystart = random(20,width-20); 

for (int x = 20; x<= width; x+=xstep)
{
  
  float rad = radians(angle); 
  //y = width/2 + (sin(rad)*40); 
  //y = width/2 + (pow(sin(rad),3)*30); 
  //y = width/2 + (pow(sin(rad), 3) * noise(rad*2) * 30);
  y = ystart + (customRandom() * 60);
  if(lastx > -999)
  {
    line(x,y, lastx, lasty); 
  }
  lastx=x; 
  lasty=y; 
  angle++; 
}
}

float customRandom()
{
  float retValue = 1-pow(random(1),5); 
  return retValue; 
}

void staccatoRefinedDrawing() 
{
    float xstep = 10;
  float ystep = 10;
  float lastx = 20;
  float lasty = 50;
  float y = 50;
  for (int x=20; x<=480; x+=xstep) {
   ystep = random(20) - 10;  //range -10 to 10
   y += ystep;
    line(x, y, lastx, lasty);
    lastx = x;
    lasty = y; }
}

void staccatoDrawing() 
{
  int step = 10; 
  float y = 50; 
  float lastx = -999; 
  float lasty = -999;
  int borderx = 20; 
  int bordery = 10; 
  
  
  for (int x = borderx; x <= width-borderx; x+=step)
  {
    y = bordery + random(height-2*bordery); 
    if(lastx > -999) { line(x, y, lastx, lasty); }
    
    lastx = x; 
    lasty = y; 
  }
}


void PerlinNoiseLine() 
{
  stroke(20,50,70); 
  int step = 1; 
  float lastx = -999; 
  float lasty = -999;
  
  float ynoise = random(10); 
  float y; 
  for (int x = 20; x <= 480; x+=step) { 
    y = 10 + noise(ynoise)*80; 
    
    if(lastx > -999) {
      line(x,y,lastx,lasty); 
    }
    lastx = x;
    lasty = y; 
    ynoise += 0.03; 
  }
}
