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
  
  if(rotulo == "Equilátero"){
    triangle(canvaX+canvaW*1/13,canvaH*5/14,
    canvaX+canvaW*3/13,canvaH*5/14,
    canvaX+canvaW*2/13, canvaH*2/14);
  }
  else if(rotulo == "Isóceles"){
    triangle(canvaX+canvaW*1.5/13,canvaH*5/14,
    canvaX+canvaW*2.5/13,canvaH*5/14,
    canvaX+canvaW*2/13, canvaH*2/14);
  } else {
    triangle(canvaX+canvaW*1.5/13,canvaH*4.5/14,
    canvaX+canvaW*2.5/13,canvaH*5/14,
    canvaX+canvaW*3/13, canvaH*2/14);
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
  card("ded_triangulo", "b x h\n-------------\n    2     ", canvaX+canvaW*4.5/13, canvaH*2/14, 150, canvaH*2/14);
  // ----------------------------
}

void view2d_2(){
  menu2d();
  fill(light_green);
  rect(canvaX,canvaY,canvaW, canvaH);
  
  // -- cria figura avaliada --
  fill(255);
  
  if(rotulo == "Quadrado"){
    rect(canvaX+canvaW/13, canvaY+canvaH*2/13, canvaW*2/13, canvaH*4/14);
  } else {
    rect(canvaX+canvaW/13, canvaY+canvaH*2/13, canvaW*3/13, canvaH*4/14);
  }
  // ------------------------
  
  // -- cria classificações --
  float clX = canvaX+canvaW/13;
  float clY = canvaH*6.5/14;
  float clW = 100;
  float clH = 30;

  textAlign(CENTER, CENTER);
  textSize(10);

  rotulo("Quadrado", clX, clY, clW, clH);
  rotulo("Retangulo", clX+clW+5, clY, clW, clH);
  // -----------------------------

  // -- cria módulos na direita --
  titulo("ÁREA", canvaX+canvaW*4.5/13, canvaH*1/14);
  card("ded_retangulo", "A = b x h", canvaX+canvaW*4.5/13, canvaH*2/14, 150, canvaH*2/14);
  
  if(rotulo == "Quadrado"){
    titulo("DIAGONAL", canvaX+canvaW*4.5/13, canvaH*5/14);
    card("diagonal", "d = L x √2", canvaX+canvaW*4.5/13, canvaH*6/14, 150, canvaH*2/14);
  }
  // ----------------------------
}

void view2d_3(){ // circulo
  menu2d();
  fill(light_green);
  rect(canvaX,canvaY,canvaW, canvaH);
  
  // -- cria figura avaliada --
  fill(255);
  circle(canvaX + canvaW*2/13, canvaY + canvaH*6/24, canvaW*2/13);
  // ------------------------

  // -- cria módulos na direita --
  titulo("ÁREA", canvaX+canvaW*4.5/13, canvaH*1/14);
  card("Arquimedes (250 a.C.) inscreveu e circunscreveu poligonos regulares no circulo, aproximando cada vez mais sua area.\n\nA deducao rigorosa exige Calculo Integral, conteudo de nivel superior.\n\nPor isso, enunciamos o resultado:\n\n   A = pi x R^2\n\npi = 3,14...  |  R = raio do circulo", "A = pi x R^2", canvaX+canvaW*4.5/13, canvaH*2/14, 150, canvaH*2/14);
  
  titulo("CIRCUNFERÊNCIA", canvaX+canvaW*4.5/13, canvaH*5/14);
  card("A circunferencia e o comprimento total da borda do circulo.\n\nEla e proporcional ao raio R:\n\n   C = 2 x pi x R\n\npi = 3,14...  |  R = raio do circulo", "c = 2 x pi x R", canvaX+canvaW*4.5/13, canvaH*6/14, 150, canvaH*2/14);
  // ----------------------------
}

void view2d_4(){ // hexagono
  menu2d();
  fill(light_green);
  rect(canvaX,canvaY,canvaW, canvaH);
  
  // -- cria figura avaliada --
  fill(255);
  desenharHexagono(canvaX + canvaW*2/13, canvaH*4/14, canvaW*1/13);
  // ------------------------

  // -- cria módulos na direita --
  titulo("ÁREA", canvaX+canvaW*4.5/13, canvaH*1/14);
  card("ded_hexagono", "3 x a^2 x √3\n-----------\n     2     ", canvaX+canvaW*4.5/13, canvaH*2/14, 150, canvaH*2/14);
  // ----------------------------
}

void view2d_5(){ // losango
  menu2d();
  fill(light_green);
  rect(canvaX,canvaY,canvaW, canvaH);
  
  // -- cria figura avaliada --
  fill(255);
  quad(canvaX+canvaW*2/13, canvaH*2/14, // vertice topo
       canvaX+canvaW/13, canvaH*3/14,   // vertice esquerda
       canvaX+canvaW*2/13, canvaH*4/14, // vertice baixo
       canvaX+canvaW*3/13, canvaH*3/14); // vertice direita
  // ------------------------

  // -- cria módulos na direita --
  titulo("ÁREA", canvaX+canvaW*4.5/13, canvaH*1/14);
  card("ded_losango", "D x d\n---------\n   2   ", canvaX+canvaW*4.5/13, canvaH*2/14, 150, canvaH*2/14);
  // ----------------------------
}

void view2d_6(){ // trapezio
  menu2d();
  fill(light_green);
  rect(canvaX,canvaY,canvaW, canvaH);
  
  // -- cria figura avaliada --
  fill(255);
  quad(canvaX + canvaW/13, canvaH*4/14,       // Vértice inferior esquerdo
       canvaX + canvaW*3/13, canvaH*4/14,     // Vértice inferior direito
       canvaX + canvaW*2.5/13, canvaH*2/14,   // Vértice superior direito
       canvaX + canvaW*1.5/13, canvaH*2/14);  // Vértice superior esquerdo
  // ------------------------

  // -- cria módulos na direita --
  titulo("ÁREA", canvaX+canvaW*4.5/13, canvaH*1/14);
  card("ded_trapezio", "(B+b) x h\n-----------\n     2     ", canvaX+canvaW*4.5/13, canvaH*2/14, 150, canvaH*2/14);
  // ----------------------------
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
  if(mousePressed && deducao.isEmpty()){
    for(int i = 0; i<menu2opcoes; i++){
      if (mouseX >= 0 && mouseX <= btnWidth && mouseY >= btnHeight*i && mouseY <= btnHeight*(i+1)) svar = 21 + i;
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
  btnWidth/4,btnHeight*4.5,        // vertice esquerda
  btnWidth/2, btnHeight*4.75,      // vertice baixo
  btnWidth*3/4, btnHeight*4.5);    // vertice direita
  
  // botao 6: trapezio
  quad(btnWidth/4, btnHeight*5+btnHeight*3/4,   // Vértice inferior esquerdo
       btnWidth*3/4, btnHeight*5+btnHeight*3/4, // Vértice inferior direito
       btnWidth*5/8, btnHeight*5+btnHeight/4,   // Vértice superior direito
       btnWidth*3/8, btnHeight*5+btnHeight/4);  // Vértice superior esquerdo
  // -----------------------
  
  // cria o botao de voltar
  buttonBack(1);
}
