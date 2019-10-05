//-----------------------------------------
//-- Title: Random square generation 
//-- Date: 26/01/2019 1:23 
//-- Author: Christopher Ried
//-- Purpose: 
//-----------------------------------------


int square = 3;  
int count = 1; 
int min = 600;
int max = 600; 


void settings()
{
  size(min,max);
  
}
 

void setup()
{
 
}

void draw()
{
  for(int y = 0; y <= square; y = y + 1)
  {
    for (int x = 0; x <= square; x = x + 1)
    {
      generatePoints(); 
      generateEllipse(x,y);
      generateSquares(x,y); 
    }
  }
  square = int(random(1,40));
  save(count+".jpg");
  count++; 
  
}


void generateEllipse(int x,int y)
{
  
   fill(0, random(50, 255), random(50, 255), random(0, 255));
   ellipse(int((width/square)*x), int((height/square)*y), random(1,width/square),random(1,width/square)); 
   
}

void generateSquares(int x, int y)
{
  fill(random(50, 255),0, random(50, 255), random(0, 255));
      rect((width/square)*x, (height/square)*y, width/square, height/square); 
}

void generatePoints()
{
  point(random(1,height),random(1, width)); 
}
