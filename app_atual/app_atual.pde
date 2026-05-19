

void setup() {
  size(1500, 700);
  imgInicial = loadImage("pagInicial.png");
  imgB2d = loadImage("botaoInicial.png");
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
