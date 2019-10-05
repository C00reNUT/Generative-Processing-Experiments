void setup() 
{
  smooth(); 
  size(1600,800); 
}

void draw()
{
  PVector a = new PVector(width/2, height/2); 
  CreateMonster(a, 100000, 5, 0); 
  stop(); 

}


void CreateMonster(PVector p, int n, int length, int adj )
{ PVector p1 = new PVector(); 
     float lengths = length; 
 
   while(n > 0)
   {
     random(0,4); 
     switch(int(random(0,4))) {
     case 0:
     //left
     p1.x = p.x - lengths; 
     p1.y = p.y-adj; 
     break; 
     case 1: 
     // right
     p1.x = p.x + lengths; 
     p1.y = p.y + adj; 
     break; 
     case 2:
     // up
     p1.x = p.x - adj; 
     p1.y = p.y - lengths; 
     break; 
     case 3:
     //down 
     p1.x = p.x + adj; 
     p1.y = p.y + lengths; 
     break; 
     }
     
     if(HitBoundary(p1))
   {p1.x = width /2; 
     p.x = width / 2; 
   p1.y = height / 2; 
   p.y = height / 2;
 } 
     line(p.x, p.y, p1.x, p1.y); 
     p.x = p1.x; 
     p.y = p1.y; 
     n--; 
   }
  
}

boolean HitBoundary(PVector coord)
{
  boolean res = false;
  if(coord.x > width || coord.x < 0 || coord.y > height || coord.y < 0)
  {res = true;} 
  
  return res; 
}
