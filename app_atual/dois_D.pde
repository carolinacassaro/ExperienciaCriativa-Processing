
void view2d(){
  background(0);
  
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
  
}


void view2d_1(){
  background(255);
}

void view2d_2(){
  background(0);
}
