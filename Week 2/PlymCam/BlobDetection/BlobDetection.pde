PImage frame;
float xPos = 0;
float yPos = 0;
float size = 100;
int red = color(255,0,0);

void setup()
{
  size(700,400, P2D);
  frame = loadImage("frame.jpg");
  textSize(22);
}

void draw()
{
  background(0);
  image(frame,0,0);
  noFill();
  stroke(200,255,0);
  strokeWeight(3);
  float pixelCount = countDarkPixelsInCurrentSelection();
  float percent = 0;
  if(pixelCount>0) percent = 100.0 * (pixelCount/(size*size));
  float score = (percent/100.0)*pow(size,1.8);
  text(int(pixelCount) + " (" + int(percent) + "%)",width-120,height-40);
  text("Score: " + int(score),width-120,height-20);
  rect(xPos,yPos,size,size);
  if(keyPressed) {
    if(keyCode==LEFT) xPos-=pow(size,2)/7000;
    if(keyCode==RIGHT) xPos+=pow(size,2)/7000;
    if(keyCode==UP) yPos-=pow(size,2)/7000;
    if(keyCode==DOWN) yPos+=pow(size,2)/7000;
    if(xPos+size>width) { xPos=0; yPos+=size; }
    if(xPos<0) { xPos=width-size; yPos-=size; }
    if(yPos+size>height) { yPos=height-size; xPos=width-size; }
    if(yPos<0) yPos=0;
  }
}

int countDarkPixelsInCurrentSelection()
{
  int count = 0;
  for(float x=xPos; x<xPos+size ;x++) {
    for(float y=yPos; y<yPos+size ;y++) {
      if(blue(get(int(x),int(y)))<150) {
        set(int(x),int(y),red);
        count++;
      }
    }
  }
  return count;
}

void keyPressed()
{
  if((key=='-')&&(size<100)) { size+=10; xPos-=5; yPos-=5; };
  if(key=='=') { size-=10; xPos+=5; yPos+=5; };
}
