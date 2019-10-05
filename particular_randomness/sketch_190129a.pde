//-----------------------------------------
//-- Title: Word Waterfall
//-- Date: 30/01/2019 9:25 
//-- Author: Christopher Ried
//-- Purpose: 
//-----------------------------------------

PointLaser[] ptLaser = new PointLaser[200]; 
int b, sec, min, hr; 

void setup()
{
  background(0); 
  size(1200,1200); 
  
  for(int i = 0; i < ptLaser.length; i++)
  {
    ptLaser[i] =  new PointLaser(random(0,width), random(0,height)); 
  }
}


void draw()
{
  
  //background(0); 
  for(int i = 0; i < ptLaser.length; i++)
  {
    ptLaser[i].update(); 
     ptLaser[i].display(); 
     ptLaser[i].checkEdges(); 
  }
}

void mouseClicked() {
  sec = second(); 
  min = minute(); 
  hr = hour(); 
  save(str(hr)+str(min)+str(sec)+".jpg");
}
// 
class PointLaser
{
  PVector location; 
  int txtSize; 
  int r, g, b; 
  
  PointLaser(float x, float y)
  {
    location = new PVector(x,y);
    txtSize = int(random(1,100)); 
    r = int(random(1,255)); 
    g = int(random(1,255)); 
    b = int(random(1,255));
  }
  
  void display() {
    fill(175); 
    stroke(255,20); 
    textSize(txtSize);
    //fill(0,g,b,10);
    //fill(r, 20);
    //text("faith", location.x, location.y);
    point(location.x, location.y); 
  }
  
  void update() {
   location.x =  location.x-1*sin(random(1,5)) ; 
   location.y =  location.y+1 ; 
  }
  
  
   void checkEdges() {
     
     if(location.x == height/2)
     {
       location.x = height/2; 
       location.y = width/2; 
     }
     
    if(location.x > width) { 
      location.x = random(0,width); 
      location.y = random(0,height); 
      
    } else if (location.x < 0) {
      location.x = random(0,width); 
      location.y = random(0,height); 
    }
    
    if (location.y > height) {
      location.x = random(0,width); 
      location.y = random(0,height); 
  } else if (location.y < 0) {
    location.x = random(0,width); 
      location.y = random(0,height); 
  }
}
}
