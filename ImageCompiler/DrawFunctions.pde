void DrawCircle()
{
  fill(rcolor, 0, 0, random(0, 255));
  r = random(0, 25); 
  x = random(0, width); 
  y = random(0, height);
  ellipse(x, y, r, r);
}

void DrawTriangle()
{
 // triangle()
 }


void DrawRect()
{ 

  sizeVar = random(0,100);
  jitter = random(-1, 1); 
  fill(rcolor, 0, bcolor, random(0, 255));
  r = random(0, 25); 
  x = random(0, width); 
  y = random(0, height);
  x2 = random(0, width); 
  y2 = random(0, height);
  pushMatrix();
  angle = angle + jitter; 
  float c = cos(angle);
  translate(width/2, height/2);
  rotate(c);
  rect(x, y, r/2, r);
  popMatrix(); 
}
