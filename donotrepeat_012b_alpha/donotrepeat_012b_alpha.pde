color c; 
float x, y, w, r, rate; 
void setup()
{

  size(1000,1000); 
  background(255); 
  x = width/2; 
  y = height/2; 
  w = 0;  
  rate = 0.2; 
  c = getColor(); 
}

void draw() {
  fill(getColor()); 
  stroke(0,100); 
  pushMatrix(); 
  translate(w*sin(frameCount * rate)+x,w*cos(frameCount*rate)+y); 
  rotate(frameCount*rate/4); 
  r = 20*sin(frameCount*rate*2); 
  //rect(0,0,r,r);
  textSize(abs(r)); 
  text("A",0,0); 
//  circle(0,0,10*sin(frameCount*rate*2)); 
  popMatrix(); 
  if(frameCount % 100 ==0) { w -= random(1,3);}
  if(frameCount % 1000 == 0) {rate = random(0.2); c = getColor();}
  if(frameCount % 40 == 0) {saveImage();}
} 



void saveImage() {
  int seed = 100; 
  String timestamp = year() + nf(month(), 2) + nf(day(), 2) + "-"  + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2); 
  saveFrame(timestamp+"-"+seed+".png");
}

//int colors[] = {#FFB401, #072457, #EF4C02, #ADC7C8, #FE6567};
//int colors[] = {#07001C, #2e0091, #E2A218, #D61406};
//int colors[] = {#99002B, #EFA300, #CED1E2, #D66953, #28422E};
//int colors[] = {#A1A7F4, #EA77BA, #EA0071, #F70D04, #301156};
//int colors[] = {#FE829C, #6AFFB8, #BB6633, #3B382B, #DF9BFB};
//int colors[] = {#FE829C, #000000, #BB6633, #3B382B, #DF9BFB};
//int colors[] = {#F7DA36, #A51515, #2B1F19, #1B44C1};//, #6BEFA4};
int colors[] = {#F9F7F7, #F94D32, #500C02, #000000};//, #6BEFA4};
//int colors[] = {#FFDF2B, #B20E0E, #38251C, #1A4CAF, #1E6028};
//int colors[] = {#99002B, #CED1E2, #D66953, #28422E};
//int colors[] = {#EA2E73, #F7AA06, #1577D8};
//int colors[] = {#0F0F0F, #7C7C7C, #4C4C4C};

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
