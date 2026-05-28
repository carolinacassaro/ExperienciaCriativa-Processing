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
  // toca um clique curto se a biblioteca estiver disponível
  if(soundAvailable && clickSound != null){
    // play with a short fade in and fade out
    soundSetAmp(clickSound, 0);
    soundPlay(clickSound);
    soundFade(clickSound, 0, 0.12, 40);   // quick fade in (40ms)
    soundFade(clickSound, 0.12, 0, 160);  // fade out (160ms)
  }
}

// Sound helper por reflexão — funções seguras (no-op se soundUnavailable)
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

// Fade amplitude from startAmp -> endAmp over durationMs (non-blocking)
void soundFade(Object osc, float startAmp, float endAmp, int durationMs){
  if(osc == null || !soundAvailable) return;
  new Thread(new Runnable(){ public void run(){
    int steps = max(1, durationMs/16);
    for(int i = 0; i <= steps; i++){
      float t = i / (float) steps;
      float val = lerp(startAmp, endAmp, t);
      soundSetAmp(osc, val);
      try{ Thread.sleep(durationMs / steps); } catch(Exception e){}
    }
  }}).start();
}

void button(int order){
  float x = 0;
  float y = order * btnHeight;
  boolean over = estaSobre(x, y, btnWidth, btnHeight);
  fill(over ? color(220, 235, 255) : backgroundButton);
  stroke(80);
  strokeWeight(1);
  rect(x, y, btnWidth, btnHeight, 20);
}

void buttonBack(int redirection){
  float x = 0;
  float y = height - btnHeight;
  boolean over = estaSobre(x, y, btnWidth, btnHeight);
  fill(over ? color(220, 235, 255) : backgroundButton);
  stroke(80);
  strokeWeight(1);
  rect(x, y, btnWidth, btnHeight, 20);
  fill(0);
  textSize(64);
  textAlign(CENTER, CENTER);
  text("←",btnWidth/2,y+btnHeight/2);
  
  if(mousePressed && over){
    tocarClick();
    if(!deducao.isEmpty()){
      // Se popup está aberto, fechar
      deducao = "";
    } else {
      // Senão, voltar ao redirecionamento
      svar = redirection;
    }
  }
}

void titulo(String texto, float x, float y){
  float tituloX = x;
  float tituloY = y;
  float tituloW = canvaW*7/13;
  float tituloH = canvaH*0.5/14;
  fill(255);
  stroke(120);
  strokeWeight(1.5);
  rect(tituloX, tituloY, tituloW, tituloH, 28);
  fill(50);
  textSize(12);
  textAlign(CENTER, CENTER);
  text(texto, tituloX+tituloW/2, tituloY+tituloH/2);
}

void card(String conteudo, String formula, float x, float y, float w, float h){
  boolean over = estaSobre(x, y, w, h);
  fill(over ? color(255, 250, 210) : 255);
  stroke(80);
  strokeWeight(1.5);
  rect(x, y, w, h, 24);
  fill(0);
  textSize(20);
  textAlign(CENTER, CENTER);
  text(formula, x+w/2, y+h/2);
  
  if(mousePressed){
    if(over){
      tocarClick();
      deducao = conteudo;
    }
  }
}

// rotulo: botão com rótulo textual usado em 2D para escolher formas
void rotulo(String texto, float x, float y, float w, float h){
  boolean over = estaSobre(x, y, w, h);
  boolean active = texto.equals(rotulo);
  fill(active ? color(230, 255, 230) : over ? color(235,245,255) : 255);
  stroke(80);
  strokeWeight(1);
  rect(x, y, w, h, 14);
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(12);
  text(texto, x + w/2 , y + h/2);

  if(mousePressed){
    if(over){
      tocarClick();
      rotulo = texto;
      activeInput = ""; // limpa input quando muda rótulo
    }
  }
}

void popUp(){
  fill(0, 120);
  noStroke();
  rect(0, 0, width, height);

  float x = canvaX+canvaW*0.5/13;
  float y = canvaY + canvaH*0.5/14;
  float w = canvaW*12/13;
  float h = canvaH*13/14;
  fill(250);
  stroke(80);
  strokeWeight(2);
  rect(x, y, w, h, 30);

  float closeX = x + w - 50;
  float closeY = y + 20;
  float closeW = 30;
  float closeH = 30;
  boolean closeHover = estaSobre(closeX, closeY, closeW, closeH);
  fill(closeHover ? color(255, 120, 120) : color(255, 80, 80));
  noStroke();
  rect(closeX, closeY, closeW, closeH, 10);
  fill(255);
  textSize(20);
  textAlign(CENTER, CENTER);
  text("X", closeX + closeW/2, closeY + closeH/2);

  if(mousePressed && closeHover){
    tocarClick();
    deducao = "";
  }

  boolean deducaoEspecial = false;

  // ── DIAGONAL DO QUADRADO (existente) ──────────────────────────────
  if(rotulo == "Quadrado" && deducao == "diagonal"){
    deducaoEspecial = true;
    fill(255);
    rect(x+w/13, y+h/14, w*2/13, h*4/14);
    fill(0);
    line(x+w/13, y+h/14, x+w/13 + w*2/13, y+h/14 + h*4/14);
    text("A", x+w/13-10, y + h/14 + h*4/14/2);
    text("B", x+w/13 + w*2/13/2, y + h/14 + h*4/14 + 10);
    text("d", x+w/13 + w*2/13/2, y + h/14 + h*1.5/14);
    text("A = B ", x+w/13 + w*2/13/2, y + h/14 + h*6/14);
    text("d^2 = A^2 + A^2", x+w/13 + w*2/13/2, y + h/14 + h*7/14);
    text("d^2 = 2 x A^2", x+w/13 + w*2/13/2, y + h/14 + h*8/14);
    text("d = raiz(2 x A^2)", x+w/13 + w*2/13/2, y + h/14 + h*9/14);
    text("d = raiz2 x A", x+w/13 + w*2/13/2, y + h/14 + h*10/14);
    text("d = A x raiz2", x+w/13 + w*2/13/2, y + h/14 + h*11/14);
  }

  fill(240);

  rect(x, y, w, h);

  // ── ÁREA DO TRIÂNGULO ─────────────────────────────────────────────
  if(deducao.equals("ded_triangulo")){
    deducaoEspecial = true;

    float fX = x + w/13;
    float fY = y + h/14;
    float fW = w*2/13;
    float fH = h*4/14;

    // Retangulo de fundo (representa b x h completo)
    stroke(0); strokeWeight(1); fill(220);
    rect(fX, fY, fW, fH);

    // Triangulo colorido (metade do retangulo)
    fill(170, 210, 170); stroke(0); strokeWeight(2);
    triangle(fX,      fY + fH,
             fX + fW, fY + fH,
             fX,      fY);

    // Labels
    fill(0); noStroke(); textSize(18); textAlign(CENTER, CENTER);
    text("b", fX + fW/2, fY + fH + 20);
    text("h", fX - 20,   fY + fH/2);

    // Passos
    textAlign(LEFT, TOP); textSize(20);
    float sx = x + w*4/13;
    float sy = y + h*2/14;
    float lh = h/14;
    text("1. O triangulo cabe na metade de um", sx, sy);
    text("   retangulo de mesma base e altura.", sx, sy + lh*0.7);
    text("2. Area do retangulo = b x h", sx, sy + lh*1.8);
    text("3. O triangulo ocupa metade disso.", sx, sy + lh*3.0);
    text("4. Portanto:", sx, sy + lh*4.2);
    text("   A = b x h / 2", sx, sy + lh*5.2);
  }

  // ── ÁREA DO RETÂNGULO / QUADRADO ──────────────────────────────────
  if(deducao.equals("ded_retangulo")){
    deducaoEspecial = true;

    float fX = x + w/13;
    float fY = y + h/14;
    float fW = w*2/13;
    float fH = h*4/14;

    // Retangulo com grid interno
    fill(170, 210, 170); stroke(0); strokeWeight(2);
    rect(fX, fY, fW, fH);

    stroke(100); strokeWeight(1);
    for(int i = 1; i < 3; i++) line(fX + fW*i/3, fY, fX + fW*i/3, fY + fH);
    for(int i = 1; i < 4; i++) line(fX, fY + fH*i/4, fX + fW, fY + fH*i/4);

    // Labels
    fill(0); noStroke(); textSize(18); textAlign(CENTER, CENTER);
    text("b", fX + fW/2, fY + fH + 20);
    text("h", fX - 20,   fY + fH/2);

    // Passos
    textAlign(LEFT, TOP); textSize(20);
    float sx = x + w*4/13;
    float sy = y + h*2/14;
    float lh = h/14;
    text("1. O retangulo tem b unidades de base", sx, sy);
    text("   e h unidades de altura.", sx, sy + lh*0.7);
    text("2. Isso forma b x h quadradinhos de", sx, sy + lh*1.8);
    text("   area unitaria.", sx, sy + lh*2.5);
    text("3. Portanto:", sx, sy + lh*3.7);
    text("   A = b x h", sx, sy + lh*4.7);
  }

  // ── ÁREA DO HEXÁGONO ──────────────────────────────────────────────
  if(deducao.equals("ded_hexagono")){
    deducaoEspecial = true;

    float hcX = x + w*2/13;        // centro do hexagono (x)
    float hcY = y + h*3/14;        // centro do hexagono (y)
    float hr  = min(w*2/13, h*4/14) / 2 * 0.8;
    float ang = TWO_PI / 6;

    // 6 triangulos equilateros com cores alternadas
    stroke(0); strokeWeight(1);
    for(int i = 0; i < 6; i++){
      float x1 = hcX + cos(ang * i)       * hr;
      float y1 = hcY + sin(ang * i)       * hr;
      float x2 = hcX + cos(ang * (i + 1)) * hr;
      float y2 = hcY + sin(ang * (i + 1)) * hr;
      if(i % 2 == 0) fill(170, 210, 170);
      else            fill(210, 235, 210);
      triangle(hcX, hcY, x1, y1, x2, y2);
    }

    // Label 'a' sobre um dos lados
    fill(0); noStroke(); textSize(18); textAlign(CENTER, CENTER);
    text("a", hcX + cos(ang * 0.5) * hr * 1.3,
              hcY + sin(ang * 0.5) * hr * 1.3);

    // Passos
    textAlign(LEFT, TOP); textSize(20);
    float sx = x + w*4/13;
    float sy = y + h*2/14;
    float lh = h/14;
    text("1. O hexagono regular e composto por", sx, sy);
    text("   6 triangulos equilateros de lado a.", sx, sy + lh*0.7);
    text("2. Area de 1 triangulo = a^2 x raiz(3) / 4", sx, sy + lh*1.8);
    text("3. Area total = 6 x (a^2 x raiz(3) / 4)", sx, sy + lh*3.0);
    text("4. Simplificando:", sx, sy + lh*4.2);
    text("   A = 3 x a^2 x raiz(3) / 2", sx, sy + lh*5.2);
  }

  // ── ÁREA DO LOSANGO ───────────────────────────────────────────────
  if(deducao.equals("ded_losango")){
    deducaoEspecial = true;

    float fX = x + w/13;
    float fY = y + h/14;
    float fW = w*2/13;
    float fH = h*4/14;

    // Retangulo de fundo (area = D x d)
    stroke(0); strokeWeight(1); fill(220);
    rect(fX, fY, fW, fH);

    // Losango inscrito no retangulo
    fill(170, 210, 170); stroke(0); strokeWeight(2);
    quad(fX + fW/2, fY,
         fX + fW,   fY + fH/2,
         fX + fW/2, fY + fH,
         fX,        fY + fH/2);

    // Labels
    fill(0); noStroke(); textSize(18); textAlign(CENTER, CENTER);
    text("D", fX + fW/2, fY + fH + 20);  // diagonal horizontal
    text("d", fX - 20,   fY + fH/2);     // diagonal vertical

    // Passos
    textAlign(LEFT, TOP); textSize(20);
    float sx = x + w*4/13;
    float sy = y + h*2/14;
    float lh = h/14;
    text("1. O losango cabe na metade de um", sx, sy);
    text("   retangulo de lados D e d", sx, sy + lh*0.7);
    text("   (as diagonais do losango).", sx, sy + lh*1.4);
    text("2. Area do retangulo = D x d", sx, sy + lh*2.6);
    text("3. O losango ocupa metade disso.", sx, sy + lh*3.8);
    text("4. Portanto:", sx, sy + lh*5.0);
    text("   A = D x d / 2", sx, sy + lh*6.0);
  }

  // ── ÁREA DO TRAPÉZIO ──────────────────────────────────────────────
  if(deducao.equals("ded_trapezio")){
    deducaoEspecial = true;

    float fX  = x + w/13;
    float fY  = y + h/14;
    float fW  = w*2/13;
    float fH  = h*4/14;
    float off = fW * 0.2;  // recuo que cria a base menor

    // Trapezio
    fill(170, 210, 170); stroke(0); strokeWeight(2);
    quad(fX,        fY + fH,   // inferior esquerdo  (B)
         fX + fW,   fY + fH,   // inferior direito   (B)
         fX+fW-off, fY,        // superior direito   (b)
         fX + off,  fY);       // superior esquerdo  (b)

    // Linha de altura
    stroke(80); strokeWeight(1);
    line(fX + off, fY, fX + off, fY + fH);

    // Labels
    fill(0); noStroke(); textSize(18); textAlign(CENTER, CENTER);
    text("B", fX + fW/2,    fY + fH + 20);
    text("b", fX + fW/2,    fY - 15);
    text("h", fX + off - 40, fY + fH/2);

    // Passos
    textAlign(LEFT, TOP); textSize(20);
    float sx = x + w*4/13;
    float sy = y + h*2/14;
    float lh = h/14;
    text("1. Dois trapezios iguais unidos formam", sx, sy);
    text("   um paralelogramo.", sx, sy + lh*0.7);
    text("2. Esse paralelogramo tem:", sx, sy + lh*1.8);
    text("   base = B + b  e  altura = h", sx, sy + lh*2.5);
    text("3. Area paralelogramo = (B + b) x h", sx, sy + lh*3.7);
    text("4. Como usamos 2 trapezios:", sx, sy + lh*4.9);
    text("   A = (B + b) x h / 2", sx, sy + lh*5.9);
  }

  // ── TEXTO SIMPLES (circulo e circunferencia) ───────────────────────
  if(!deducaoEspecial){
    fill(0);
    textAlign(LEFT, TOP);
    textSize(20);
    text(deducao, x + 30, y + 30, w - 60, h - 100);
  }

  fill(120);
  textSize(14);
  textAlign(RIGHT, BOTTOM);
  text("Pressione ESPAÇO ou clique em X para fechar", x + w - 30, y + h - 20);

  if(keyPressed){
    if(key == ' '){
      deducao = "";
    }
  }
}
