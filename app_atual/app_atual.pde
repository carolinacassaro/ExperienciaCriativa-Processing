
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
  svar = 1;
}

void draw(){
    if (svar == 1) viewInicial();
    if (svar == 2) view2d();
      if (svar == 21) view2d_1();
}



void button(int order){
  fill(255);
  stroke(0);
  strokeWeight(1);
  rect(0,0+order*btnHeight,btnWidth,btnHeight);
}
