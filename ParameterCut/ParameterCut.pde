
float a, b, x, y, x0, y0; 
float scale_x, scale_y; 
float ina = 0; 
float i = 0; 

void setup() 
{
  a = 22;
  b = 3;
  scale_x = 6; 
  scale_y = 6; 
  x0 = scale_x*((a-b)*cos(ina)+b*cos(ina*((a/b)-1)))+(width/2);  
  y0 = scale_y*((a-b)*sin(ina)-b*sin(ina*((a/b)-1)))+(height/2);  
  size(1000,1000); 
}


void draw() 
{
  background(255,255,255); 
  stroke(1,1,1,30); 
  drawShape(); 
  /*
  x =  scale_x*((a-b)*cos(ina)+b*cos(ina*((a/b)-1)))+(width/2); 
  y =  scale_y*((a-b)*sin(ina)-b*sin(ina*((a/b)-1)))+(height/2); 
  line(x0,y0, x,y); 
  //point((5*x)+(width/2),(5*y)+(height/2)); 
 
  x0 = x; 
  y0 = y;
  ina=ina+1;
  */
} 

void drawShape() 
{
  x0 = scale_x*((a-b)*cos(i)+b*cos(i*((a/b)-1)))+(width/2);  
  y0 = scale_y*((a-b)*sin(i)-b*sin(i*((a/b)-1)))+(height/2);  
  while(i < 4000) 
  {
    x =  scale_x*((a-b)*cos(i)+b*cos(i*((a/b)-1)))+(width/2); 
    y =  scale_y*((a-b)*sin(i)-b*sin(i*((a/b)-1)))+(height/2); 
    line(x0,y0, x,y); 
    x0 = x;
    y0 = y; 
    i=i+0.5;  
  }
  b=b+0.1; 
  i = 0; 
  save(i+".jpg"); 
} 
