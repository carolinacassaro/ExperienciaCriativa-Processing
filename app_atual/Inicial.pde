void viewInicial(){
  tint(12,242); // tem que corrigir o loop pra n redesenhar
  image(img, 0, 0, width, height);
  tint(255,255);
  image(imgt,imgtW,imgtH);
  image(imge, 150, 300, 400, 250);
  image(impal, impalX, impalY,impalW, impalH);
  
 if(mousePressed){
   if (mouseX >= impalX && mouseX <= impalX + impalW && mouseY >= impalY && mouseY <= impalY + impalH){
   svar = 2;}
 }
}
