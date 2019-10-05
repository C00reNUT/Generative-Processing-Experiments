void cross(int x,int y, int size, boolean rotate)
{
  if(rotate == true)
  {
    pushMatrix(); 
    rotate(int(random(90,150))); 
    line(x,y,x+size,y+size); 
    line(x+size, y, x, y+size);
    popMatrix(); 
  } else {
    strokeWeight(random(1,10));
    line(x,y,x+size,y+size); 
    line(x+size, y, x, y+size);
  }
}


void addArrow(int x, int y, int size)
{
  pushMatrix(); 
  //rotate(int(90));
   line(x,y,x+size,y);
   line(x+size,y,x-(size/5),y+10);  
   line(x+size,y,x-(size/5),y-10);  
   popMatrix(); 
}

void addMountain(int x, int y, int size)
{
  pushMatrix(); 
  //rotate(int(90));

   line(x+size,y+size,x,y);  
   line(x+size,y+size,x+20,y);  
   //line(x,y+size,x+(2*size),y);  
   popMatrix(); 
   
   
}

void addText(String s, int x, int y, int size)
{
  pushMatrix(); 
  rotate(int(random(90,150)));
    textSize(random(1,size));
    text(s, x, y); 
    popMatrix(); 
   
}

void addTriangle(int x, int y, int size)
{
  pushMatrix(); 
    rotate(int(random(90,150)));
    triangle(x,y,x, y-size,x+(size), y-(size));
    popMatrix(); 
   
}


void addChaos()
{
   // stroke(255,random(0,255),0); 
    pushMatrix(); 
    rotate(int(random(90,150))); 
    popMatrix(); 
}


void plus(int x,int y, int size)
{
   //stroke(255,random(0,255),0); 
  line(x+(size/2),y,x+(size/2), y+(size)); 
  line(x,y+(size/2),x+(size), y+(size/2)); 
}

void check(int x,int y, int size)
{
   //stroke(255,random(0,255),0); 
  line(x+(size/2),y,x+(size/2), y+(size)); 
  line(x,y+(size/2),x+(size), y); 
}

void linebox(int x, int y, int len, int n)
{
  int a = step / n;
  for(int i = 1; i <= n; i++)
  {
    line(x,y+(a*i),x+len,y+(a*i)); 
  }
}

void pointbox(int x, int y,  int n)
{
  int a = step / n;
  for(int i = 1; i <= n; i++)
  {
    for(int j = 1; j <= n; j++)
    {
      point(x+(a*i), y + (a*j)); 
    }
  }
}

void pyramid(int x, int y, int len, int n)
{
  int a = step / n;
  for(int i = 1; i <= n; i++)
  {
    line(x+(a*i), y+(a*i), x+(len/ i), y+(a*i)); 
  }
}

void circleDotDot(int x, int y, int step, int n)
{
  noFill();
  int r = int(random(1,step)); 
  for(int i = 1; i <= n; i++)
  {
    ellipse(x,y,r/i,r/i); 
  }
}

void circleOval(int x, int y, int step, int n)
{
  noFill();
  int r = int(random(1,step)); 
  for(int i = 1; i <= n; i++)
  {
     pushMatrix(); 
    rotate(int(random(90,150))); 
    ellipse(x,y,r/(i*2),r/i); 
    popMatrix(); 
    
  }
}

void createDiamond(int x, int y,  int n)
{
  pushMatrix(); 
  rotate(PI/4);
  rect(x,y,n,n);
  popMatrix();
}
