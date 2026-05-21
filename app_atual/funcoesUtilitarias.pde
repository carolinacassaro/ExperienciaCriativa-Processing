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
