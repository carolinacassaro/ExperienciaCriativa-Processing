void settings(){
    size(width, height);
}

void setup() {
  imgInicial = loadImage("pagInicial.png");
  imgBotao = loadImage("botaoInicial.png");

  svar = 1;
}

void draw(){
    if (svar == 1) viewInicial();
    if (svar == 2) view2d();
      if (svar == 21) view2d_1();
    if (svar == 3) view3d();
}



void button(int order){
  fill(light_green);
  stroke(0);
  strokeWeight(1);
  rect(0,0+order*btnHeight,btnWidth,btnHeight);
}

void buttonBack(int redirection){
  fill(light_green);
  stroke(0);
  strokeWeight(1);
  rect(0,height-btnHeight,btnWidth,btnHeight);
  text("←",btnWidth/2,(height-btnHeight)/2);
  
  if(mousePressed){
    if (mouseX >= 0 && mouseX <= btnWidth && mouseY  >= height-btnHeight && mouseY <= height) svar = redirection;
  }
}
