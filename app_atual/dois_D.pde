
void view2d(){
  background(0);
  // menu:
  
  menu2opcoes = 4;
  
  btnHeight = 100;
  btnWidth = 200;
  
  for(int i = 0; i<menu2opcoes; i++){
    button(i);
  }
  
  if(mousePressed){
    if (mouseX >= 0 && mouseX <= btnWidth && mouseY  >= 0 && mouseY <= btnHeight) svar = 21;
    if (mouseX >= 0 && mouseX <= btnWidth && mouseY  >= 0 && mouseY <= btnHeight*2) svar = 22; 
  
  }
  
}


void button(int order){
  fill(255);
  stroke(0);
  strokeWeight(1);
  rect(0,0+order*bHeight,btnWidth,bHeight);
}
