import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketch_190129a extends PApplet {

//-----------------------------------------
//-- Title: Word Waterfall
//-- Date: 30/01/2019 9:25 
//-- Author: Christopher Ried
//-- Purpose: 
//-----------------------------------------

PointLaser[] ptLaser = new PointLaser[200]; 
int b, sec, min, hr; 

public void setup()
{
  background(0); 
   
  
  for(int i = 0; i < ptLaser.length; i++)
  {
    ptLaser[i] =  new PointLaser(random(0,width), random(0,height)); 
  }
}


public void draw()
{
  
  //background(0); 
  for(int i = 0; i < ptLaser.length; i++)
  {
    ptLaser[i].update(); 
     ptLaser[i].display(); 
     ptLaser[i].checkEdges(); 
  }
}

public void mouseClicked() {
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
    txtSize = PApplet.parseInt(random(1,100)); 
    r = PApplet.parseInt(random(1,255)); 
    g = PApplet.parseInt(random(1,255)); 
    b = PApplet.parseInt(random(1,255));
  }
  
  public void display() {
    fill(175); 
    stroke(255,20); 
    textSize(txtSize);
    //fill(0,g,b,10);
    //fill(r, 20);
    //text("faith", location.x, location.y);
    point(location.x, location.y); 
  }
  
  public void update() {
   location.x =  location.x-1*sin(random(1,5)) ; 
   location.y =  location.y+1 ; 
  }
  
  
   public void checkEdges() {
     
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
  public void settings() {  size(1200,1200); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "sketch_190129a" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
