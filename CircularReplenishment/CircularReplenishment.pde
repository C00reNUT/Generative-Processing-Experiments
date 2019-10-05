
int particles = 500 ; 
int cnt; 
Particle[] h1;

void setup()
{
  background(0,0,0); 
 size(1000,1000);  
 h1 = new Particle[particles];

 for(int i = 1; i < particles; i++)
 {
   h1[i] = new Particle();
 }
}

void draw()
{
   background(0,0,0); 
      for(int i = 1; i < particles; i++)
   {
     h1[i].update();
   }
}
