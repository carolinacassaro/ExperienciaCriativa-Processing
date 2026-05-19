void viewInicial(){
  image(imgInicial, 0, 0, width, height);
  image(imgB2d,imgB2dX,imgB2dY);
  
 if(mousePressed){
   if (mouseX >= impalX && mouseX <= impalX + impalW && mouseY >= impalY && mouseY <= impalY + impalH){
   svar = 2;}
 }
}
