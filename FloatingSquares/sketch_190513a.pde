int i; 
float xaxis;  

void setup()
{
  size(800,800);
  xaxis = random(20.0,float(width)); 
}

void draw() 
{
 //background(0,0,0);
 if(i < 720)
 {
  pushMatrix(); 
  translate(i,sin(i+random(10,50))+xaxis);
  rotate(radians(i)); 
  rect(0,0,20,20);
  popMatrix(); 
  i++;
  
 } else {i = 0;
 xaxis = random(20,width); }
 
}
