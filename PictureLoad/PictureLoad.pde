float div, wid, rot,iter, curSize; 
int n = 100;
int x, y; 
int l = 1; 
color c, c1, c2, currentColor;
String filename;
PImage img; 
void setup()
{
  smooth(8); 
  size(1000,1000, P3D); 
  // Images must be in the "data" directory to load correctly
  filename = "bruno-martins-k1_UO1MGszs-unsplash"; 
  img = loadImage(filename+".jpg");
  img.resize(width,height); 
  img.loadPixels();

  background(0); 
  rectMode(CENTER); 
 // noStroke(); 

  //blendMode(DIFFERENCE); 
  div = width /n; 
  wid = 10; 
  rot = 5; 
  iter = 0.00001; 
  c1 = getColor(); 
  c2 = getColor(); 

}

void draw() {
  background(0); 
 /// image(img,0,0); 
  for(float j = div; j < width; j += div)
  {
    for(float k = div; k < height; k += div)
    {
     currentColor = img.pixels[int(k * width + j)]; 
    
    if(int(random(10))!=5) { stroke(currentColor,100);  noFill(); } else {fill(currentColor,100);  noStroke();}

       //lerpColor(c1, c2, (j*k)/(width*height))
      pushMatrix();
      translate(j,k); 
      rotateY(rot); 
      rotateX(rot/2); 
      //rect(0,0, wid*noise(j*k), wid*noise(j*k)); 
      box((wid*noise(j*k)*1.5)); 
      popMatrix(); 

      
   if(wid  > 50) { l = -1; }
   else if (wid < 0) { l = 1;}
   if(rot > 360) { rot = 0; }
   
   wid = wid + (iter*l); 
   rot = rot +iter/2; 
   
    }
  }
  //saveImage();  
} 



void saveImage() {
  int seed = 100; 
  String timestamp = year() + nf(month(), 2) + nf(day(), 2) + "-"  + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2); 
  saveFrame(filename+"/"+timestamp+"-"+seed+".png");
}

//int colors[] = {#EDF67D, #F896D8, #CA7DF9, #724CF9, #564592};
//int colors[] = {#BF052A, #DBB304, #E1E7ED, #04140C};
//int colors[] = {#057EBF, #DBB304, #E1E7ED, #04140C};
int colors[] = {#00A878, #D8F1A0, #F3C178, #FE5E41, #0B0500};

int rcol() {
  return colors[int(random(colors.length))];
}

int getColor() {
  return getColor(random(colors.length));
}

int getColor(float v) {
  v = abs(v); 
  v = v%(colors.length); 
  int c1 = colors[int(v%colors.length)]; 
  int c2 = colors[int((v+1)%colors.length)]; 
  return lerpColor(c1, c2, pow(v%1, 0.1));
} 
