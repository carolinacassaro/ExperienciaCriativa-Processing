void viewInicial(){
  image(imgInicial, 0, 0, width, height);
  
 if(mousePressed){
   if (mouseX >= b2dX && mouseX <= b2dX + imgBotao.width && mouseY >= b2dY && mouseY <= b2dY + imgBotao.height){
   svar = 2;}
   if (mouseX >= b3dX && mouseX <= b3dX + imgBotao.width && mouseY >= b3dY && mouseY <= b3dY + imgBotao.height){
   svar = 3;}
 }
}
