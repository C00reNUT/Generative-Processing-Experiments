class Particle {
 int x, y, intensity, dx, dy;
 float size; 
 
  Particle()
{
  size = random(1,10); 
  intensity = int(random(0,255)); 
  fill(255,255,255,intensity); 
  x = int(random(0,width)); 
  y = int(random(0,height)); 
  ellipse(x,y,size,size); 
  
   if(x >= width / 2)
      {
        dx = -abs(x - (width/2));
      } else {
        dx = abs(x - (width/2));
      }
       if(y >= height / 2)
      {
        dy = -abs(y - (height/2));
      } else {
        dy = abs(y - (height/2));
      }
}

  void update()
  {
    if(intensity > 0)
    {
     
    intensity--; 
    fill(255,255,255,intensity);
     ellipse(x+dx,y+dy,size,size); 
    } else {
    intensity = 255; 
    x = int(random(0,width)); 
    y = int(random(0,height)); 
    }
  }  
}
