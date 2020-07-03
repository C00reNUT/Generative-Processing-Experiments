
// Create a population class 
class People {
  color clr; 
  int x, y, pside, rand, recovery_time, recovered, move_rate; 
  
  
  //Constructor
   People()
  {
    recovery_time = 1000; 
    move_rate = int(random(0,5)); 
    recovered = 0; 
    clr = InfectionRandomization(); 
    pside = 10; 
    setRandomLocation(); 
  }


  color InfectionRandomization()
  {
    color k; 
    if(int(random(0,100))==52) {
      k = infected_col; 
      recovery_time = 100; } else { k = clear_col; };
    return k; 
  }
  
void setRandomLocation()
{

      x = int(random(0,width)); 
    y = int(random(0,height));
}


void checkBoundary()
{
  if(clr == death_col) {return;}
  if(x > width || y > height || x < 0 || y < 0)  { setRandomLocation();  }

}

boolean isDead() 
{
  boolean outcome; 
  if(int(random(0,25)) == 5)
     {
      outcome =  true; 
     } else { outcome =  false; }
     return outcome; 
}

  void infected() {   
    clr = infected_col; 
    recovery_time = 100; 
  } 

  void healthCheck()
  {
        if(clr == infected_col) { recovery_time -=0.1;}  
    if(recovery_time <= 0) {
      clr = recover_col; 
      recovery_time = 1000; 
     if(isDead()) { clr = death_col;  }
    
  }
  }

  void draw()
  {
    fill(clr); 
    rect(x,y,pside,pside); 
    update(); 
  }


  void update()
  {
    if(clr == death_col) {return;}
    
     rand = int(random(1,5)); 
     
     switch(rand) {
      case 1: 
        x += move_rate; 
        break;
      case 2: 
        y += move_rate; 
        break;
       case 3: 
       x -= move_rate; 
       break; 
      default:
        y -= move_rate; 
        break;
    }
  healthCheck();   
  
  }
}
