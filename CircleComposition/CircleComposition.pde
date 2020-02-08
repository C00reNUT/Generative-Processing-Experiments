import controlP5.*;
ControlP5 cp5;

float r, alpha, xcal, ycal; 
int i, bg_iter, space_size; 
int count = 0;
int insideCount = 0;
int count_global = 0; 
int size  = 50; 
boolean isInsideA; 


color[] color_pallette = new color[5]; 
int[] x = new int[3]; 
int[] y = new int[3]; 
float select = 0; 

void setup()
{
  cp5 = new ControlP5(this);
  
  // add a horizontal sliders, the value of this slider will be linked
  // to variable 'sliderValue' 
  cp5.addSlider("size")
     .setPosition(width - 200,height - 100)
     .setRange(0,width);
  
  space_size = size; 
  GetPallette(); 
  color_pallette = redblue; 
  //bg_iter = int(random(0,4)); 
  background(0,0,0); 
  size(1000,1000); 
  inDrawArea(space_size); 
}

void draw() 
{
   space_size = size; 
  drawPointsInArea(200);
  //drawCircle(); 
  //drawTriangle(100); 
  count_global++; 
}

void inDrawArea(int size)
{
  int shift_x = int(random(0,width)); 
  int shift_y = int(random(0,height))
  ; 
  for(int i = 0; i < 3; i++)
  {
    x[i] = int(random(0,size))+shift_x; 
    y[i] = int(random(0,size))+shift_y; 
  }
}



void drawTriangle(int size)
{ 
  
  if(count_global % 1 == 0)
  {
     r = random(1,100); 
    alpha = random(0,100); 
    i =int(random(1,a.length)); 
    fill(color_pallette[i],alpha); 
    stroke(color_pallette[i],alpha); 
 
    float shift_x = random(0,width); 
    float shift_y = random(0,height); 
    triangle(random(0,size)+shift_x,random(0,size)+shift_y,random(0,size)+shift_x,random(0,size)+shift_y,random(0,size)+shift_x,random(0,size)+shift_y);
  }

}

void drawCircle()
{
  r = random(1,100); 
  alpha = random(0,100); 
  i =int(random(1,a.length)); 
  fill(color_pallette[i],alpha); 
  stroke(color_pallette[i],alpha); 
  ellipse(random(1,height), random(1,width), r,r);
}

void drawPoints()
{
  while(count < 100) 
  {
    if(count % 10 == 0)
   {stroke(color_pallette[3],10);}
   else{stroke(a[4],int(random(0,100)));}
  point(random(1,width), random(1,height)); 
  count++; 
  }
  count = 0; 
}

void drawPointsInArea(int pointCount)
{
  int xcal = int(random(min(x),max(x))); 
  int ycal = int(random(min(y),max(y)));
  if(isInside(x[0],y[0],x[1],y[1],x[2],y[2],xcal,ycal))
  {
    stroke(color_pallette[int(select)]);
    point(xcal, ycal);
    insideCount++; 
  }
  if(insideCount == pointCount) //|| bg_iter == int(select)
  {
    inDrawArea(space_size); 
    insideCount = 0;
    select = random(0,4); 
    print("Finished 1000 points: ",select,"\n"); 
    save(hour()+minute()+second()+year()+".tiff"); 
  }
}


boolean isInside(int x1, int y1, int x2, int y2, int x3, int y3, int x, int y) 
{    
   /* Calculate area of triangle ABC */
   float A = TriangleArea (x1, y1, x2, y2, x3, y3); 
  
   /* Calculate area of triangle PBC */   
   float A1 = TriangleArea (x, y, x2, y2, x3, y3); 
  
   /* Calculate area of triangle PAC */   
   float A2 = TriangleArea (x1, y1, x, y, x3, y3); 
  
   /* Calculate area of triangle PAB */    
   float A3 = TriangleArea (x1, y1, x2, y2, x, y); 
    
   /* Check if sum of A1, A2 and A3 is same as A */ 
   return (A == A1 + A2 + A3); 
} 


float TriangleArea(int x1, int y1, int x2, int y2, int x3, int y3)
{
  return abs((x1*(y2-y3) + x2*(y3-y1)+ x3*(y1-y2))/2.0); 
}

void keyPressed()
{
  if (key == UP)
  {
   
  }
}


void mouseClicked()
{
  inDrawArea(space_size); 
    insideCount = 0;
    select = random(0,4); 
    print("Finished 1000 points: ",select,"\n"); 
}
