color[] c_swatch = {#7c4d4c, #c93f37, #771B05, #e8785d, #d5a78e, #d26220, #ad5a26, #e98340, 
                #76370e, #b77c4e, #8a4502, #e2a864, #f5ab4f, #f9ca89,  #d2881c, #f8d55e, 
                #e5c842, #ada763, #ded98e, #d5db82, #dfe693, #447855, #17765d,  #17765d, 
                #72a89b, #238576, #8ab9c8, #8b2d40, #9e262e, #8b2328, #bf3739};
int max_iter, iter;                 
String filename; 
 SquareFlower[] flower = new SquareFlower[500];
void setup() 
{ 
  size(800,800); 
  max_iter = 500;
  for(int i = 1; i < 500; i++)
 {
  flower[i] = new SquareFlower();  
 }

  iter = 0; 
  filename = str(hour()+minute()+second()+year()); 
}
void draw() 
{
  flower[1].drawFlower(); 
 for(int i = 1; i < 500; i++)
 {
   flower[i].drawFlower(); 
 }
 save(filename+iter+".tiff"); 
iter++; 
} 

class SquareFlower
{ float x, y, start_square, len_square;
  float rotation; 
  color flower_stroke, flower_fill; 
  float alpha;  

   SquareFlower()
  {
    init(); 
  }
  
  void drawFlower() 
  {
     for(int i = 0; i <= max_iter; i++)
    {
      stroke(flower_stroke,alpha); 
      fill(flower_fill,alpha); 
      pushMatrix(); 
      translate(x,y); 
      rotate(random(0,TWO_PI)); 
      square(0,0,start_square); 
      popMatrix(); 
      start_square = start_square + 0.02;
      if (start_square > 50) { start_square = len_square; init(); } 
    }

     alpha = alpha-5; 
  }   
  
  void init()
  {
    x = random(0,width); 
    y = random(1,height); 
    flower_stroke = c_swatch[int(random(1,30))];
    flower_fill = c_swatch[int(random(1,30))]; 
    alpha =  random(0,100); 
    start_square = random(0,30);
    len_square = start_square; 
  }
}
