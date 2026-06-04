void viewInicial(){
  background(20, 75, 40);
  image(imgInicial, 0, 0, width, height);
  
  if(mousePressed){
    if (mouseX >= b2dX && mouseX <= b2dX + 440 && mouseY >= b2dY && mouseY <= b2dY + 210){
      svar = 2;
    }
    if (mouseX >= b3dX && mouseX <= b3dX + 440 && mouseY >= b3dY && mouseY <= b3dY + 210){
      svar = 3;
    }
  }
}
