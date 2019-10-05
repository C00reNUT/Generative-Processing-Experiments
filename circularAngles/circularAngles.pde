

int i = 0; 
int circleSize = 50; 
int rows = 10; 
int col = 10; 
int margin;
float segmentX, segmentY, radX, radY; 
void setup()
{
  background(50); 
  size(800, 800); 
  segmentX = width / (col+1);
  segmentY = height /(rows+1); 
  margin = 0;
}

void draw()
{
  background(50); 
  for (int x = 0; x <= rows; x++)
  {
    for (int y = 0; y <= col; y++)
    {
      radX = radians(i); 

      fill(255, 255, 255, i); 
      circle(x*segmentX+(segmentX/2), y*segmentY+(segmentY/2), (i*sin(i)/4)); 
      //radY = radians(i*(x+y)); 
      fill(255, 255, 255); 
      arc(x*segmentX+(segmentX/2), y*segmentY+(segmentY/2), circleSize, circleSize, radians(1), radX);
    }
  }
  i = itern(i, margin);
  
  
}


int itern(int i, int xy)
{
  if (i < 360) 
  {
    i++;
  }
  if (i > 360) 
  {
    i=0;
  }

  return i;
}
