
void view2d(){
  background(255);
  
  // -- menu: -- 
  menu2opcoes = 4;
  
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
  triangle(btnWidth/4,btnHeight*3/4,btnWidth*3/4,btnHeight*3/4,btnWidth/2,btnHeight/4);
  rect(btnWidth/4,btnHeight*1.25, btnWidth/2, btnHeight/2);
  circle(btnWidth/2,btnHeight*2.5,btnWidth/3);
  
  // -----------------------
  // cria o botao de voltar
  buttonBack(1); 
  
  

}


void view2d_1(){
  background(255);
}

void view2d_2(){
  background(0);
}
