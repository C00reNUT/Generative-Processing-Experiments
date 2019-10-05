int n = 0; 
int count = 50; 


// Need to click on the board in order to see a stream of points drawn 
void setup()
{
  size(400,400); 
}

void draw()
{
  
  drawIter(width, height); 

}


void drawIter(int x, int y)
{
  n++;
  while(n < count)
  {
    point(x / (n+1), y / (n+1)); 
    drawIter(x, y);  
  }
}

void mouseClicked()
{
  n = 0; 
 drawIter(mouseX, mouseY);  
}
