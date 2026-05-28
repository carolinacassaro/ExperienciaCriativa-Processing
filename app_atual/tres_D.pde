void view3d(){
  background(244, 246, 245);
  menu3d();
}

void view3d_1(){
  menu3d();
  fundoCanvas3d();
  titulo("AREA DA BASE", canvaX + canvaW*4.5/13, canvaH*1/14);
  card(deducaoAreaBase3d(), formulaAreaBase3d(), canvaX+canvaW*4.5/13, canvaH*2/14, 150, canvaH*2/14);
  titulo("VOLUME", canvaX + canvaW*4.5/13, canvaH*5/14);
  card(deducaoVolumePrisma(), formulaVolumePrisma(), canvaX+canvaW*4.5/13, canvaH*6/14, 150, canvaH*2/14);
  desenharFormaPrincipal3d(imagemPrismaSelecionada(), "Prisma " + rotulo3d);
  botoesVariacaoPrisma();
  tituloCurto("GLOSSARIO", canvaX + canvaW*0.5/13, canvaH*11.2/14, 360);
  glossario3d(glossarioPrismaPiramide(), canvaX+canvaW*0.5/13, canvaH*12.0/14, 360, alturaGlossarioPrismaPiramide());
}

void view3d_2(){
  menu3d();
  fundoCanvas3d();
  titulo("AREA DA BASE", canvaX + canvaW*4.5/13, canvaH*1/14);
  card(deducaoAreaBase3d(), formulaAreaBase3d(), canvaX+canvaW*4.5/13, canvaH*2/14, 150, canvaH*2/14);
  titulo("VOLUME", canvaX + canvaW*4.5/13, canvaH*5/14);
  card(deducaoVolumePiramide(), "Ab x h\n-------------\n      3      ", canvaX+canvaW*4.5/13, canvaH*6/14, 150, canvaH*2/14);
  desenharFormaPrincipal3d(imagemPiramideSelecionada(), "Piramide " + rotulo3d);
  botoesVariacaoPiramide();
  tituloCurto("GLOSSARIO", canvaX + canvaW*0.5/13, canvaH*11.2/14, 360);
  glossario3d(glossarioPrismaPiramide(), canvaX+canvaW*0.5/13, canvaH*12.0/14, 360, alturaGlossarioPrismaPiramide());
}

void view3d_3(){
  menu3d();
  fundoCanvas3d();
  titulo("VOLUME", canvaX + canvaW*4.5/13, canvaH*1/14);
  card(deducaoVolumeCone(), "pi x r^2 x h\n-------------\n      3      ", canvaX+canvaW*4.5/13, canvaH*2/14, 150, canvaH*2/14);
  desenharFormaPrincipal3d(imgCone3D, "Cone");
  tituloCurto("GLOSSARIO", canvaX + canvaW*0.5/13, canvaH*11.2/14, 360);
  glossario3d("r = raio | h = altura | pi = 3,14", canvaX+canvaW*0.5/13, canvaH*12.0/14, 360, 40);
}

void view3d_4(){
  menu3d();
  fundoCanvas3d();
  titulo("VOLUME", canvaX + canvaW*4.5/13, canvaH*1/14);
  card(deducaoVolumeEsfera(), "4 x pi x r^3\n-------------\n      3      ", canvaX+canvaW*4.5/13, canvaH*2/14, 150, canvaH*2/14);
  desenharFormaPrincipal3d(imgEsfera3D, "Esfera");
  tituloCurto("GLOSSARIO", canvaX + canvaW*0.5/13, canvaH*11.2/14, 360);
  glossario3d("r = raio | pi = 3,14", canvaX+canvaW*0.5/13, canvaH*12.0/14, 260, 40);
}

void menu3d(){
  menu3opcoes = 4;
  
  for(int i = 0; i < menu3opcoes; i++){
    button(i);
  }
  
  if(mousePressed && deducao.isEmpty()){
    for(int i = 0; i < menu3opcoes; i++){
      if(mouseX >= 0 && mouseX <= btnWidth && mouseY >= btnHeight*i && mouseY <= btnHeight*(i+1)){
        svar = 31 + i;
        
        if (svar == 31 || svar == 32){
          rotulo3d = "Base Quadrada";
        }
      }
    }
  }
  
  desenharIconeMenu3d(imgCubo3D, 40, 8, 120, 84, "Prisma");
  desenharIconeMenu3d(imgPiramide3D, 40, 108, 120, 84, "Piramide");
  desenharIconeMenu3d(imgCone3D, 40, 208, 120, 84, "Cone");
  desenharIconeMenu3d(imgEsfera3D, 40, 308, 120, 84, "Esfera");
  
  buttonBack(1);
}

void desenharIconeMenu3d(PImage imgForma, float x, float y, float w, float h, String legenda){
  if(imgForma != null){
    image(imgForma, x, y, w, h);
  } else {
    fill(255);
    rect(x, y, w, h, 12);
    fill(0);
    textSize(12);
    textAlign(CENTER, CENTER);
    text(legenda, x + w/2, y + h/2);
  }
}

void fundoCanvas3d(){
  fill(light_green);
  rect(canvaX, canvaY, canvaW, canvaH);
}

void desenharFormaPrincipal3d(PImage imgForma, String legenda){
  float imgX = canvaX + canvaW*0.8/13;
  float imgY = canvaY + canvaH*1.2/14;
  float imgW = canvaW*3.0/13;
  float imgH = canvaH*4.2/14;
  
  if(imgForma != null){
    image(imgForma, imgX, imgY, imgW, imgH);
  } else {
    fill(255);
    rect(imgX, imgY, imgW, imgH, 20);
    fill(0);
    textSize(24);
    textAlign(CENTER, CENTER);
    text(legenda, imgX + imgW/2, imgY + imgH/2);
  }
}

void botoesVariacaoPrisma(){
  float clX = canvaX + canvaW*0.5/13;
  float clY = canvaH*9.8/14;
  float clW = 120;
  float clH = 36;
  
  botaoVariacao3d("Base Quadrada", clX, clY, clW, clH);
  botaoVariacao3d("Base Triangular", clX + clW + 10, clY, clW + 15, clH);
  botaoVariacao3d("Base Hexagonal", clX + (clW + 10)*2 + 15, clY, clW + 10, clH);
}

void botoesVariacaoPiramide(){
  float clX = canvaX + canvaW*0.5/13;
  float clY = canvaH*9.8/14;
  float clW = 120;
  float clH = 36;
  
  botaoVariacao3d("Base Quadrada", clX, clY, clW, clH);
  botaoVariacao3d("Base Triangular", clX + clW + 10, clY, clW + 15, clH);
  botaoVariacao3d("Base Hexagonal", clX + (clW + 10)*2 + 15, clY, clW + 10, clH);
}

void botaoVariacao3d(String texto, float x, float y, float w, float h){
  if(rotulo3d.equals(texto)){
    fill(220);
  } else {
    fill(255);
  }
  
  rect(x, y, w, h, 20);
  fill(0);
  textSize(10);
  textAlign(CENTER, CENTER);
  text(texto, x + w/2, y + h/2);
  
  if(mousePressed && deducao.isEmpty()){
    if(mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h){
      rotulo3d = texto;
    }
  }
}

PImage imagemPrismaSelecionada(){
  if(rotulo3d.equals("Base Triangular")){
    return imagemOuFallback(imgPrismaTriangular, imgPrismaQuadrado);
  }
  
  if(rotulo3d.equals("Base Hexagonal")){
    return imagemOuFallback(imgPrismaHexagonal, imgPrismaQuadrado);
  }
  
  return imgPrismaQuadrado;
}

PImage imagemPiramideSelecionada(){
  if(rotulo3d.equals("Base Triangular")){
    return imagemOuFallback(imgPiramideTriangular, imgPiramideQuadrada);
  }
  
  if(rotulo3d.equals("Base Hexagonal")){
    return imagemOuFallback(imgPiramideHexagonal, imgPiramideQuadrada);
  }
  
  return imgPiramideQuadrada;
}

PImage imagemOuFallback(PImage imgPrincipal, PImage imgFallback){
  if(imgPrincipal != null){
    return imgPrincipal;
  }
  
  return imgFallback;
}

String formulaVolumePrisma(){
  return "Ab x h";
}

String formulaAreaBase3d(){
  if(rotulo3d.equals("Base Triangular")){
    return "b x h\n-------------\n      2      ";
  }
  
  if(rotulo3d.equals("Base Hexagonal")){
    return "P x a\n-------------\n      2      ";
  }
  
  return "l x l";
}

String deducaoVolumePrisma(){
  return "Deducao do volume do prisma:\n\n1. Todo prisma ocupa a area da base ao longo da altura.\n2. Primeiro calculamos a area da base: Ab.\n3. Depois multiplicamos pela altura do solido: h.\n4. Portanto:\nV = Ab x h";
}

String deducaoVolumePiramide(){
  return "Deducao do volume da piramide:\n\n1. A piramide com mesma base e mesma altura de um prisma ocupa um terco dele.\n2. O volume do prisma seria Ab x h.\n3. Entao dividimos por 3.\n4. Portanto:\nV = (Ab x h) / 3";
}

String deducaoVolumeCone(){
  return "Deducao do volume do cone:\n\n1. O cone ocupa um terco do volume de um cilindro com mesma base e mesma altura.\n2. A area da base circular e pi x r^2.\n3. O volume do cilindro seria pi x r^2 x h.\n4. Dividindo por 3:\nV = (pi x r^2 x h) / 3";
}

String deducaoVolumeEsfera(){
  return "Deducao do volume da esfera:\n\n1. A formula do volume da esfera depende do raio r.\n2. O resultado geometrico final e quatro tercos de pi vezes o raio ao cubo.\n3. Portanto:\nV = (4 x pi x r^3) / 3";
}

String deducaoAreaBase3d(){
  if(rotulo3d.equals("Base Triangular")){
    return "Deducao da area da base triangular:\n\n1. A area do triangulo e base vezes altura.\n2. Como um triangulo ocupa metade de um retangulo correspondente, dividimos por 2.\n3. Portanto:\nAb = (b x h) / 2";
  }
  
  if(rotulo3d.equals("Base Hexagonal")){
    return "Deducao da area da base hexagonal regular:\n\n1. O hexagono regular pode ser relacionado ao seu perimetro P e ao apotema a.\n2. Multiplicamos perimetro por apotema.\n3. Depois dividimos por 2.\n4. Portanto:\nAb = (P x a) / 2";
  }
  
  return "Deducao da area da base quadrada:\n\n1. O quadrado tem todos os lados iguais.\n2. Sua area e lado vezes lado.\n3. Portanto:\nAb = l x l";
}

void glossario3d(String texto, float x, float y, float w, float h){
  fill(240);
  rect(x, y, w, h, 20);
  fill(0);
  textSize(11);
  textAlign(LEFT, TOP);
  text(texto, x + 15, y + 15);
}

String glossarioPrismaPiramide(){
  if(rotulo3d.equals("Base Triangular")){
    return "Ab = area da base\nh = altura do solido\nb = base do triangulo\na = altura do triangulo";
  }
  
  if(rotulo3d.equals("Base Hexagonal")){
    return "Ab = area da base\nh = altura do solido\nP = perimetro\na = apotema";
  }
  
  return "Ab = area da base\nh = altura do solido\nl = lado da base";
}

float alturaGlossarioPrismaPiramide(){
  if(rotulo3d.equals("Base Triangular") || rotulo3d.equals("Base Hexagonal")){
    return 74;
  }
  
  return 58;
}

void tituloCurto(String texto, float x, float y, float w){
  fill(200);
  float tituloH = canvaH*0.5/14;
  rect(x, y, w, tituloH, 30);
  
  fill(0);
  textSize(10);
  textAlign(CENTER, CENTER);
  text(texto, x + w/2, y + tituloH/2);
}
