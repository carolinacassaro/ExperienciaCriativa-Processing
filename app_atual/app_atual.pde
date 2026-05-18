PImage img;
PImage imgt;
PImage imge;
PImage impal;

void settings() {
  size(1500, 700);
}

void setup() {
  imgt = loadImage("titulo.png");
  img = loadImage("pf.png");
  imge = loadImage("ge.png");
  impal = loadImage("2d.png");
  img.resize(width, height);
  imge.resize(400, 250);
  impal.resize(800, 550);
  tint(12,242);
  image(img, 0, 0);
  tint(255,255);
  image(imgt,-280,-380);
  image(imge, 150, 300);
  image(impal, 650, 150);
}
