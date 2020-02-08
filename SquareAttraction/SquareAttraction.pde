Particule[] m = new Particule[6000]; 
Attractor a;
int iter = 0; 
String filename = str(hour()+minute()+second()+year()); 
 
void setup() {
  size(800,800);
  for(int i = 0; i < m.length; i++)
  {
   m[i] =  new Particule(random(0,1),random(0,width),random(0,height));
  }
  a = new Attractor();
}
 
void draw() {
  background(255);
 
for(int i = 0; i < m.length; i++)
{
  PVector force = a.attract(m[i]);
  m[i].applyForce(force);
  m[i].update();
 
  a.display();
  m[i].display();
}
//  save(filename+"_"+iter+".tiff"); 
  iter++; 
}
