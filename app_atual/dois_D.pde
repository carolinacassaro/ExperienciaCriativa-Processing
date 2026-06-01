void view2d(){
  background(255);
  menu2d();
}

void view2d_1(){
  background(255);
  menu2d();
  fill(light_green);
  rect(canvaX,canvaY,canvaW,canvaH);
  
  // -- cria figura avaliada --
  fill(255);
  
  if("Equilátero".equals(rotulo)){
    triangle(canvaX+canvaW*1/13,canvaH*5/14,
    canvaX+canvaW*3/13,canvaH*5/14,
    canvaX+canvaW*2/13, canvaH*2/14);
  }
  else if("Isóceles".equals(rotulo)){
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
  float clX = canvaX + 20;
  float clY = canvaH*5.5/14;
  int n = 3;
  float gap = 10;
  float available = canvaW - 40;
  float clW = min(120, (available - (n-1)*gap) / n);
  float clH = 36;

  textAlign(CENTER, CENTER);
  textSize(12);

  rotulo("Equilátero", clX, clY, clW, clH);
  rotulo("Isóceles", clX+clW+gap, clY, clW, clH);
  rotulo("Escaleno", clX+(clW+gap)*2, clY, clW, clH);
  // ---------------------------

  // -- cria módulos na direita --
  titulo("ÁREA", canvaX+canvaW*4.5/13, canvaH*1/14);
  card("ded_triangulo", "b x h\n-------------\n    2     ", canvaX+canvaW*4.5/13, canvaH*2/14, 150, canvaH*2/14);
  painelValores2d();
  // ----------------------------
}

void view2d_2(){
  background(255);
  menu2d();
  fill(light_green);
  rect(canvaX,canvaY,canvaW, canvaH);
  
  // -- cria figura avaliada --
  fill(255);
  
  if("Quadrado".equals(rotulo)){
    rect(canvaX+canvaW/13, canvaY+canvaH*2/13, canvaW*2/13, canvaH*4/14);
  } else {
    rect(canvaX+canvaW/13, canvaY+canvaH*2/13, canvaW*3/13, canvaH*4/14);
  }
  // ------------------------
  
  // -- cria classificações --
  float clX = canvaX + 20;
  float clY = canvaH*6.5/14;
  int n = 2;
  float gap = 10;
  float available = canvaW - 40;
  float clW = min(140, (available - (n-1)*gap) / n);
  float clH = 36;

  textAlign(CENTER, CENTER);
  textSize(12);

  rotulo("Quadrado", clX, clY, clW, clH);
  rotulo("Retangulo", clX+clW+gap, clY, clW, clH);
  // -----------------------------

  // -- cria módulos na direita --
  titulo("ÁREA", canvaX+canvaW*4.5/13, canvaH*1/14);
  card("ded_retangulo", "A = b x h", canvaX+canvaW*4.5/13, canvaH*2/14, 150, canvaH*2/14);
  painelValores2d();
  if("Quadrado".equals(rotulo)){
    titulo("DIAGONAL", canvaX+canvaW*4.5/13, canvaH*5/14);
    card("diagonal", "d = L x √2", canvaX+canvaW*4.5/13, canvaH*6/14, 150, canvaH*2/14);
  }
  // ----------------------------
}

void view2d_3(){ // circulo
  background(255);
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
  painelValores2d();
  titulo("CIRCUNFERÊNCIA", canvaX+canvaW*4.5/13, canvaH*5/14);
  card("A circunferencia e o comprimento total da borda do circulo.\n\nEla e proporcional ao raio R:\n\n   C = 2 x pi x R\n\npi = 3,14...  |  R = raio do circulo", "c = 2 x pi x R", canvaX+canvaW*4.5/13, canvaH*6/14, 150, canvaH*2/14);
  // ----------------------------
}

void view2d_4(){ // hexagono
  background(255);
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
  painelValores2d();
  // ----------------------------
}

void view2d_5(){ // losango
  background(255);
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
  painelValores2d();
  // ----------------------------
}

void view2d_6(){ // trapezio
  background(255);
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
  painelValores2d();
  // ----------------------------
}

// Painel de valores para 2D (inputs e resultados)
void painelValores2d(){
  int fieldCount = 0;
  if(svar == 21) fieldCount = 2;
  else if(svar == 22) fieldCount = "Quadrado".equals(rotulo) ? 1 : 2;
  else if(svar == 23) fieldCount = 1;
  else if(svar == 24) fieldCount = 1;
  else if(svar == 25) fieldCount = 2;
  else if(svar == 26) fieldCount = 3;

  if(fieldCount == 0) return;

  float x = canvaX + canvaW*4.5/13;
  float y = canvaH*9.2/14;
  float w = 170;
  float h = max(canvaH*4/14, 80 + fieldCount * 50);
  fill(255);
  stroke(80);
  strokeWeight(1.5);
  rect(x, y, w, h, 24);
  fill(0);
  textSize(12);
  textAlign(LEFT, TOP);
  text("Inserir valores para calcular:", x + 14, y + 14, w - 28, 24);

  float fieldX = x + 14;
  float fieldY = y + 44;
  float fieldW = w - 28;
  float fieldH = 32;
  float rowSpacing = 46;

  if(svar == 21){ // triangulo
    campoEntrada2d("b", fieldX, fieldY, fieldW, fieldH, valorB);
    campoEntrada2d("h", fieldX, fieldY + rowSpacing, fieldW, fieldH, valorH);
  }
  if(svar == 22){ // quadrado/retangulo
    if("Quadrado".equals(rotulo)) campoEntrada2d("l", fieldX, fieldY, fieldW, fieldH, valorL);
    else {
      campoEntrada2d("b", fieldX, fieldY, fieldW, fieldH, valorB);
      campoEntrada2d("h", fieldX, fieldY + rowSpacing, fieldW, fieldH, valorH);
    }
  }
  if(svar == 23){ // circulo
    campoEntrada2d("r", fieldX, fieldY, fieldW, fieldH, valorR);
  }
  if(svar == 24){ // hexagono
    campoEntrada2d("a", fieldX, fieldY, fieldW, fieldH, valorA);
  }
  if(svar == 25){ // losango
    campoEntrada2d("D", fieldX, fieldY, fieldW, fieldH, valorP);
    campoEntrada2d("d", fieldX, fieldY + rowSpacing, fieldW, fieldH, valorA);
  }
  if(svar == 26){ // trapezio
    campoEntrada2d("B", fieldX, fieldY, fieldW, fieldH, valorP);
    campoEntrada2d("b", fieldX, fieldY + rowSpacing, fieldW, fieldH, valorB);
    campoEntrada2d("h", fieldX, fieldY + rowSpacing * 2, fieldW, fieldH, valorH);
  }
  exibirResultados2d(x + w + 20, y, 240, h);
}

void campoEntrada2d(String label, float x, float y, float w, float h, String valor){
  boolean over = estaSobre(x, y, w, h);
  boolean active = activeInput.equals(label);
  fill(active ? color(230, 240, 255) : over ? color(235, 245, 255) : color(250));
  stroke(active ? color(90, 140, 255) : 160);
  strokeWeight(active ? 2 : 1);
  rect(x, y, w, h, 12);
  fill(0);
  textSize(14);
  textAlign(LEFT, CENTER);
  text(label + ": " + (valor.equals("") ? "..." : valor), x + 12, y + h/2);

  if(mousePressed){
    if(over){
      tocarClick();
      activeInput = label;
    }
  }
}

void exibirResultados2d(float x, float y, float w, float h){
  fill(245);
  stroke(80);
  strokeWeight(1.2);
  rect(x, y, w, h, 20);
  fill(0);
  textSize(14);
  textAlign(LEFT, TOP);

  float espacamento = 22;
  float posY = y + 16;
  text("Resultados:", x + 14, posY);
  posY += espacamento;

  float area = 0;
  // calcula area dependendo de svar/rotulo
  if(svar == 21){ // triangulo
    area = parseFloatSeguro(valorB) * parseFloatSeguro(valorH) / 2;
  } else if(svar == 22){ // quadrado/retangulo
    if(rotulo == "Quadrado") area = pow(parseFloatSeguro(valorL), 2);
    else area = parseFloatSeguro(valorB) * parseFloatSeguro(valorH);
  } else if(svar == 23){
    area = PI * pow(parseFloatSeguro(valorR), 2);
  } else if(svar == 24){
    area = 3 * pow(parseFloatSeguro(valorA), 2) * sqrt(3) / 2;
  } else if(svar == 25){
    area = parseFloatSeguro(valorP) * parseFloatSeguro(valorA) / 2; // using D,d approximation (user fields mapping)
  } else if(svar == 26){
    area = (parseFloatSeguro(valorP) + parseFloatSeguro(valorB)) * parseFloatSeguro(valorH) / 2;
  }

  if(area > 0){
    text("Area = " + nf(area, 0, 2), x + 14, posY);
  } else {
    text("Preencha os valores...", x + 14, posY);
  }
}

// /////////////////////////////////////////////////////////////////////////////////
void menu2d(){
  // -- background do menu lateral --
  noStroke();
  fill(255);
  rect(0, 0, btnWidth, height);

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
