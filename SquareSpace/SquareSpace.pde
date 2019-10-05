//-----------------------------------------
//-- Title: Grid generation 2.0 (w/ sound inserted
//-- Date: 26/01/2019 1:23 
//-- Author: Christopher Ried
//-- Purpose: 
//-----------------------------------------

  

import processing.sound.*;
AudioIn in;

int choice = 1; 
int square = 60;  
int count = 1; 
int min = 1200;
int max = 1000; 
boolean generateImages = false; 

void settings()
{
  size(min,max);
}
 

void setup()
{
 noStroke(); 
 // Create the Input stream
  in = new AudioIn(this, 0);
  in.play(); 
}

void draw()
{
  for(int y = 0; y <= square; y = y + 1)
  {
    for (int x = 0; x <= square; x = x + 1)
    {
      choice = int(random(1,3)); 
      
      if(choice == 1)
      {
      generatePoints(x,y); 
      }
      else
      {
        generateSquares(x,y);
      }
    }
  }
  //square = int(random(1,100));
 if(generateImages) {save(count+".jpg");}
 
  count++; 
  
}


// Extra functions to generate various shapes
void generateEllipse(int x,int y)
{
   fill(0, random(50, 255), random(50, 255), random(0, 255));
   ellipse(int((width/square)*x), int((height/square)*y), random(1,width/square),random(1,width/square)); 
}

void generateSquares(int x, int y)
{
  float randomSize = random(0,width/20); 
  fill(random(50, 255),0, random(50, 255), 5);
  rect((width/square)*x, (height/square)*y, randomSize, randomSize); 
}

void generatePoints(int x, int y)
{
  point(int((width/square)*x),int((height/square)*y)); 
}

void generateRandomPoints()
{
  point(random(1,height),random(1, width)); 
}
