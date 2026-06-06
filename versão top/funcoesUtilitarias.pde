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

  // conteúdo
  noStroke(); fill(texto_dark);
  textAlign(LEFT, TOP);
  textSize(18);
  text(deducao, cx + 26, cy + 66, cw - 52, ch - 76);

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
