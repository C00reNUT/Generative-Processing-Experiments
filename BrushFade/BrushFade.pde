
ArrayList<Brush> brushes; 
boolean dither = false; 
boolean finished = false; 
void setup()
{
  background(0,0,0); 
  size(3000,3000); 
  brushes = new ArrayList<Brush>(); 
}


void keyPressed() {
  if (key == 's') saveImage();
  if (key == 'a') 
  {
    dither =  dither == true ? false :  true; 
    finished = finished == true ? false: true; 
  }
  if (key == 'd') createMatrix(brushes); 
}

void saveImage() {
  String timestamp = year() + nf(month(), 2) + nf(day(), 2) + "-"  + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2);
  saveFrame(timestamp+".png");
}

void ditherPic()
{
  stroke(1); 
  strokeWeight(1); 
  for(int i = 0; i < 100; i++)
  {
    
  point(random(0,width),random(0,height)); 
  }
}

void createMatrix(ArrayList<Brush> pointState)
{
  float xa, ya;
  float xb = 0; 
  float yb = 0; 
  float between = 0; 
  float r; 
  for(Brush b : pointState)
  {
    xa = b.x; 
    ya = b.y; 
    
    if(yb == 0)
    {
      xb = xa; 
      yb = ya; 
    } else 
    {
      between = dist(xa, ya, xb, yb); 
      strokeWeight(map(between, 0, height, 1,2)); 
      stroke(255,255,255,map(between, 0, height, 255,1)); 
      line(xa, ya, xb, yb); 
      r = random(0,10);
      ellipse(xa, ya, r, r);
    }
    xb = xa; 
    yb = ya; 
   
  }
  
}

void draw() 
{
  //background(255,255,255); 
  if (finished == false)
  {
    while(brushes.size() < 100)
    {
     Brush b = new Brush(random(0, height), random(0,width)); 
     brushes.add(b); 
    }
    
    for(int i=0; i < brushes.size()-1; i++)
    {
      Brush b = brushes.get(i);
      b.update(); 
      b.show(); 
      if(b.r == 0) brushes.remove(i); 
    }
  }
  if(dither) ditherPic(); 
}
