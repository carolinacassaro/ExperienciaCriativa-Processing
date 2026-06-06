void view2d(){
  background(255);
  menu2d();
}

void view2d_1(){
  background(255);
  menu2d();
  fundoCanvas();
  cabecalhoCanvas("Triângulo  —  " + rotulo, "FIGURA 2D");
  painelFigura(canvaX + 10, 46, canvaW*4/13, canvaH*7/14 - 46);

  // -- cria figura avaliada (só quando o popup está fechado) --
  if(deducao.isEmpty()){
    fill(figura_fill);
    stroke(backgroundButton); strokeWeight(2);
    if("Equilátero".equals(rotulo)){
      triangle(canvaX+canvaW*1/13,canvaH*5/14,
               canvaX+canvaW*3/13,canvaH*5/14,
               canvaX+canvaW*2/13, canvaH*2/14);
    } else if("Isóceles".equals(rotulo)){
      triangle(canvaX+canvaW*1.5/13,canvaH*5/14,
               canvaX+canvaW*2.5/13,canvaH*5/14,
               canvaX+canvaW*2/13, canvaH*2/14);
    } else {
      triangle(canvaX+canvaW*1.5/13,canvaH*4.5/14,
               canvaX+canvaW*2.5/13,canvaH*5/14,
               canvaX+canvaW*3/13, canvaH*2/14);
    }
    noStroke();
  }
  // ----------------------------

  // -- cria classificações --
  float clX = canvaX + 20;
  float clY = canvaH*5.5/14;
  int n = 3; float gap = 10;
  float clW = min(120, (canvaW*4/13 - 40 - (n-1)*gap) / n);
  float clH = 36;
  textAlign(CENTER, CENTER); textSize(12);
  rotulo("Equilátero", clX, clY, clW, clH);
  rotulo("Isóceles", clX+clW+gap, clY, clW, clH);
  rotulo("Escaleno", clX+(clW+gap)*2, clY, clW, clH);
  // ---------------------------

  // -- cria módulos na direita --
  titulo("ÁREA", canvaX+canvaW*4.5/13, canvaH*1/14);
  card("ded_triangulo", "b x h\n-------------\n    2     ", canvaX+canvaW*4.5/13, canvaH*2/14, 150, canvaH*2/14);
  painelValores2d();

  float glossTitleY = canvaH*11.0/14;
  float glossBoxY = glossTitleY + (canvaH*0.5/14) + 8;
  tituloCurto("GLOSSARIO", canvaX+canvaW*0.5/13, glossTitleY, 360);
  glossario2d("b = base\nh = altura", canvaX+canvaW*0.5/13, glossBoxY, 360, 40);
  // ----------------------------
}

void view2d_2(){
  background(255);
  menu2d();
  fundoCanvas();
  String nomeAtual = "Quadrado".equals(rotulo) ? "Quadrado" : "Retângulo";
  cabecalhoCanvas(nomeAtual, "FIGURA 2D");
  painelFigura(canvaX + 10, 46, canvaW*4/13, canvaH*7/14 - 46);

  // -- cria figura avaliada centrada no painel (só quando o popup está fechado) --
  if(deducao.isEmpty()){
    float panelCX = canvaX + 10 + (canvaW*4/13) / 2.0;
    float panelCY = 46 + (canvaH*7/14 - 46) / 2.0;
    float rW = "Quadrado".equals(rotulo) ? canvaW*2/13 : canvaW*3/13;
    float rH = canvaH*4/14;
    fill(figura_fill);
    stroke(backgroundButton); strokeWeight(2);
    rect(panelCX - rW/2, panelCY - rH/2, rW, rH);
    noStroke();
  }
  // ------------------------

  // -- cria classificações --
  float clX = canvaX + 20;
  float clY = canvaH*6.5/14;
  int n = 2; float gap = 10;
  float clW = min(140, (canvaW*4/13 - 40 - (n-1)*gap) / n);
  float clH = 36;
  textAlign(CENTER, CENTER); textSize(12);
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

  float glossTitleY = canvaH*11.0/14;
  float glossBoxY = glossTitleY + (canvaH*0.5/14) + 8;
  tituloCurto("GLOSSARIO", canvaX+canvaW*0.5/13, glossTitleY, 360);
  if("Quadrado".equals(rotulo)){
    glossario2d("l = lado\nd = diagonal", canvaX+canvaW*0.5/13, glossBoxY, 360, 40);
  } else {
    glossario2d("b = base\nh = altura", canvaX+canvaW*0.5/13, glossBoxY, 360, 40);
  }
  // ----------------------------
}

void view2d_3(){ // circulo
  background(255);
  menu2d();
  fundoCanvas();
  cabecalhoCanvas("Círculo", "FIGURA 2D");
  painelFigura(canvaX + 10, 46, canvaW*4/13, canvaH*7/14 - 46);

  // -- cria figura avaliada (só quando o popup está fechado) --
  if(deducao.isEmpty()){
    fill(figura_fill);
    stroke(backgroundButton); strokeWeight(2);
    circle(canvaX + canvaW*2/13, canvaY + canvaH*6/24, canvaW*2/13);
    noStroke();
  }
  // ------------------------

  // -- cria módulos na direita --
  titulo("ÁREA", canvaX+canvaW*4.5/13, canvaH*1/14);
  card("ded_circulo",
       "A = pi x R^2", canvaX+canvaW*4.5/13, canvaH*2/14, 150, canvaH*2/14);
  painelValores2d();
  titulo("CIRCUNFERÊNCIA", canvaX+canvaW*4.5/13, canvaH*5/14);
  card("A circunferencia e o comprimento total da borda do circulo.\n\nEla e proporcional ao raio R:\n\n   C = 2 x pi x R\n\npi = 3,14...  |  R = raio do circulo",
       "C = 2 x pi x R", canvaX+canvaW*4.5/13, canvaH*6/14, 150, canvaH*2/14);

  float glossTitleY = canvaH*11.0/14;
  float glossBoxY = glossTitleY + (canvaH*0.5/14) + 8;
  tituloCurto("GLOSSARIO", canvaX+canvaW*0.5/13, glossTitleY, 360);
  glossario2d("R = raio do circulo\nC = comprimento total", canvaX+canvaW*0.5/13, glossBoxY, 360, 40);
  // ----------------------------
}

void view2d_4(){ // hexagono
  background(255);
  menu2d();
  fundoCanvas();
  cabecalhoCanvas("Hexágono Regular", "FIGURA 2D");
  painelFigura(canvaX + 10, 46, canvaW*4/13, canvaH*7/14 - 46);

  // -- cria figura avaliada (só quando o popup está fechado) --
  // IMPORTANTE: beginShape/vertex/endShape em P3D renderiza o stroke numa
  // passagem separada; sem este guard o contorno aparece por cima do popup.
  if(deducao.isEmpty()){
    fill(figura_fill);
    stroke(backgroundButton); strokeWeight(2);
    desenharHexagono(canvaX + canvaW*2/13, canvaH*4/14, canvaW*1/13);
    noStroke();
  }
  // ------------------------

  // -- cria módulos na direita --
  titulo("ÁREA", canvaX+canvaW*4.5/13, canvaH*1/14);
  card("ded_hexagono", "3 x a^2 x √3\n-----------\n     2     ", canvaX+canvaW*4.5/13, canvaH*2/14, 150, canvaH*2/14);
  painelValores2d();

  float glossTitleY = canvaH*11.0/14;
  float glossBoxY = glossTitleY + (canvaH*0.5/14) + 8;
  tituloCurto("GLOSSARIO", canvaX+canvaW*0.5/13, glossTitleY, 360);
  glossario2d("a = lado do hexagono", canvaX+canvaW*0.5/13, glossBoxY, 360, 30);
  // ----------------------------
}

void view2d_5(){ // losango
  background(255);
  menu2d();
  fundoCanvas();
  cabecalhoCanvas("Losango", "FIGURA 2D");
  painelFigura(canvaX + 10, 46, canvaW*4/13, canvaH*7/14 - 46);

  // -- cria figura avaliada (só quando o popup está fechado) --
  if(deducao.isEmpty()){
    fill(figura_fill);
    stroke(backgroundButton); strokeWeight(2);
    quad(canvaX+canvaW*2/13, canvaH*2/14,
         canvaX+canvaW/13,   canvaH*3/14,
         canvaX+canvaW*2/13, canvaH*4/14,
         canvaX+canvaW*3/13, canvaH*3/14);
    noStroke();
  }
  // ------------------------

  // -- cria módulos na direita --
  titulo("ÁREA", canvaX+canvaW*4.5/13, canvaH*1/14);
  card("ded_losango", "D x d\n---------\n   2   ", canvaX+canvaW*4.5/13, canvaH*2/14, 150, canvaH*2/14);
  painelValores2d();

  float glossTitleY = canvaH*11.0/14;
  float glossBoxY = glossTitleY + (canvaH*0.5/14) + 8;
  tituloCurto("GLOSSARIO", canvaX+canvaW*0.5/13, glossTitleY, 360);
  glossario2d("D = diagonal maior\nd = diagonal menor", canvaX+canvaW*0.5/13, glossBoxY, 360, 40);
  // ----------------------------
}

void view2d_6(){ // trapezio
  background(255);
  menu2d();
  fundoCanvas();
  cabecalhoCanvas("Trapézio", "FIGURA 2D");
  painelFigura(canvaX + 10, 46, canvaW*4/13, canvaH*7/14 - 46);

  // -- cria figura avaliada (só quando o popup está fechado) --
  if(deducao.isEmpty()){
    fill(figura_fill);
    stroke(backgroundButton); strokeWeight(2);
    quad(canvaX+canvaW/13,   canvaH*4/14,
         canvaX+canvaW*3/13, canvaH*4/14,
         canvaX+canvaW*2.5/13, canvaH*2/14,
         canvaX+canvaW*1.5/13, canvaH*2/14);
    noStroke();
  }
  // ------------------------

  // -- cria módulos na direita --
  titulo("ÁREA", canvaX+canvaW*4.5/13, canvaH*1/14);
  card("ded_trapezio", "(B+b) x h\n-----------\n     2     ", canvaX+canvaW*4.5/13, canvaH*2/14, 150, canvaH*2/14);
  painelValores2d();

  float glossTitleY = canvaH*11.0/14;
  float glossBoxY = glossTitleY + (canvaH*0.5/14) + 8;
  tituloCurto("GLOSSARIO", canvaX+canvaW*0.5/13, glossTitleY, 360);
  glossario2d("B = base maior\nb = base menor\nh = altura", canvaX+canvaW*0.5/13, glossBoxY, 360, 50);
  // ----------------------------
}

// ── Painel de cálculo 2D ─────────────────────────
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
  float h = max(canvaH*4/14, 90 + fieldCount * 50);

  // sombra
  noStroke(); fill(shadow_col);
  rect(x + 3, y + 3, w, h, 24);

  // fundo
  fill(255);
  if(deducao.isEmpty()){ stroke(borda_cor); strokeWeight(1.5); }
  else { noStroke(); }
  rect(x, y, w, h, 24);

  // header verde do painel
  fill(header_bg); noStroke();
  rect(x, y, w, 38, 24, 24, 0, 0);
  fill(255); textSize(11); textAlign(LEFT, CENTER);
  text("Calcular área", x + 14, y + 19);

  float fieldX = x + 14;
  float fieldY = y + 50;
  float fieldW = w - 28;
  float fieldH = 32;
  float rowSpacing = 46;

  if(svar == 21){
    campoEntrada2d("b", fieldX, fieldY, fieldW, fieldH, valorB);
    campoEntrada2d("h", fieldX, fieldY+rowSpacing, fieldW, fieldH, valorH);
  }
  if(svar == 22){
    if("Quadrado".equals(rotulo)) campoEntrada2d("l", fieldX, fieldY, fieldW, fieldH, valorL);
    else {
      campoEntrada2d("b", fieldX, fieldY, fieldW, fieldH, valorB);
      campoEntrada2d("h", fieldX, fieldY+rowSpacing, fieldW, fieldH, valorH);
    }
  }
  if(svar == 23) campoEntrada2d("r", fieldX, fieldY, fieldW, fieldH, valorR);
  if(svar == 24) campoEntrada2d("a", fieldX, fieldY, fieldW, fieldH, valorA);
  if(svar == 25){
    campoEntrada2d("D", fieldX, fieldY, fieldW, fieldH, valorP);
    campoEntrada2d("d", fieldX, fieldY+rowSpacing, fieldW, fieldH, valorA);
  }
  if(svar == 26){
    campoEntrada2d("B", fieldX, fieldY, fieldW, fieldH, valorP);
    campoEntrada2d("b", fieldX, fieldY+rowSpacing, fieldW, fieldH, valorB);
    campoEntrada2d("h", fieldX, fieldY+rowSpacing*2, fieldW, fieldH, valorH);
  }
  exibirResultados2d(x + w + 20, y, 240, h);
}

void exibirResultados2d(float x, float y, float w, float h){
  // sombra
  noStroke(); fill(shadow_col);
  rect(x + 3, y + 3, w, h, 20);

  // fundo
  fill(248, 253, 248);
  if(deducao.isEmpty()){ stroke(borda_cor); strokeWeight(1.2); }
  else { noStroke(); }
  rect(x, y, w, h, 20);

  // header verde
  fill(header_bg); noStroke();
  rect(x, y, w, 38, 20, 20, 0, 0);
  fill(255); textSize(12); textAlign(LEFT, CENTER);
  text("Resultados", x + 14, y + 19);

  noStroke(); fill(texto_dark);
  textSize(14); textAlign(LEFT, TOP);

  float area = 0;
  if(svar == 21)      area = parseFloatSeguro(valorB) * parseFloatSeguro(valorH) / 2;
  else if(svar == 22) area = "Quadrado".equals(rotulo) ? pow(parseFloatSeguro(valorL),2) : parseFloatSeguro(valorB)*parseFloatSeguro(valorH);
  else if(svar == 23) area = PI * pow(parseFloatSeguro(valorR), 2);
  else if(svar == 24) area = 3 * pow(parseFloatSeguro(valorA), 2) * sqrt(3) / 2;
  else if(svar == 25) area = parseFloatSeguro(valorP) * parseFloatSeguro(valorA) / 2;
  else if(svar == 26) area = (parseFloatSeguro(valorP) + parseFloatSeguro(valorB)) * parseFloatSeguro(valorH) / 2;

  if(area > 0){
    fill(header_bg);
    textSize(14); textAlign(LEFT, TOP);
    text("Área = " + nf(area, 0, 2), x + 14, y + 50);
  } else {
    fill(color(160));
    textSize(12);
    text("Preencha os campos...", x + 14, y + 50);
  }
}

// ── Menu lateral 2D ──────────────────────────────
void menu2d(){
  // fundo verde escuro da sidebar
  noStroke(); fill(sidebar_bg);
  rect(0, 0, btnWidth, height);

  // -- menu: --
  menu2opcoes = 6;

  // -- cria os botoes (highlights) --
  for(int i = 0; i < menu2opcoes; i++) button(i);

  // -- cria ativacao dos botoes --
  if(mousePressed && deducao.isEmpty()){
    for(int i = 0; i < menu2opcoes; i++){
      if(mouseX >= 0 && mouseX <= btnWidth && mouseY >= btnHeight*i && mouseY <= btnHeight*(i+1)){
        svar = 21 + i;
        limparValores();
      }
    }
  }

  // -- ícones brancos das figuras --
  fill(255); noStroke();

  // triangulo
  triangle(btnWidth/4, btnHeight*3/4-6, btnWidth*3/4, btnHeight*3/4-6, btnWidth/2, btnHeight/4-2);
  // retangulo
  rect(btnWidth*0.2, btnHeight*1.24, btnWidth*0.6, btnHeight*0.38);
  // circulo
  circle(btnWidth/2, btnHeight*2.46, btnWidth/3.2);
  // hexagono
  desenharHexagono(btnWidth/2, btnHeight*3.42, btnWidth/5.5);
  // losango
  quad(btnWidth/2,    btnHeight*4.22,
       btnWidth/4,    btnHeight*4.5,
       btnWidth/2,    btnHeight*4.78,
       btnWidth*3/4,  btnHeight*4.5);
  // trapezio
  quad(btnWidth*0.25, btnHeight*5+btnHeight*0.72,
       btnWidth*0.75, btnHeight*5+btnHeight*0.72,
       btnWidth*0.625,btnHeight*5+btnHeight*0.26,
       btnWidth*0.375,btnHeight*5+btnHeight*0.26);

  // -- nomes das figuras (legenda pequena) --
  String[] nomes = {"Triângulo","Retângulo","Círculo","Hexágono","Losango","Trapézio"};
  fill(badge_text); textSize(9); textAlign(CENTER, CENTER);
  for(int i = 0; i < nomes.length; i++){
    text(nomes[i], btnWidth/2, btnHeight*(i+1) - 14);
  }

  // botao de voltar
  buttonBack(1);
}
