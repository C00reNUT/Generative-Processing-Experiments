class Brush {
 float x, y, alpha, space, r, alpha_speed; 
 color c; 
 float c_red, c_blue, c_green; 
 int colors[] = {#DB7654, #893D60, #D6241E, #F2AC2A, #3D71B7, #FFEEED, #85749D, #21232E, #5FA25A, #5D8EB4};
 // {#2D4059, #F2911B, #F27D16, #F25922, #0D0D0D};  
 //{#6E8C02, #F2CA04, #F2DB98, #F24B1D, #D82717, #0D0D0D}; 
 
Brush(float x_, float y_)
{
  x = x_; 
  y = y_; 
  r = random(10,20); 
  space = random(-2,2); 
  alpha = 200; 
  alpha_speed = random(0,10); 
   c = colors[int(random(0,colors.length))]; 
   c_red = red(c); 
   c_blue = blue(c); 
   c_green = green(c); 
}

void update()
{
  alpha=alpha-alpha_speed;
  x = (x + space);
  y = y + random(1,5); 
  r = r - 0.2; 
  if(r < 0) { r = 0.0; }; 
 
} 
 
  void show()
  {
    //if(c_red >= 255) { c_red = c_red - 100;  } 
     c_red = c_red + 5; 
    c_green = c_green - 3; 
    noStroke();
    fill(c_red, c_green, c_blue, alpha);
    circle(x,y,r);

  }
  
}
