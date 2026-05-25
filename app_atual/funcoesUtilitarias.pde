void desenharHexagono(float x, float y, float raio) {
  float angulo = TWO_PI / 6;
  
  beginShape();
  for (int i = 0; i < 6; i++) {
    // Calcula as coordenadas X e Y de cada vértice
    float sx = x + cos(angulo * i) * raio;
    float sy = y + sin(angulo * i) * raio;
    vertex(sx, sy);
  }
  endShape(CLOSE); // Fecha a forma ligando o último vértice ao primeiro
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
  
  if(mousePressed){
    if (mouseX >= 0 && mouseX <= btnWidth && mouseY  >= height-btnHeight && mouseY <= height) svar = redirection;
  }
}

void titulo(String texto, float x, float y){
  fill(200);
  float tituloX = x;
  float tituloY = y;
  float tituloW = canvaW*7/13;
  float tituloH = canvaH*0.5/14;
  rect(tituloX, tituloY, // posicao
  tituloW, tituloH, // tamanho
  30 // raio
  );
  
  fill(0);
  textSize(10);
  textAlign(CENTER, CENTER);
  text(texto, tituloX+tituloW/2, tituloY+tituloH/2);
}

void card(String deducao, String formula, float x, float y, float w, float h){
  fill(240);
  rect(x,y,w,h,20);
  fill(0);
  textSize(20);
  
  text(formula, x+w/2, y+h/2);
  
  if(mousePressed){
   if(mouseX >= x && mouseX <= x+w && mouseY>=y && mouseY<=y+h){
       popUp(deducao);
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
       triangulo = texto;
     }
  }
}

void popUp(String deducao){
  fill(240);
  
  float x = canvaX+canvaW*0.5/13;
  float y =  canvaY/14;
  float w =  canvaW*12/13;
  float h = canvaH*13/14;
  rect(x, y ,w, h);
  
  text(deducao, x+w/2, y+h/2);
  
}
