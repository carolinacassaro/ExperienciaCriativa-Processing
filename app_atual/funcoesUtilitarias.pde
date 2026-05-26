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

void button(int order){
  fill(backgroundButton);
  stroke(0);
  strokeWeight(1);
  rect(0,0+order*btnHeight,btnWidth,btnHeight);
}

void buttonBack(int redirection){
  fill(backgroundButton);
  stroke(0);
  strokeWeight(1);
  rect(0,height-btnHeight,btnWidth,btnHeight);
  fill(0);
  textSize(64);
  textAlign(CENTER, CENTER);
  text("←",btnWidth/2,height-btnHeight/2);
  
  if(mousePressed && deducao.isEmpty()){
    if (mouseX >= 0 && mouseX <= btnWidth && mouseY  >= height-btnHeight && mouseY <= height) svar = redirection;
  }
}

void titulo(String texto, float x, float y){
  fill(200);
  float tituloX = x;
  float tituloY = y;
  float tituloW = canvaW*7/13;
  float tituloH = canvaH*0.5/14;
  rect(tituloX, tituloY, tituloW, tituloH, 30);
  
  fill(0);
  textSize(10);
  textAlign(CENTER, CENTER);
  text(texto, tituloX+tituloW/2, tituloY+tituloH/2);
}

void card(String conteudo, String formula, float x, float y, float w, float h){
  fill(240);
  rect(x,y,w,h,20);
  fill(0);
  textSize(20);
  textAlign(CENTER, CENTER);
  text(formula, x+w/2, y+h/2);
  
  if(mousePressed){
    if(mouseX >= x && mouseX <= x+w && mouseY>=y && mouseY<=y+h){
      deducao = conteudo;
    }
  }
}

void rotulo(String texto, float x, float y, float w, float h){
  fill(255);
  rect(x, y, w, h, 20);
  fill(0);
  text(texto, x+ w/2 , y + h/2);
  
  if(mousePressed){
     if(mouseX >= x && mouseX <= x+w && mouseY>=y && mouseY<=y+h){
       rotulo = texto;
     }
  }
}

void popUp(){
  fill(240);
  
  float x = canvaX+canvaW*0.5/13;
  float y =  canvaY + canvaH*0.5/14;
  float w =  canvaW*12/13;
  float h = canvaH*13/14;
  rect(x, y ,w, h);
  
  boolean deducaoEspecial = false;
  
  if(rotulo == "Quadrado" && deducao == "diagonal"){
    deducaoEspecial = true;
    fill(255);
    rect(x+w/13, y+h/14, w*2/13, h*4/14);
    fill(0);
    line(x+w/13, y+h/14,x+w/13 + w*2/13, y+h/14 + h*4/14);
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
  
  if(!deducaoEspecial){
    fill(0);
    textAlign(LEFT, TOP);
    textSize(20);
    text(deducao, x + 30, y + 30, w - 60, h - 60);
  }
  
  if(keyPressed){
    if(key == ' '){
       deducao = "";
    }
  }
}
