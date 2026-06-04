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
  soundSetAmp(osc, endAmp); // simplificado para evitar erro de concorrência da thread
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
      limparValores();
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
      limparValores();
    }
  }
}

void popUp(){
  // Menu lateral em branco (esconde os botões de forma)
  noStroke();
  fill(255);
  rect(0, 0, btnWidth, height);
  
  // Botão de voltar (aproveitando o padrão)
  buttonBack(0);

  // Fundo principal com as listras
  fundoCanvas();

  // Texto da dedução
  fill(0);
  textAlign(LEFT, TOP);
  textSize(22);
  text(deducao, canvaX + 60, canvaY + 60, canvaW - 120, canvaH - 120);

  if(keyPressed){
    if(key == ' '){
      deducao = "";
    }
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

void fundoCanvas(){
  fill(light_green);
  rect(canvaX, canvaY, canvaW, canvaH);
  noStroke();
  fill(255, 30);
  for(int i = 0; i < 8; i++){
    rect(canvaX + 10, canvaY + i * canvaH/8, canvaW - 20, canvaH/20, 18);
  }
}

String deducaoTriangulo() {
  return "Deducao da area do Triangulo:\n\n1. Imagine um retangulo de base (b) e altura (h).\n2. A area desse retangulo e (b x h).\n3. Ao cortar esse retangulo com uma diagonal, formam-se dois triangulos iguais.\n4. Portanto, a area de um unico triangulo e a metade do retangulo original:\n\nA = (b x h) / 2";
}

String deducaoRetangulo() {
  return "Deducao da area do Retangulo / Quadrado:\n\n1. O retangulo e uma figura de lados ortogonais.\n2. Imagine dividi-lo em pequenos quadrados de 1x1.\n3. O numero total de quadrados que cabem dentro dele e obtido multiplicando o tamanho da base (b) pelo tamanho da altura (h).\n\nA = b x h";
}

String deducaoHexagono() {
  return "Deducao da area do Hexagono Regular:\n\n1. Um hexagono regular pode ser dividido a partir do seu centro em exatos 6 triangulos equilateros idênticos.\n2. A area de cada triangulo e (a^2 x raiz(3)) / 4.\n3. Multiplicando essa area por 6, chegamos a formula geral do hexagono.\n\nA = 3 x a^2 x raiz(3) / 2";
}

String deducaoLosango() {
  return "Deducao da area do Losango:\n\n1. O losango e delimitado por uma diagonal maior (D) e uma menor (d).\n2. Imagine circunscrever um retangulo em volta do losango. As medidas do retangulo seriam D e d.\n3. A area desse retangulo seria D x d. O losango ocupa exatamente metade desse retangulo.\n\nA = (D x d) / 2";
}

String deducaoTrapezio() {
  return "Deducao da area do Trapezio:\n\n1. Pegue um trapezio de base maior (B), base menor (b) e altura (h).\n2. Se voce colar um segundo trapezio invertido e identico ao lado do primeiro, eles formarao um paralelogramo de base total (B+b) e altura h.\n3. A area desse paralelogramo e (B+b) x h. Como usamos dois trapezios, a area de um so e a metade disso.\n\nA = (B+b) x h / 2";
}
