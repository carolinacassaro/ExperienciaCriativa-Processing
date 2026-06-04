void viewInicial(){
  image(imgInicial, 0, 0, width, height);
  
  // -- botão Questionário (sobreposto à imagem) --
  float bQuizW = 280;
  float bQuizH = 65;
  float bQuizX = (width - bQuizW) / 2.0;
  float bQuizY = height * 0.68;
  boolean overQuiz = estaSobre(bQuizX, bQuizY, bQuizW, bQuizH);
  fill(overQuiz ? color(80, 180, 80) : backgroundButton);
  stroke(100);
  strokeWeight(1.5);
  rect(bQuizX, bQuizY, bQuizW, bQuizH, 20);
  fill(255);
  textSize(18);
  textAlign(CENTER, CENTER);
  text("Questionário", bQuizX + bQuizW/2, bQuizY + bQuizH/2);
  
  // -- detecção de cliques --
  if(mousePressed){
    if(mouseX >= b2dX && mouseX <= b2dX + imgBotao.width && mouseY >= b2dY && mouseY <= b2dY + imgBotao.height){
      svar = 2;
    }
    if(mouseX >= b3dX && mouseX <= b3dX + imgBotao.width && mouseY >= b3dY && mouseY <= b3dY + imgBotao.height){
      svar = 3;
    }
    if(overQuiz){
      svar = 4;
    }
  }
}
