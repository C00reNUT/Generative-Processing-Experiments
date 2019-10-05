int cnt = 1; 
color[] color_pallete = new color[5]; 

// Chapter 3 The Wrong Way to draw a line 

void setup() {
  background(0); 
  size(800,800); 
  strokeWeight(0.5); 
  GetPallette(); 
  color_pallete = outdoors;
  smooth(); 
}


void draw() {
  background(0);  
//staccatoRefinedDrawing();
for (int i = 0; i < 100; i++)
{
drawNoisySpirals(); 
}
//for(int i = 1; i <=100; i++)
//{
//  drawSimpleCircle(random(100,700),random(100,700), 50,1440,0.1); 
//}
//stop(); 
save(cnt+".tiff"); 
cnt++; 
}


    
void drawSimpleCircle(float x, float y,  float radius, int angleTotal, float radialStep)
{
    float centX = x ; 
    float centY = y; 
    
    stroke(20,50,70,25); 
    float lastx = -999; 
    float lasty = -999; 
  
   for(float ang = 0; ang <= angleTotal; ang +=5) 
  {
    radius += radialStep; 
    float rad = radians(ang); 
    x = centX + (radius * cos(rad)); 
    y = centY + (radius * sin(rad)); 
    point(x,y);
  }
}

void drawNoisySpirals()
{
  
  float radius = random(40,60);
  float x, y;
  float lastx = -999;
  float lasty = -999;
   float centX = width/2 ; 
  float centY = height/2; 
  float radiusNoise = random(10);
  float randRadius = random(0.1,0.5); 
  
  for (float ang = 0; ang <= 2880; ang += 5) {
    
     stroke(color_pallete[int(random(0,5))],random(0,100)); 
  radiusNoise += 0.3;
  radius += randRadius;
   float thisRadius = radius + (noise(radiusNoise) * 200) - 100;
  float rad = radians(ang);
   x = centX + (thisRadius * cos(rad));
   y = centY + (thisRadius * sin(rad));
   
   if (lastx > -999) {
  line(x,y,lastx,lasty);
   }
  lastx = x;
  lasty = y;
 }
}
