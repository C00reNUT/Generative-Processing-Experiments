//-----------------------------------------
//-- Title: Generative Primitives
//-- Date: 05/05/2019 6:21 
//-- Author: Christopher Ried
//-- Purpose: 
//-----------------------------------------

import processing.svg.*;
int idx; 
int step; 
int row = 20; 
color[] color_pallete = new color[5]; 


void setup()
{
  GetPallette(); 
  color_pallete = redblue;
  //size(1000, 1000, SVG, "filename2.svg");
  size(1000,1000); 
  step = width / row; 
}

void draw()
{
  drawTable(); 
  save(hour()+minute()+second()+year()+".png"); 
  //stop(); 
}


void drawTable()
{
  idx = int(random(0,4)); 
  background(color_pallete[idx],int(random(100,255)));
     for(int i = 0; i <= row; i++)
  {
    for(int a = 0; a <= row; a++)
    {
      //config_1(step,i,a);
      //config_2(step,i,a);
      config_3(step,i,a);
      //config_4(step,i,a); 
    }
  }
}


void config_1(int step, int i, int a)
{
    idx = int(random(0,4)); 
    stroke(color_pallete[idx]);
    fill(color_pallete[idx] ,50); 
    createDiamond(step*a,step*i,50); 
    rect((step*i)-step/2, (step*a)-step/2, random(1,step), random(1,step));  
    rect((step*i)-step/2, (step*a)-step/2, step, step); 
    cross(step * i,step * a, step, false); 
    pointbox(step*i,step* a, 2* int(random(1,20))); 
    if(int(random(0,10)) == 1)
    {
      pyramid(step*i,step*a, step,int(random(1,20))); 
    }
    circleDotDot(step*i,step*a, step,int(random(1,20))); 
}

void config_2(int step, int i, int a)
{
    idx = int(random(0,4)); 
    stroke(color_pallete[idx]);
    fill(color_pallete[idx] ,50); 
    rect((step*i)-step/2, (step*a)-step/2, random(1,step), random(1,step));  
    cross(step * i,step * a, int(random(1,step)), false); 
    pointbox(step*i,step* a, 2* int(random(1,20))); 
    circleDotDot(step*i,step*a, step, int(random(1,40))); 
    if(int(random(0,20)) == 1)
    {
      pyramid(step*i,step*a, step,int(random(1,500))); 
    }
    createDiamond(step * i, step * a, 100);
}

void config_3(int step, int i, int a)
{
    idx = int(random(0,4)); 
    stroke(color_pallete[idx]);
    fill(color_pallete[idx] ,50); 
    //rect((step*i)-step/2, (step*a)-step/2, random(1,step), random(1,step));  
    //cross(step * i,step * a, int(random(1,step)), false); 
    pointbox(step*i,step* a, 2* int(random(1,20))); 
    circleDotDot(step*i,step*a, int(random(1,300)), int(random(1,a))); 
    if(int(random(0,20)) == 1)
    {
      pyramid(step*i,step*a, step,int(random(1,20))); 
    }
    //createDiamond(step * i, step * a, 100);
}



void config_4(int step, int i, int a)
{
    idx = int(random(0,4)); 
    stroke(color_pallete[idx]);
    fill(color_pallete[idx] ,50); 
    //rect((step*i)-step/2, (step*a)-step/2, random(1,step), random(1,step));  
addMountain(step * i,step * a, int(random(1,step))); 
circleOval(step * i,step * a, int(random(1,step)), 50); 
    //circleOval(step*i,step*a, 50, int(random(1,a))); 
//pointbox(step*i,step* a, 2* int(random(1,20)));     
}
void mouseClicked()
{
  save(hour()+minute()+second()+year()+".tiff"); 
 drawTable();
}
// text("A",(step*i)-step/2, (step*a)-step/2); 
// addChaos(i,a,step);
// cross(int(random(step))*i,int(random(step))*a, step);
// check(step*i,step*a, step); 
// pointbox(step*i,step*a, int(random(1,20))); 
// linebox(step*i,step*a, step,int(random(1,20))); 
