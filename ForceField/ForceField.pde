int size = 15; 
int segments =  5;  
float x, y; 
void setup()
{
  background(0,0,0); 
  smooth();
  size(800,800);
  //generateDrawingField(); 
}

void draw()
{
  background(0,0,0); 
  fill(255,255,255,120); 
  stroke(255,255,255,20); 
   generateDrawingField();
}

void generateDrawingField()
{
for(int i=1; i <= 1; i++) {
  for(int j = 1; j <= width; j++){
  x = i+j;
  y = (sin(x)*height/2)+height/2; 
    if(i % 1 == 0) {
    RotateText(x,y); 
    }
  }
}
print("DONE!");
}

void RotateText(float x, float y)
{
   pushMatrix();
      translate(x,y);
      rotate(radians(random(0,360))); 
      textSize(30); 
      text("C",0,0); 
      popMatrix(); 
}

void RotatePoint(float x, float y)
{
   pushMatrix();
      translate(x,y);
      rotate(radians(random(0,180))); 
      //textSize(random(10,30)); 
      //text("C",x,y); 
      point(x,y); 
      popMatrix(); 
}
