void viewInicial(){
  background(255);

  // ── Fundo base com listras ─────────────────────
  noStroke();
  fill(light_green);
  rect(0, 0, width, height);

  fill(255, 255, 255, 20);
  for(int i = 0; i < 11; i++){
    rect(8, i * height/11, width - 16, height/24, 14);
  }

  // ── Formas geométricas decorativas (sutis) ──────
  noStroke();

  // hexágono grande — canto superior esquerdo
  fill(74, 157, 62, 24);
  desenharHexagono(70, 72, 210);

  // círculo grande — canto inferior direito
  fill(74, 157, 62, 18);
  circle(width - 60, height + 50, 520);

  // triângulo — canto inferior esquerdo
  fill(74, 157, 62, 16);
  triangle(-50, height + 10, 400, height + 10, -50, height - 330);

  // hexágono médio — canto superior direito
  fill(74, 157, 62, 15);
  desenharHexagono(width - 90, 70, 170);

  // ── Badge acima do título ────────────────────────
  float cx = width / 2.0;

  float badgeW = 210;
  float badgeH = 28;
  float badgeX = cx - badgeW/2;
  float badgeY = 52;
  fill(backgroundButton); noStroke();
  rect(badgeX, badgeY, badgeW, badgeH, badgeH/2);
  fill(255);
  textSize(10);
  textAlign(CENTER, CENTER);
  text("GEOMETRIA  ·  ENSINO MÉDIO", cx, badgeY + badgeH/2);

  // ── Título principal ─────────────────────────────
  // sombra
  fill(0, 0, 0, 20);
  textSize(74);
  textAlign(CENTER, CENTER);
  text("GeoApp", cx + 2, 138);
  // texto
  fill(header_bg);
  textSize(74);
  text("GeoApp", cx, 136);

  // subtítulo
  fill(texto_dark);
  textSize(17);
  text("Referência de Geometria para o Ensino Médio", cx, 188);

  // separador decorativo com ponto central
  stroke(backgroundButton);
  strokeWeight(2);
  float sepW = 340;
  line(cx - sepW/2, 212, cx - 6, 212);
  line(cx + 6, 212, cx + sepW/2, 212);
  noStroke();
  fill(backgroundButton);
  circle(cx, 212, 9);

  // ── Três botões de navegação ─────────────────────
  float btnW  = 480;
  float btnH  = 76;
  float btnX  = cx - btnW/2;
  float gap   = 16;
  float btn1Y = 236;
  float btn2Y = btn1Y + btnH + gap;
  float btn3Y = btn2Y + btnH + gap;

  desenharBotaoMenu("Figuras 2D",   "Áreas e fórmulas das figuras planas",       1, btnX, btn1Y, btnW, btnH);
  desenharBotaoMenu("Sólidos 3D",   "Volumes e corpos geométricos no espaço",    2, btnX, btn2Y, btnW, btnH);
  desenharBotaoMenu("Questionário", "Teste seus conhecimentos com 10 questões",  3, btnX, btn3Y, btnW, btnH);

  // ── Rodapé ───────────────────────────────────────
  noStroke();
  fill(46, 107, 40, 150);
  textSize(11);
  textAlign(CENTER, CENTER);
  text("GeoApp  ·  Geometria Plana e Espacial", cx, height - 20);

  // ── Detecção de cliques ──────────────────────────
  if(clickDetectado){
    if(estaSobre(btnX, btn1Y, btnW, btnH)){ tocarClick(); svar = 2; clickDetectado = false; }
    if(estaSobre(btnX, btn2Y, btnW, btnH)){ tocarClick(); svar = 3; clickDetectado = false; }
    if(estaSobre(btnX, btn3Y, btnW, btnH)){ tocarClick(); svar = 4; clickDetectado = false; }
  }
}

// ── Botão de menu estilizado ──────────────────────
// tipo: 1 = 2D (triângulo), 2 = 3D (hexágono), 3 = Quiz (?)
void desenharBotaoMenu(String titulo, String subtitulo, int tipo,
                       float x, float y, float w, float h){
  boolean over = estaSobre(x, y, w, h);

  // sombra
  noStroke();
  fill(0, 0, 0, over ? 42 : 28);
  rect(x + 4, y + 4, w, h, 22);

  // fundo do card
  fill(over ? card_hover : 255);
  stroke(over ? backgroundButton : borda_cor);
  strokeWeight(over ? 2.0 : 1.0);
  rect(x, y, w, h, 22);

  // ── Área do ícone (quadrado verde à esquerda) ────
  float iconSz = h - 14;
  float iconX  = x + 10;
  float iconY  = y + 7;
  float icx    = iconX + iconSz/2;
  float icy    = iconY + iconSz/2;

  fill(over ? header_bg : backgroundButton);
  noStroke();
  rect(iconX, iconY, iconSz, iconSz, 14);

  // ícone dentro do quadrado verde
  fill(255); noStroke();
  if(tipo == 1){
    // triângulo
    triangle(icx - 17, icy + 13,
             icx + 17, icy + 13,
             icx,      icy - 15);
  } else if(tipo == 2){
    // hexágono
    desenharHexagono(icx, icy, 19);
  } else {
    // ponto de interrogação
    textSize(30);
    textAlign(CENTER, CENTER);
    text("?", icx, icy);
  }

  // ── Textos do botão ──────────────────────────────
  noStroke();
  fill(over ? header_bg : texto_dark);
  textSize(20);
  textAlign(LEFT, CENTER);
  text(titulo, x + iconSz + 26, y + h * 0.36);

  fill(over ? color(55, 125, 52) : color(115));
  textSize(12);
  text(subtitulo, x + iconSz + 26, y + h * 0.68);

  // ── Seta circular à direita ───────────────────────
  float arrowCx = x + w - 36;
  float arrowCy = y + h / 2;
  fill(over ? backgroundButton : color(200, 220, 200));
  noStroke();
  circle(arrowCx, arrowCy, 30);
  fill(255);
  textSize(15);
  textAlign(CENTER, CENTER);
  text("→", arrowCx, arrowCy);
}
