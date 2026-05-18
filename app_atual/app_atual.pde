PImage img;
PImage imgt;

void settings() {
  size(1500, 700);
}

void setup() {
  imgt = loadImage("titulo.png");
  img = loadImage("pf.png");
  img.resize(width, height);
  tint(12,242);
  image(img, 0, 0);
  tint(255,255);
  image(imgt,0,0);
}
