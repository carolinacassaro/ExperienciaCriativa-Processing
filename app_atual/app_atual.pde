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
      if (svar == 21) view2d_1(); 
      if (svar == 22) view2d_2(); 
      if (svar == 23) view2d_3(); 
      if (svar == 24) view2d_4();
      if (svar == 25) view2d_5(); 
      if (svar == 26) view2d_6(); 
    if (svar == 3) view3d();
    
    
    if (!deducao.isEmpty()){popUp();}
}
