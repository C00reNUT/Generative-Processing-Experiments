// Drawing Square shapes 

int cnt; 

int matrix = 25;
int squareSize =10;
color[] color_pallete = new color[5]; 
color bg_color; 
String filename; 

void setup()
{
  cnt = 0; 
  filename = str(hour()+minute()+second()+year()); 
  GetPallette(); 
  color_pallete = darksnpink;
  bg_color = color_pallete[int(random(0,4))];
  background(bg_color); 
  size(400,400); 
  
   createGrid(); 
}

void draw()
{
 //background(bg_color); 
 createGrid(); 
 save(filename+"-"+cnt+".tiff");
}

void createGrid()
{
   // Following 
  for(int i = 0; i < matrix; i++)
  {
    for (int j = 0; j < matrix; j++)
    {
    drawSquarePattern(20, squareSize, (width/matrix)*i,(height/matrix)*j); 
    }
  }
}

void drawSquarePattern(int n, int size, int x, int y)
{
  int numberIters = int(random(0,n));
  float shapeSize = size; 
  float theta = random(1,360);
  int color_alpha = int(random(10,100)); 
  int r = int(random(0,4)); 
  
  for(int i = 0; i < numberIters; i++)
  { 
    pushMatrix(); 
     translate(x+(width/matrix)/2, y+(height/matrix)/2);
    rotate(radians(theta*i));
    stroke(255,255,255,0); 
    fill(color_pallete[r],30); 
    rectMode(CENTER); 
    rect(0, 0, shapeSize, shapeSize );
    shapeSize = shapeSize - (size * 0.2); 
    popMatrix(); 
    // save(filename+"-"+cnt+".tiff");
    cnt++; 
  }
}

void mouseClicked()
{
 save(filename+".tiff");
}
