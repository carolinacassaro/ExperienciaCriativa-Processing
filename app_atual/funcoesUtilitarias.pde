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
  if(deducao.isEmpty()){
    stroke(80);
    strokeWeight(1);
  } else {
    noStroke();
  }
  rect(x, y, btnWidth, btnHeight, 20);
}

void buttonBack(int redirection){
  float x = 0;
  float y = height - btnHeight;
  boolean over = estaSobre(x, y, btnWidth, btnHeight);
  fill(over ? color(220, 235, 255) : backgroundButton);
  if(deducao.isEmpty()){
    stroke(80);
    strokeWeight(1);
  } else {
    noStroke();
  }
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
  if(deducao.isEmpty()){
    stroke(120);
    strokeWeight(1.5);
  } else {
    noStroke();
  }
  rect(tituloX, tituloY, tituloW, tituloH, 28);
  fill(50);
  textSize(12);
  textAlign(CENTER, CENTER);
  text(texto, tituloX+tituloW/2, tituloY+tituloH/2);
}

void card(String conteudo, String formula, float x, float y, float w, float h){
  boolean over = estaSobre(x, y, w, h);
  fill(over ? color(255, 250, 210) : 255);
  if(deducao.isEmpty()){
    stroke(80);
    strokeWeight(1.5);
  } else {
    noStroke();
  }
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
  if(deducao.isEmpty()){
    stroke(80);
    strokeWeight(1);
  } else {
    noStroke();
  }
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
  noStroke();
  fill(255);
  rect(0, 0, width, height);

  float x = width * 0.1;
  float y = height * 0.1;
  float w = width * 0.8;
  float h = height * 0.8;

  float closeX = x + w - 50;
  float closeY = y + 20;
  float closeW = 30;
  float closeH = 30;
  boolean closeHover = estaSobre(closeX, closeY, closeW, closeH);
  fill(closeHover ? color(255, 120, 120) : color(255, 80, 80));
  noStroke();
  rect(closeX, closeY, closeW, closeH);
  fill(255);
  textSize(20);
  textAlign(CENTER, CENTER);
  text("X", closeX + closeW/2, closeY + closeH/2);

  if(mousePressed && closeHover){
    tocarClick();
    deducao = "";
  }

  fill(0);
  textAlign(LEFT, TOP);
  textSize(22);
  text(deducao, x + 30, y + 30, w - 60, h - 100);

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
