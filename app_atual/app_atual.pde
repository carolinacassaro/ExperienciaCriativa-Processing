PImage img;
PImage imgt;

void settings() {
  size(1500, 700);
}

void setup() {
  imgt = loadImage("tit.png");
  img = loadImage("pf.png");
  img.resize(width, height);
  imgt.resize(width/2, height/2);
  image(img, 0, 0);
  image(imgt, 0, 0);
}
