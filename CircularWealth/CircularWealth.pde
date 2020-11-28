
float n,r, div,margin; 
int iter; 
color a, b; 
void setup()
{
 // blendMode(DIFFERENCE); 

  size(1000,1000); 
  background(255); 
  n = 6; 
  r = 5; 
  a = getColor(); 
  b = getColor(); 
  margin = 50; 
  div = (height-100) / n; 
  noFill();
}

void draw() {

  for(int i = 0; i < width-margin; i++)
  {
    for (int j =  0; j < height-margin; j++)
    {
    //lerpColor(a, b, iter  / 10)
      stroke(getColor()); 
      circle(margin+i*div,margin+j*div,r); 
    }

  }
        r += 20; 
        iter++; 
  //stop();
  //
  //saveImage(); 
} 



void saveImage() {
  int seed = 100; 
  String timestamp = year() + nf(month(), 2) + nf(day(), 2) + "-"  + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2); 
  saveFrame("images/"+timestamp+"-"+seed+".png");
}
//int colors[] = {#EDF67D, #F896D8, #CA7DF9, #724CF9, #564592};
//int colors[] = {#BF052A, #DBB304, #E1E7ED, #04140C};
int colors[] = {#057EBF, #DBB304, #E1E7ED, #04140C};
//int colors[] = {#00A878, #D8F1A0, #F3C178, #FE5E41, #0B0500};
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