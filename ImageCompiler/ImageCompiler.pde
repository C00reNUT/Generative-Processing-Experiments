float x, y, r, x2, y2, rcolor, bcolor, sizeVar; 
int b, sec, min, hr, photoNumber, i_count; 
float angle, jitter, c; 
String filePath, newFile; 
PImage newPhoto, newRecursivePhoto; 
PImage[] photo; 
String[] list;

// Variables 
int n_iter = 2000; 
int n_generations = 5; 
String pathway = "data/Amazon/"; 


void setup()
{
  i_count = 0; 
  String path = sketchPath();
  path = path + "/" + pathway;
  list = listFileNames(path); // gets the path of files needed to be loaded
  photo = new PImage[list.length];  
  for(int i = 0; i < list.length; i++)
  {
    if(match(list[i], ".jpg") != null)
    {
      print(list[i]);
    filePath = pathway+list[i]; 
    photo[i] = loadImage(filePath);
    } 
  }
  rcolor = random(0, 255); 
  bcolor = random(0, 255); 
  background(200);
  noStroke();
  size(1200, 800);
  rectMode(CENTER);
}

void draw()
{ 
  if(i_count < n_iter)
  {
    photoNumber = int(random(0,list.length)); 
    DrawPic(0);
    i_count++;
  } else {
      refreshScreen(); 
  }
}

void mouseClicked() {
  refreshScreen(); 
}

void refreshScreen()
{
  sec = second(); 
  min = minute(); 
  hr = hour(); 
  newFile = str(hr)+str(min)+str(sec)+".jpg"; 
  save(newFile);
  newRecursivePhoto = loadImage(newFile);
  clear(); 
  background(200);
  i_count = 0; 
}


void DrawPic(int picAngle)
{ 
  
  sizeVar = random(0,200);
  jitter = random(-1, 1); 
  fill(rcolor, 0, bcolor, random(0, 255));
  r = random(0, 25); 
  x = random(0, width); 
  y = random(0, height);
  x2 = random(0, width); 
  y2 = random(0, height);
  pushMatrix();
  
  if(photo[photoNumber] != null)
  {
  if(newFile != null) 
  {
    newPhoto = newRecursivePhoto.get(int(x),int(y), int(sizeVar/2), int(sizeVar));
  } else {    
    newPhoto = photo[photoNumber].get(int(x),int(y), int(sizeVar/2), int(sizeVar)); 
  }
  
  if (picAngle != 0)
  {
    angle = angle + jitter; 
    c = cos(angle);
    //translate(width/2, height/2);
  rotate(c);
  }
  image(newPhoto, x2, y2);
  }
  popMatrix();

}


// This function returns all the files in a directory as an array of Strings  
String[] listFileNames(String dir) {
  File file = new File(dir);
  if (file.isDirectory()) {
    String names[] = file.list();
    return names;
  } else {
    // If it's not a directory
    return null;
  }
}
