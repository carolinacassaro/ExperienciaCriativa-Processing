
void view2d(){
  background(255);
  menu2d();
  
}

void view2d_1(){
  menu2d();
  fill(light_green);
  rect(canvaX,canvaY,canvaW,canvaH);
  
  // -- cria figura avaliada --
  fill(255);
  
  if(triangulo == "Equilátero"){
    triangle(canvaX+canvaW*1/13,canvaH*5/14, // vertice inferiror esquerdo
    canvaX+canvaW*3/13,canvaH*5/14, // vertice inferior direito
    canvaX+canvaW*2/13, canvaH*2/14 ); // vertice superior
  }
  else if(triangulo == "Isóceles"){
    triangle(canvaX+canvaW*1.5/13,canvaH*5/14, // vertice inferiror esquerdo
    canvaX+canvaW*2.5/13,canvaH*5/14, // vertice inferior direito
    canvaX+canvaW*2/13, canvaH*2/14 ); // vertice superior
  }else{
    triangle(canvaX+canvaW*1.5/13,canvaH*4.5/14, // vertice inferiror esquerdo
    canvaX+canvaW*2.5/13,canvaH*5/14, // vertice inferior direito
    canvaX+canvaW*3/13, canvaH*2/14 ); // vertice superior
    
  }
    
  
  
  // ----------------------------
  
  // -- cria classificações --
  
  float clX = canvaX+canvaW*0.5/13;
  float clY = canvaH*5.5/14;
  float clW = 100;
  float clH = 30;
  
  
  textAlign(CENTER, CENTER);
  textSize(10);
   
  rotulo("Equilátero", clX, clY, clW, clH);
  rotulo("Isóceles", clX+clW+5, clY, clW, clH);
  rotulo("Escaleno", clX+(clW+5)*2, clY, clW, clH);
  
  
  
  // ---------------------------
  
  // -- cria módulos na direita --
  
  titulo("ÁREA", canvaX+canvaW*4.5/13, canvaH*1/14);
  card("deducao", "A = b x h\n-------------\n    2     ", canvaX+canvaW*4.5/13, canvaH*2/14, 150, canvaH*2/14);
  
  if(triangulo == "Equilátero"){
    
    titulo("ALTURA", canvaX+canvaW*4.5/13, canvaH*5/14);
    card("deducao2", "h = L x √3\n-------------\n    2     ", canvaX+canvaW*4.5/13, canvaH*6/14, 150, canvaH*2/14);
  }
  
  
  // ----------------------------
  
}

void view2d_2(){
  menu2d();
  fill(0);
  rect(canvaX,canvaY,canvaW, canvaH);
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
