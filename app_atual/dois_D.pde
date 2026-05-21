
void view2d(){
  background(255);
  menu2d();
  
  
  
}

void view2d_1(){
  menu2d();
  fill(0);
  rect(btnWidth,0,width-btnWidth, height);
  
}

void view2d_2(){
  menu2d();
  fill(0);
  rect(btnWidth,0,width-btnWidth, height);
}








// /////////////////////////////////////////////////////////////////////////////////
void menu2d(){
    // -- menu: -- 
  menu2opcoes = 6;
  
  // -----------------------

  // -- cria os botoes: -- 
  for(int i = 0; i<menu2opcoes; i++){
    button(i);
  }
  
  // -----------------------
  
  // -- cria ativacao dos botoes: --
  if(mousePressed){
    for(int i = 0; i<menu2opcoes; i++){
      if (mouseX >= 0 && mouseX <= btnWidth && mouseY  >= btnHeight*i && mouseY <= btnHeight*(i+1)) svar = 21 + i;
    }  
  }
  // -----------------------
  
  // -- especifica os botoes --
  fill(255);
  
  // botao 1: triangulo
  triangle(btnWidth/4,btnHeight*3/4,btnWidth*3/4,btnHeight*3/4,btnWidth/2,btnHeight/4); 
  
  // botao 2: retangulo
  rect(btnWidth/4,btnHeight*1.25, btnWidth/2, btnHeight/2); 
  
  // botao 3: circulo
  circle(btnWidth/2,btnHeight*2.5,btnWidth/3); 
  
  // botao 4: hexagono
  desenharHexagono(btnWidth/2, btnHeight*3.5, btnWidth/6); // x,y,raio  
  
  // botao 5: losango
  quad(btnWidth/2, btnHeight*4.25, // vertice topo
  btnWidth/4,btnHeight*4.5, // vertice esquerda
  btnWidth/2, btnHeight*4.75, // vertice baixo
  btnWidth*3/4, btnHeight*4.5 ); // vertice direita 
  
  // botao 6: trapezio
  quad(btnWidth/4, btnHeight*5+btnHeight*3/4,  // Vértice inferior esquerdo
       btnWidth*3/4, btnHeight*5+btnHeight*3/4,  // Vértice inferior direito
       btnWidth*5/8, btnHeight*5+btnHeight/4,  // Vértice superior direito
       btnWidth*3/8, btnHeight*5+btnHeight/4);  // Vértice superior esquerdo
  
  // -----------------------
  // cria o botao de voltar
  buttonBack(1);
}
