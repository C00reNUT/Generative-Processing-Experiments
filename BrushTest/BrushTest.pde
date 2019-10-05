PImage webImg;
int masterCount; 

void setup() {
  size(800,800);
  background(255);
  masterCount = 0; 
  String url = "brush.png";
  webImg = loadImage(url);
}

void draw() {

  drawBrush(int(random(0,width)), int(random(0,height))); 
  masterCount++; 
}

void drawBrush(int x, int y)
{
    int ix = x; 
    int iy = y; 
    tint(0,0,0, 10);
    if(masterCount % 20 == 0)
    {
     filter(BLUR,1); 
    } else { 
      filter(BLUR, 0); 
    }
    for (int i = 0; i <= 10; i++)
    {
      imageMode(CENTER); 
  image(webImg, ix, iy);
  ix = ix+3; 
    }
}
