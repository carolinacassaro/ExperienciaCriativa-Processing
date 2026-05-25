void settings(){
    size(width, height);
}

void setup() {
  imgInicial = loadImage("pagInicial.png");
  imgBotao = loadImage("botaoInicial.png");
  fonte = createFont("Arial", 64, true);
  textFont(fonte);

  svar = 1;
}

void draw(){
    if (svar == 1) viewInicial();
    if (svar == 2) view2d();
      if (svar == 21){ view2d_1(); if (!deducao.isEmpty()){popUp();}}
    if (svar == 3) view3d();
}
