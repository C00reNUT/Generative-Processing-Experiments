 import java.util.Iterator; 
 People p; 
 ArrayList<People> ps; 
 int iter = 0; 
 String newFile; 
 int sec, min, hr; 
 
 // Colors of each code 
 color infected_col = color(255,0,0); 
 color clear_col = color(0,255,255); 
 color recover_col = color(0,255,0); 
 color death_col = color(0,0,0); 


 // Starting parameters 
 int n = 500;
 int side = 10; 
 int infected_num, recovered_num; 
 
 
 
void setup() 
{
  size(600,600);
  ps = new ArrayList(); 
  addPeople(); 
}

void draw() 
{
  background(255); 
  Iterator<People> pit = ps.iterator(); 
  while (pit.hasNext())
  {
    People vi = pit.next(); 
    Iterator<People> pit2 = ps.iterator(); 
    
    while(pit2.hasNext())
    {
      People vit = pit2.next();
      if(vi.clr == infected_col && vit.clr != recover_col && vi.x > vit.x && vi.x < vit.x+side && vi.y > vit.y && vi.y < vit.y+side)
      { vit.clr = infected_col; infected_num += 1; }
    }
    vi.update(); 
    vi.draw(); 
    vi.checkBoundary(); 
  }
 // SaveFile(); 
  updateNumbers(); 

}

 void addPeople() { while(ps.size() < n){ps.add(new People());}} 
  
  void updateNumbers()
  {
    text(infected_num, 10, 10); 
  }


void SaveFile()
{

newFile = str(hr)+str(min)+str(sec)+"-"+str(iter)+".jpg"; 
save(newFile);
iter++; 
}
