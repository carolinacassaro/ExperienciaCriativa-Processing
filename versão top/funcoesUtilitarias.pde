void desenharHexagono(float x, float y, float raio) {
  float angulo = TWO_PI / 6;
  beginShape();
  for (int i = 0; i < 6; i++) {
    float sx = x + cos(angulo * i) * raio;
    float sy = y + sin(angulo * i) * raio;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

boolean estaSobre(float x, float y, float w, float h){
  return mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h;
}

void tocarClick(){
  if(soundAvailable && clickSound != null){
    soundSetAmp(clickSound, 0);
    soundPlay(clickSound);
    soundFade(clickSound, 0, 0.12, 40);
    soundFade(clickSound, 0.12, 0, 160);
  }
}

// ── Sound helpers via reflexão ───────────────────
void soundSetAmp(Object osc, float a){
  if(osc == null || !soundAvailable) return;
  try{
    java.lang.reflect.Method m = osc.getClass().getMethod("amp", float.class);
    m.invoke(osc, a);
  } catch(Exception e){ }
}

void soundPlay(Object osc){
  if(osc == null || !soundAvailable) return;
  try{
    java.lang.reflect.Method m = osc.getClass().getMethod("play");
    m.invoke(osc);
  } catch(Exception e){ }
}

void soundSetFreq(Object osc, float f){
  if(osc == null || !soundAvailable) return;
  try{
    java.lang.reflect.Method m = osc.getClass().getMethod("freq", float.class);
    m.invoke(osc, f);
  } catch(Exception e){ }
}

void soundFade(Object osc, float startAmp, float endAmp, int durationMs){
  if(osc == null || !soundAvailable) return;
  soundSetAmp(osc, endAmp);
}

// ── Botão da barra lateral ───────────────────────
void button(int order){
  float x = 0;
  float y = order * btnHeight;
  boolean over = estaSobre(x, y, btnWidth, btnHeight);
  boolean active = (svar == 21 + order || svar == 31 + order);

  noStroke();
  if(active){
    // destaque do botão ativo
    fill(255, 255, 255, 48);
    rect(x, y, btnWidth, btnHeight);
    // barra de acento à esquerda
    fill(255, 255, 255, 210);
    rect(x, y + 14, 4, btnHeight - 28, 2);
  } else if(over && deducao.isEmpty()){
    fill(255, 255, 255, 22);
    rect(x, y, btnWidth, btnHeight);
  }
  // linha separadora
  fill(255, 255, 255, 14);
  rect(x + 16, y + btnHeight - 1, btnWidth - 32, 1);
}

// ── Botão de voltar ──────────────────────────────
void buttonBack(int redirection){
  float x = 0;
  float y = height - btnHeight;
  boolean over = estaSobre(x, y, btnWidth, btnHeight);

  // separador no topo
  noStroke();
  fill(255, 255, 255, 22);
  rect(x + 16, y, btnWidth - 32, 1);

  fill(over ? color(255,255,255,48) : color(255,255,255,16));
  rect(x, y, btnWidth, btnHeight);

  // seta
  fill(255);
  textSize(36);
  textAlign(CENTER, CENTER);
  text("←", btnWidth/2, y + btnHeight * 0.40);

  // label
  fill(badge_text);
  textSize(10);
  text("Voltar", btnWidth/2, y + btnHeight * 0.74);

  // usa clickDetectado (não mousePressed) para evitar que o clique
  // que fecha o popup também acione a navegação no frame seguinte
  if(clickDetectado && over){
    tocarClick();
    if(!deducao.isEmpty()){
      deducao = "";
    } else {
      svar = redirection;
      limparValores();
    }
  }
}

// ── Título de seção (com barra de acento verde) ──
void titulo(String texto, float x, float y){
  float tW = canvaW * 7/13;
  float tH = canvaH * 0.5/14;

  // sombra
  noStroke(); fill(shadow_col);
  rect(x + 3, y + 3, tW, tH, 28);

  // barra de acento à esquerda
  fill(backgroundButton); noStroke();
  rect(x, y, 5, tH, 3);

  // fundo branco
  fill(255);
  if(deducao.isEmpty()){ stroke(borda_cor); strokeWeight(1); }
  else { noStroke(); }
  rect(x + 5, y, tW - 5, tH, 0, 28, 28, 0);

  // texto
  noStroke(); fill(texto_dark);
  textSize(13);
  textAlign(LEFT, CENTER);
  text(texto, x + 22, y + tH/2);
}

// ── Título curto (para glossário) ────────────────
void tituloCurto(String texto, float x, float y, float w){
  float tH = canvaH * 0.5/14;

  noStroke(); fill(shadow_col);
  rect(x + 2, y + 2, w, tH, 3);

  fill(header_bg); noStroke();
  rect(x, y, w, tH, 3);

  fill(255);
  textSize(10);
  textAlign(CENTER, CENTER);
  text(texto, x + w/2, y + tH/2);
}

// ── Card de fórmula ──────────────────────────────
void card(String conteudo, String formula, float x, float y, float w, float h){
  boolean over = estaSobre(x, y, w, h);

  // sombra
  noStroke(); fill(shadow_col);
  rect(x + 3, y + 3, w, h, 24);

  // fundo
  fill(over ? card_hover : 255);
  if(deducao.isEmpty()){
    stroke(over ? backgroundButton : borda_cor);
    strokeWeight(over ? 2 : 1);
  } else { noStroke(); }
  rect(x, y, w, h, 24);

  // fórmula
  noStroke(); fill(texto_dark);
  textSize(22);
  textAlign(CENTER, CENTER);
  text(formula, x + w/2, y + h/2 - 12);

  // hint "ver dedução"
  fill(over ? backgroundButton : color(168));
  textSize(9);
  text("▶  ver dedução", x + w/2, y + h - 16);

  if(mousePressed && over){
    tocarClick();
    deducao = conteudo;
  }
}

// ── Botão rótulo (estilo pílula) ─────────────────
void rotulo(String texto, float x, float y, float w, float h){
  boolean over = estaSobre(x, y, w, h);
  boolean active = texto.equals(rotulo);

  // sombra
  noStroke(); fill(shadow_col);
  rect(x + 2, y + 2, w, h, h/2);

  // fundo
  if(active)                      fill(backgroundButton);
  else if(over && deducao.isEmpty()) fill(card_hover);
  else                             fill(255);

  if(deducao.isEmpty()){
    stroke(active ? header_bg : borda_cor);
    strokeWeight(active ? 1.5 : 1);
  } else { noStroke(); }
  rect(x, y, w, h, h/2);

  // texto
  noStroke();
  fill(active ? 255 : (over ? header_bg : texto_dark));
  textAlign(CENTER, CENTER);
  textSize(12);
  text(texto, x + w/2, y + h/2);

  if(mousePressed && over && deducao.isEmpty()){
    tocarClick();
    rotulo = texto;
    limparValores();
  }
}

// ── Modal de dedução ─────────────────────────────
void popUp(){
  // sobreposição escura
  noStroke();
  fill(0, 0, 0, 118);
  rect(0, 0, width, height);

  // restaura sidebar
  fill(sidebar_bg); noStroke();
  rect(0, 0, btnWidth, height);
  buttonBack(0);

  // card dimensions
  float cx = canvaX + 24;
  float cy = 16;
  float cw = canvaW - 48;
  float ch = canvaH - 32;

  // sombra do card
  noStroke(); fill(0, 0, 0, 38);
  rect(cx + 5, cy + 5, cw, ch, 24);

  // fundo do card
  fill(255);
  stroke(borda_cor); strokeWeight(1);
  rect(cx, cy, cw, ch, 24);

  // faixa verde no topo
  fill(header_bg); noStroke();
  rect(cx, cy, cw, 52, 24, 24, 0, 0);

  // título do modal
  fill(255);
  textSize(16);
  textAlign(LEFT, CENTER);
  text("DEDUÇÃO DA FÓRMULA", cx + 24, cy + 26);

  // hint de fechamento
  fill(badge_text);
  textSize(10);
  textAlign(RIGHT, CENTER);
  text("← ou ESPAÇO para fechar", cx + cw - 16, cy + 26);

  // divisor
  stroke(220); strokeWeight(1);
  line(cx + 18, cy + 52, cx + cw - 18, cy + 52);

  // ── Coordenadas do conteúdo visual ──────────────
  float mx = cx;
  float my = cy + 68;
  float mw = cw;
  float mh = ch - 68;
  float fX = mx + mw/13;
  float fY = my + mh/14;
  float fW = mw * 2/13;
  float fH = mh * 4/14;
  float sx = mx + mw * 4/13;
  float sy = my + mh * 2/14;
  float lh = mh / 14;

  boolean deducaoEspecial = false;

  // ── DIAGONAL DO QUADRADO ────────────────────────
  if("Quadrado".equals(rotulo) && "diagonal".equals(deducao)){
    deducaoEspecial = true;
    fill(248,252,248); stroke(borda_cor); strokeWeight(1);
    rect(fX, fY, fW, fH);
    stroke(backgroundButton); strokeWeight(2);
    line(fX, fY, fX+fW, fY+fH);
    fill(texto_dark); noStroke(); textSize(16); textAlign(CENTER, CENTER);
    text("A", fX-15, fY+fH/2);
    text("B", fX+fW/2, fY+fH+18);
    text("d", fX+fW/2+8, fY+lh*0.75);
    textAlign(LEFT, TOP); textSize(18);
    text("A = B  (quadrado)", sx, sy);
    text("d² = A² + A²",     sx, sy+lh);
    text("d² = 2 × A²",      sx, sy+lh*2);
    text("d = √(2 × A²)",    sx, sy+lh*3);
    text("d = √2 × A",       sx, sy+lh*4);
    text("d = A × √2",       sx, sy+lh*5);
  }

  // ── ÁREA DO TRIÂNGULO ───────────────────────────
  if("ded_triangulo".equals(deducao)){
    deducaoEspecial = true;
    fill(220,235,220); stroke(160); strokeWeight(1);
    rect(fX, fY, fW, fH);
    fill(figura_fill); stroke(backgroundButton); strokeWeight(2);
    triangle(fX, fY+fH, fX+fW, fY+fH, fX, fY);
    noStroke();
    fill(texto_dark); textSize(16); textAlign(CENTER, CENTER);
    text("b", fX+fW/2, fY+fH+20);
    text("h", fX-20, fY+fH/2);
    textAlign(LEFT, TOP); textSize(18);
    text("1. O triângulo cabe na metade de um", sx, sy);
    text("   retângulo de mesma base e altura.", sx, sy+lh*0.7);
    text("2. Área do retângulo = b × h",         sx, sy+lh*1.8);
    text("3. O triângulo ocupa metade disso.",    sx, sy+lh*3.0);
    text("4. Portanto:",                          sx, sy+lh*4.2);
    text("   A = b × h / 2",                     sx, sy+lh*5.2);
  }

  // ── ÁREA DO RETÂNGULO ───────────────────────────
  if("ded_retangulo".equals(deducao)){
    deducaoEspecial = true;
    fill(figura_fill); stroke(backgroundButton); strokeWeight(2);
    rect(fX, fY, fW, fH);
    stroke(100); strokeWeight(1);
    for(int i=1;i<3;i++) line(fX+fW*i/3, fY, fX+fW*i/3, fY+fH);
    for(int i=1;i<4;i++) line(fX, fY+fH*i/4, fX+fW, fY+fH*i/4);
    noStroke();
    fill(texto_dark); textSize(16); textAlign(CENTER, CENTER);
    text("b", fX+fW/2, fY+fH+20);
    text("h", fX-20, fY+fH/2);
    textAlign(LEFT, TOP); textSize(18);
    text("1. O retângulo tem b unidades de base", sx, sy);
    text("   e h unidades de altura.",            sx, sy+lh*0.7);
    text("2. Ele forma b × h quadradinhos de",    sx, sy+lh*1.8);
    text("   área unitária.",                     sx, sy+lh*2.5);
    text("3. Portanto:",                          sx, sy+lh*3.7);
    text("   A = b × h",                         sx, sy+lh*4.7);
  }

  // ── ÁREA DO CÍRCULO ─────────────────────────────
  if("ded_circulo".equals(deducao)){
    deducaoEspecial = true;
    float ccx=fX+fW/2, ccy=fY+fH/2, cr=min(fW,fH)/2*0.82;
    fill(figura_fill); stroke(backgroundButton); strokeWeight(2);
    circle(ccx, ccy, cr*2);
    stroke(header_bg); strokeWeight(2);
    line(ccx, ccy, ccx+cr, ccy);
    fill(texto_dark); noStroke(); textSize(16); textAlign(CENTER, CENTER);
    text("R", ccx+cr/2, ccy-16);
    fill(header_bg); circle(ccx, ccy, 8);
    textAlign(LEFT, TOP); textSize(17);
    text("Arquimedes (250 a.C.) inscreveu polígonos", sx, sy);
    text("dentro do círculo aumentando o número de", sx, sy+lh*0.8);
    text("lados até a área se aproximar do círculo.", sx, sy+lh*1.6);
    text("A dedução completa usa Cálculo Integral",   sx, sy+lh*2.8);
    text("(nível superior). Resultado:",              sx, sy+lh*3.6);
    text("   A = π × R²",                            sx, sy+lh*4.8);
    text("π ≈ 3,14  |  R = raio do círculo",         sx, sy+lh*5.8);
  }

  // ── ÁREA DO HEXÁGONO ────────────────────────────
  if("ded_hexagono".equals(deducao)){
    deducaoEspecial = true;
    float hcx=fX+fW/2, hcy=fY+fH/2, hr=min(fW,fH)/2*0.82;
    float ang=TWO_PI/6;
    stroke(backgroundButton); strokeWeight(1);
    for(int i=0;i<6;i++){
      float x1=hcx+cos(ang*i)*hr, y1=hcy+sin(ang*i)*hr;
      float x2=hcx+cos(ang*(i+1))*hr, y2=hcy+sin(ang*(i+1))*hr;
      fill(i%2==0 ? figura_fill : color(200,228,200));
      triangle(hcx, hcy, x1, y1, x2, y2);
    }
    fill(texto_dark); noStroke(); textSize(16); textAlign(CENTER, CENTER);
    text("a", hcx+cos(ang*0.5)*hr*1.32, hcy+sin(ang*0.5)*hr*1.32);
    textAlign(LEFT, TOP); textSize(18);
    text("1. O hexágono regular é formado por",    sx, sy);
    text("   6 triângulos equiláteros de lado a.", sx, sy+lh*0.7);
    text("2. Área de 1 triângulo = a² × √3 / 4",  sx, sy+lh*1.8);
    text("3. Área total = 6 × (a² × √3 / 4)",     sx, sy+lh*3.0);
    text("4. Simplificando:",                      sx, sy+lh*4.2);
    text("   A = 3 × a² × √3 / 2",               sx, sy+lh*5.2);
  }

  // ── ÁREA DO LOSANGO ─────────────────────────────
  if("ded_losango".equals(deducao)){
    deducaoEspecial = true;
    fill(220,235,220); stroke(160); strokeWeight(1);
    rect(fX, fY, fW, fH);
    fill(figura_fill); stroke(backgroundButton); strokeWeight(2);
    quad(fX+fW/2, fY, fX+fW, fY+fH/2, fX+fW/2, fY+fH, fX, fY+fH/2);
    noStroke();
    fill(texto_dark); textSize(16); textAlign(CENTER, CENTER);
    text("D", fX+fW/2, fY+fH+20);
    text("d", fX-20,   fY+fH/2);
    textAlign(LEFT, TOP); textSize(18);
    text("1. O losango cabe na metade de um",  sx, sy);
    text("   retângulo de lados D e d",        sx, sy+lh*0.7);
    text("   (as diagonais do losango).",       sx, sy+lh*1.4);
    text("2. Área do retângulo = D × d",       sx, sy+lh*2.6);
    text("3. O losango ocupa metade disso.",   sx, sy+lh*3.8);
    text("4. Portanto:",                       sx, sy+lh*5.0);
    text("   A = D × d / 2",                  sx, sy+lh*6.0);
  }

  // ── ÁREA DO TRAPÉZIO ────────────────────────────
  if("ded_trapezio".equals(deducao)){
    deducaoEspecial = true;
    float off=fW*0.20;
    fill(figura_fill); stroke(backgroundButton); strokeWeight(2);
    quad(fX, fY+fH, fX+fW, fY+fH, fX+fW-off, fY, fX+off, fY);
    stroke(80); strokeWeight(1);
    line(fX+off, fY, fX+off, fY+fH);
    noStroke();
    fill(texto_dark); textSize(16); textAlign(CENTER, CENTER);
    text("B", fX+fW/2, fY+fH+20);
    text("b", fX+fW/2, fY-15);
    text("h", fX+off-20, fY+fH/2);
    textAlign(LEFT, TOP); textSize(18);
    text("1. Dois trapézios iguais unidos formam", sx, sy);
    text("   um paralelogramo.",                   sx, sy+lh*0.7);
    text("2. Esse paralelogramo tem:",             sx, sy+lh*1.8);
    text("   base = B + b  e  altura = h",        sx, sy+lh*2.5);
    text("3. Área paralelogramo = (B+b) × h",     sx, sy+lh*3.7);
    text("4. Como usamos 2 trapézios:",           sx, sy+lh*4.9);
    text("   A = (B+b) × h / 2",                 sx, sy+lh*5.9);
  }

  // ── VOLUME DO PRISMA ────────────────────────────
  if(deducao.startsWith("Deducao do volume do prisma")){
    deducaoEspecial = true;

    // figura: cubo em perspectiva isométrica simplificada
    float px = fX + fW*0.10;
    float py = fY + fH*0.22;
    float pw = fW*0.80;
    float ph = fH*0.52;
    float ox = pw*0.30;
    float oy = ph*0.30;

    // face traseira (mais escura)
    fill(color(180, 210, 180)); stroke(backgroundButton); strokeWeight(1.5);
    quad(px+ox, py, px+pw+ox, py, px+pw+ox, py+ph, px+ox, py+ph);
    // face lateral direita
    fill(color(150, 190, 150));
    quad(px+pw, py+oy, px+pw+ox, py, px+pw+ox, py+ph, px+pw, py+ph+oy);
    // face frontal (mais clara)
    fill(figura_fill);
    quad(px, py+oy, px+pw, py+oy, px+pw, py+ph+oy, px, py+ph+oy);

    // seta de altura h na lateral esquerda
    stroke(header_bg); strokeWeight(2);
    float arX = px - 18;
    line(arX, py+oy, arX, py+ph+oy);
    fill(header_bg); noStroke();
    triangle(arX-5, py+oy+8, arX+5, py+oy+8, arX, py+oy);
    triangle(arX-5, py+ph+oy-8, arX+5, py+ph+oy-8, arX, py+ph+oy);

    // rótulos
    fill(texto_dark); noStroke(); textSize(14); textAlign(CENTER, CENTER);
    text("Ab", px+pw/2, py+ph+oy+18);
    text("h", arX-14, py+ph/2+oy/2+oy/2);

    // texto explicativo
    textAlign(LEFT, TOP); textSize(17);
    text("1. Ab = área da base do prisma",    sx, sy);
    text("   (quadrada, triangular, etc.).",  sx, sy+lh*0.8);
    text("2. O prisma é a base \"empilhada\"",  sx, sy+lh*2.0);
    text("   ao longo da altura h.",           sx, sy+lh*2.8);
    text("3. Volume = base × altura:",         sx, sy+lh*4.0);
    text("   V = Ab × h",                     sx, sy+lh*5.2);
    // linha separadora
    stroke(borda_cor); strokeWeight(1);
    line(sx, sy+lh*6.2, sx+mw*0.48, sy+lh*6.2);
    noStroke(); fill(color(80,140,80)); textSize(14);
    text("Ab varia com o tipo de base:",       sx, sy+lh*6.7);
    fill(texto_dark); textSize(13);
    text("Quadrada:    Ab = l²",               sx, sy+lh*7.6);
    text("Triangular:  Ab = b × h_b / 2",     sx, sy+lh*8.4);
    text("Hexagonal:   Ab = P × a / 2",       sx, sy+lh*9.2);
  }

  // ── VOLUME DA PIRÂMIDE ──────────────────────────
  if(deducao.startsWith("Deducao do volume da piramide")){
    deducaoEspecial = true;

    float pcx = fX + fW/2;
    float pBase = fY + fH*0.88;
    float pTopo = fY + fH*0.08;
    float hw    = fW*0.42;
    float ox2   = fW*0.22;
    float oy2   = fH*0.14;

    // base da pirâmide (losango em perspectiva)
    fill(color(180,210,180)); stroke(backgroundButton); strokeWeight(1.5);
    quad(pcx,      pBase-oy2,
         pcx+hw,   pBase,
         pcx,      pBase+oy2,
         pcx-hw,   pBase);
    // face lateral esquerda
    fill(color(150,190,150));
    triangle(pcx-hw, pBase, pcx, pBase-oy2, pcx, pTopo);
    // face lateral direita (mais clara)
    fill(figura_fill);
    triangle(pcx+hw, pBase, pcx, pBase-oy2, pcx, pTopo);

    // linha de altura tracejada
    stroke(header_bg); strokeWeight(1.5);
    for(int i=0; i<6; i++){
      float ty = pTopo + i*(pBase-oy2-pTopo)/6;
      float ny = pTopo + (i+0.6)*(pBase-oy2-pTopo)/6;
      line(pcx, ty, pcx, ny);
    }
    // ponto no topo e na base
    fill(header_bg); noStroke();
    circle(pcx, pTopo, 6);
    circle(pcx, pBase-oy2, 6);

    // rótulos
    fill(texto_dark); noStroke(); textSize(14); textAlign(CENTER, CENTER);
    text("Ab", pcx, pBase+oy2+14);
    text("h", pcx+10, (pTopo+pBase)/2 - oy2/2);

    // texto explicativo
    textAlign(LEFT, TOP); textSize(17);
    text("1. Um prisma de mesma base (Ab)",     sx, sy);
    text("   e altura (h) equivale a",          sx, sy+lh*0.8);
    text("   exatamente 3 pirâmides iguais.",   sx, sy+lh*1.6);
    text("2. Volume do prisma = Ab × h",        sx, sy+lh*2.9);
    text("3. Cada pirâmide ocupa 1/3:",         sx, sy+lh*4.0);
    text("   V = Ab × h / 3",                  sx, sy+lh*5.2);
    // separador
    stroke(borda_cor); strokeWeight(1);
    line(sx, sy+lh*6.2, sx+mw*0.48, sy+lh*6.2);
    noStroke(); fill(color(80,140,80)); textSize(14);
    text("Ab varia com o tipo de base:",        sx, sy+lh*6.7);
    fill(texto_dark); textSize(13);
    text("Quadrada:    Ab = l²",                sx, sy+lh*7.6);
    text("Triangular:  Ab = b × h_b / 2",      sx, sy+lh*8.4);
    text("Hexagonal:   Ab = P × a / 2",        sx, sy+lh*9.2);
  }

  // ── VOLUME DO CONE ──────────────────────────────
  if(deducao.startsWith("Deducao do volume do cone")){
    deducaoEspecial = true;

    float ccx  = fX + fW/2;
    float ctopo = fY + fH*0.06;
    float cbase = fY + fH*0.82;
    float cr    = fW*0.42;
    float ey    = fH*0.10; // raio vertical da elipse da base

    // elipse da base
    fill(color(180,210,180)); stroke(backgroundButton); strokeWeight(1.5);
    ellipse(ccx, cbase, cr*2, ey*2);

    // lados do cone
    fill(figura_fill);
    // triângulo isósceles cobrindo os lados
    beginShape();
    vertex(ccx, ctopo);
    vertex(ccx - cr, cbase);
    // arco inferior da elipse (metade da frente)
    for(int i = 180; i <= 360; i += 6){
      float a = radians(i);
      vertex(ccx + cr*cos(a), cbase + ey*sin(a));
    }
    vertex(ccx + cr, cbase);
    endShape(CLOSE);

    // linha de raio na base
    stroke(header_bg); strokeWeight(2);
    line(ccx, cbase, ccx+cr, cbase);
    fill(header_bg); noStroke(); circle(ccx, cbase, 6);

    // linha de altura tracejada
    stroke(header_bg); strokeWeight(1.5);
    for(int i=0; i<6; i++){
      float ty = ctopo + i*(cbase-ctopo)/6;
      float ny = ctopo + (i+0.6)*(cbase-ctopo)/6;
      line(ccx, ty, ccx, ny);
    }

    // rótulos
    fill(texto_dark); noStroke(); textSize(14); textAlign(CENTER, CENTER);
    text("r", ccx+cr/2, cbase+ey+14);
    text("h", ccx+12, (ctopo+cbase)/2);

    // texto explicativo
    textAlign(LEFT, TOP); textSize(17);
    text("1. A base do cone é um círculo:", sx, sy);
    text("   Ab = π × r²",                 sx, sy+lh*0.9);
    text("2. Um cilindro de mesma base",    sx, sy+lh*2.2);
    text("   e altura tem:",               sx, sy+lh*3.0);
    text("   V_cil = π × r² × h",         sx, sy+lh*3.8);
    text("3. O cone ocupa exatamente",     sx, sy+lh*5.1);
    text("   1/3 do cilindro:",            sx, sy+lh*5.9);
    text("   V = π × r² × h / 3",        sx, sy+lh*7.0);
  }

  // ── VOLUME DA ESFERA ────────────────────────────
  if(deducao.startsWith("Deducao do volume da esfera")){
    deducaoEspecial = true;

    float ecx = fX + fW/2;
    float ecy = fY + fH/2;
    float er  = min(fW, fH) * 0.42;

    // círculo principal
    fill(figura_fill); stroke(backgroundButton); strokeWeight(2);
    circle(ecx, ecy, er*2);

    // equador (elipse horizontal)
    noFill(); stroke(backgroundButton); strokeWeight(1.5);
    ellipse(ecx, ecy, er*2, er*0.40);

    // meridiano vertical (elipse vertical)
    stroke(color(backgroundButton)); strokeWeight(1);
    ellipse(ecx, ecy, er*0.40, er*2);

    // raio
    stroke(header_bg); strokeWeight(2);
    line(ecx, ecy, ecx+er*cos(radians(-35)), ecy+er*sin(radians(-35)));
    fill(header_bg); noStroke(); circle(ecx, ecy, 7);

    // rótulo do raio
    fill(texto_dark); noStroke(); textSize(14); textAlign(CENTER, CENTER);
    text("r", ecx+er*0.62, ecy-er*0.30);

    // texto explicativo
    textAlign(LEFT, TOP); textSize(17);
    text("1. A esfera é gerada girando",       sx, sy);
    text("   um semicírculo 360° em torno",    sx, sy+lh*0.8);
    text("   do seu diâmetro.",                sx, sy+lh*1.6);
    text("2. Arquimedes provou que a esfera",  sx, sy+lh*2.9);
    text("   ocupa exatamente 2/3 do",         sx, sy+lh*3.7);
    text("   cilindro que a circunscreve.",    sx, sy+lh*4.5);
    text("3. A dedução rigorosa usa",          sx, sy+lh*5.8);
    text("   Cálculo Integral (fatias",        sx, sy+lh*6.6);
    text("   infinitesimais). Resultado:",     sx, sy+lh*7.4);
    text("   V = 4 × π × r³ / 3",            sx, sy+lh*8.5);
  }

  // ── FALLBACK: texto simples (circunferência, etc.) ─
  if(!deducaoEspecial){
    noStroke(); fill(texto_dark);
    textAlign(LEFT, TOP);
    textSize(18);
    text(deducao, cx + 26, cy + 66, cw - 52, ch - 76);
  }

  if(keyPressed && key == ' '){
    deducao = "";
  }
}

// ── Fundo da área canvas (com listras) ───────────
void fundoCanvas(){
  fill(light_green); noStroke();
  rect(canvaX, canvaY, canvaW, canvaH);

  // listras suaves (abaixo do cabeçalho)
  fill(255, 255, 255, 20);
  float stripeTop = 46;
  float stripeArea = canvaH - stripeTop;
  for(int i = 0; i < 10; i++){
    float sy = canvaY + stripeTop + i * stripeArea / 10;
    rect(canvaX + 8, sy, canvaW - 16, stripeArea / 22, 14);
  }
}

// ── Cabeçalho verde do canvas ────────────────────
void cabecalhoCanvas(String nome, String categoria){
  fill(header_bg); noStroke();
  rect(canvaX, 0, canvaW, 44);

  // nome da figura
  fill(255);
  textSize(17);
  textAlign(LEFT, CENTER);
  text(nome, canvaX + 20, 22);

  // badge de categoria
  float badgeW = 94;
  float badgeX = canvaX + canvaW - badgeW - 14;
  fill(255, 255, 255, 28); noStroke();
  rect(badgeX, 10, badgeW, 24, 12);
  fill(badge_text);
  textSize(10);
  textAlign(CENTER, CENTER);
  text(categoria, badgeX + badgeW/2, 22);
}

// ── Painel branco para a figura (coluna esquerda) ─
void painelFigura(float x, float y, float w, float h){
  noStroke(); fill(shadow_col);
  rect(x + 3, y + 3, w, h, 20);

  fill(255);
  if(deducao.isEmpty()){ stroke(borda_cor); strokeWeight(1); }
  else { noStroke(); }
  rect(x, y, w, h, 20);
}

// ── Glossário 2D (com barra de acento) ───────────
void glossario2d(String texto, float x, float y, float w, float h){
  noStroke(); fill(shadow_col);
  rect(x + 2, y + 2, w, h, 16);

  // barra de acento
  fill(backgroundButton); noStroke();
  rect(x, y, 4, h, 2);

  // fundo
  fill(248, 252, 248);
  if(deducao.isEmpty()){ stroke(borda_cor); strokeWeight(1); }
  else { noStroke(); }
  rect(x + 4, y, w - 4, h, 0, 16, 16, 0);

  // texto
  noStroke(); fill(texto_dark);
  textSize(11);
  textAlign(LEFT, TOP);
  text(texto, x + 16, y + 10);
}

// ── Campo de entrada 2D ──────────────────────────
void campoEntrada2d(String label, float x, float y, float w, float h, String valor){
  boolean over = estaSobre(x, y, w, h);
  boolean active = activeInput.equals(label);

  noStroke(); fill(shadow_col);
  rect(x + 1, y + 1, w, h, 12);

  fill(active ? color(218,250,218) : over ? color(235,250,235) : color(250,252,250));
  if(deducao.isEmpty()){
    stroke(active ? backgroundButton : borda_cor);
    strokeWeight(active ? 2 : 1);
  } else { noStroke(); }
  rect(x, y, w, h, 12);

  // ponto indicador quando ativo
  if(active){
    fill(backgroundButton); noStroke();
    circle(x + 9, y + h/2, 6);
  }

  noStroke(); fill(texto_dark);
  textSize(13);
  textAlign(LEFT, CENTER);
  text(label + ": " + (valor.equals("") ? "..." : valor), x + (active ? 20 : 10), y + h/2);

  if(mousePressed && over){
    tocarClick();
    activeInput = label;
  }
}

void limparValores() {
  valorL = "";
  valorB = "";
  valorH = "";
  valorP = "";
  valorA = "";
  valorR = "";
  activeInput = "";
}

// ── Strings de dedução 2D ────────────────────────
String deducaoTriangulo() {
  return "Deducao da area do Triangulo:\n\n1. Imagine um retangulo de base (b) e altura (h).\n2. A area desse retangulo e (b x h).\n3. Ao cortar esse retangulo com uma diagonal, formam-se dois triangulos iguais.\n4. Portanto, a area de um unico triangulo e a metade do retangulo original:\n\nA = (b x h) / 2";
}

String deducaoRetangulo() {
  return "Deducao da area do Retangulo / Quadrado:\n\n1. O retangulo e uma figura de lados ortogonais.\n2. Imagine dividi-lo em pequenos quadrados de 1x1.\n3. O numero total de quadrados que cabem dentro dele e obtido multiplicando o tamanho da base (b) pelo tamanho da altura (h).\n\nA = b x h";
}

String deducaoHexagono() {
  return "Deducao da area do Hexagono Regular:\n\n1. Um hexagono regular pode ser dividido a partir do seu centro em exatos 6 triangulos equilateros identicos.\n2. A area de cada triangulo e (a^2 x raiz(3)) / 4.\n3. Multiplicando essa area por 6, chegamos a formula geral do hexagono.\n\nA = 3 x a^2 x raiz(3) / 2";
}

String deducaoLosango() {
  return "Deducao da area do Losango:\n\n1. O losango e delimitado por uma diagonal maior (D) e uma menor (d).\n2. Imagine circunscrever um retangulo em volta do losango. As medidas do retangulo seriam D e d.\n3. A area desse retangulo seria D x d. O losango ocupa exatamente metade desse retangulo.\n\nA = (D x d) / 2";
}

String deducaoTrapezio() {
  return "Deducao da area do Trapezio:\n\n1. Pegue um trapezio de base maior (B), base menor (b) e altura (h).\n2. Se voce colar um segundo trapezio invertido e identico ao lado do primeiro, eles formarao um paralelogramo de base total (B+b) e altura h.\n3. A area desse paralelogramo e (B+b) x h. Como usamos dois trapezios, a area de um so e a metade disso.\n\nA = (B+b) x h / 2";
}
