void view3d(){
  background(244, 246, 245);
  menu3d();
}

void view3d_1(){
  background(244, 246, 245);
  menu3d();
  fundoCanvas();
  titulo("AREA DA BASE", canvaX + canvaW*4.5/13, canvaH*1/14);
  card(deducaoAreaBase3d(), formulaAreaBase3d(), canvaX+canvaW*4.5/13, canvaH*2/14, 150, canvaH*2/14);
  titulo("VOLUME", canvaX + canvaW*4.5/13, canvaH*5/14);
  card(deducaoVolumePrisma(), formulaVolumePrisma(), canvaX+canvaW*4.5/13, canvaH*6/14, 150, canvaH*2/14);
  desenharFormaPrincipal3d(imagemPrismaSelecionada(), "Prisma " + rotulo3d);
  painelValores3d();
  botoesVariacaoPrisma();
  float glossTitleY = canvaH*11.0/14;
  float glossBoxY = glossTitleY + (canvaH*0.5/14) + 8; // title height + gap
  tituloCurto("GLOSSARIO", canvaX + canvaW*0.5/13, glossTitleY, 360);
  glossario3d(glossarioPrismaPiramide(), canvaX+canvaW*0.5/13, glossBoxY, 360, alturaGlossarioPrismaPiramide());
}

void view3d_2(){
  background(244, 246, 245);
  menu3d();
  fundoCanvas();
  titulo("AREA DA BASE", canvaX + canvaW*4.5/13, canvaH*1/14);
  card(deducaoAreaBase3d(), formulaAreaBase3d(), canvaX+canvaW*4.5/13, canvaH*2/14, 150, canvaH*2/14);
  titulo("VOLUME", canvaX + canvaW*4.5/13, canvaH*5/14);
  card(deducaoVolumePiramide(), "Ab x h\n-------------\n      3      ", canvaX+canvaW*4.5/13, canvaH*6/14, 150, canvaH*2/14);
  desenharFormaPrincipal3d(imagemPiramideSelecionada(), "Piramide " + rotulo3d);
  painelValores3d();
  botoesVariacaoPiramide();
  float glossTitleY = canvaH*11.0/14;
  float glossBoxY = glossTitleY + (canvaH*0.5/14) + 8;
  tituloCurto("GLOSSARIO", canvaX + canvaW*0.5/13, glossTitleY, 360);
  glossario3d(glossarioPrismaPiramide(), canvaX+canvaW*0.5/13, glossBoxY, 360, alturaGlossarioPrismaPiramide());
}

void view3d_3(){
  background(244, 246, 245);
  menu3d();
  fundoCanvas();
  titulo("VOLUME", canvaX + canvaW*4.5/13, canvaH*1/14);
  card(deducaoVolumeCone(), "pi x r^2 x h\n-------------\n      3      ", canvaX+canvaW*4.5/13, canvaH*2/14, 150, canvaH*2/14);
  desenharFormaPrincipal3d(imgCone3D, "Cone");
  painelValores3d();
  float glossTitleY = canvaH*11.0/14;
  float glossBoxY = glossTitleY + (canvaH*0.5/14) + 8;
  tituloCurto("GLOSSARIO", canvaX + canvaW*0.5/13, glossTitleY, 360);
  glossario3d("r = raio | h = altura | pi = 3,14", canvaX+canvaW*0.5/13, glossBoxY, 360, 40);
}

void view3d_4(){
  background(244, 246, 245);
  menu3d();
  fundoCanvas();
  titulo("VOLUME", canvaX + canvaW*4.5/13, canvaH*1/14);
  card(deducaoVolumeEsfera(), "4 x pi x r^3\n-------------\n      3      ", canvaX+canvaW*4.5/13, canvaH*2/14, 150, canvaH*2/14);
  desenharFormaPrincipal3d(imgEsfera3D, "Esfera");
  painelValores3d();
  float glossTitleY = canvaH*11.0/14;
  float glossBoxY = glossTitleY + (canvaH*0.5/14) + 8;
  tituloCurto("GLOSSARIO", canvaX + canvaW*0.5/13, glossTitleY, 360);
  glossario3d("r = raio | pi = 3,14", canvaX+canvaW*0.5/13, glossBoxY, 260, 40);
}

void menu3d(){
  noStroke();
  fill(244, 246, 245);
  rect(0, 0, btnWidth, height);

  menu3opcoes = 4;
  
  for(int i = 0; i < menu3opcoes; i++){
    button(i);
  }
  
  if(mousePressed && deducao.isEmpty()){
    for(int i = 0; i < menu3opcoes; i++){
      if(mouseX >= 0 && mouseX <= btnWidth && mouseY >= btnHeight*i && mouseY <= btnHeight*(i+1)){
        tocarClick();
        svar = 31 + i;
        limparValores();
        
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
  boolean over = estaSobre(x, y, w, h);
  fill(255);
  if(deducao.isEmpty()){
    stroke(over ? color(90, 140, 255) : color(120));
    strokeWeight(over ? 3 : 1.5);
  } else {
    noStroke();
  }
  rect(x - 6, y - 6, w + 12, h + 12, 20);
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


void desenharFormaPrincipal3d(PImage imgForma, String legenda){
  float imgX = canvaX + canvaW*0.5/13;
  float imgY = canvaY + canvaH*2.2/14;
  float imgW = canvaW*3.5/13;
  float imgH = canvaH*5.0/14;
  
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
  // TODO: Espaço para implementação do motor e modelos P3D
}

void botoesVariacaoPrisma(){
  float clX = canvaX + 30;
  float clY = canvaH*10.2/14;
  int n = 3;
  float gap = 12;
  float relX = clX - canvaX;
  float available = canvaW - relX - 40;
  float clW = min(120, (available - (n-1)*gap) / n);
  float clH = 34;
  
  botaoVariacao3d("Base Quadrada", clX, clY, clW, clH);
  botaoVariacao3d("Base Triangular", clX + clW + gap, clY, clW, clH);
  botaoVariacao3d("Base Hexagonal", clX + (clW + gap)*2, clY, clW, clH);
}

void botoesVariacaoPiramide(){
  float clX = canvaX + 30;
  float clY = canvaH*10.2/14;
  int n = 3;
  float gap = 12;
  float relX = clX - canvaX;
  float available = canvaW - relX - 40;
  float clW = min(120, (available - (n-1)*gap) / n);
  float clH = 34;
  
  botaoVariacao3d("Base Quadrada", clX, clY, clW, clH);
  botaoVariacao3d("Base Triangular", clX + clW + gap, clY, clW, clH);
  botaoVariacao3d("Base Hexagonal", clX + (clW + gap)*2, clY, clW, clH);
}

void botaoVariacao3d(String texto, float x, float y, float w, float h){
  boolean over = estaSobre(x, y, w, h);
  if(rotulo3d.equals(texto)){
    fill(color(200, 240, 210));
  } else {
    fill(over ? color(235, 245, 255) : 255);
  }
  stroke(80);
  strokeWeight(1);
  rect(x, y, w, h, 20);
  fill(0);
  textSize(10);
  textAlign(CENTER, CENTER);
  text(texto, x + w/2, y + h/2);
  
  if(mousePressed && deducao.isEmpty()){
    if(over){
      tocarClick();
      rotulo3d = texto;
      limparValores();
    }
  }
}

void painelValores3d(){
  int fieldCount = 0;
  if(svar == 31 || svar == 32){
    if("Base Quadrada".equals(rotulo3d)) fieldCount = 2;
    else fieldCount = 3;
  } else if(svar == 33){
    fieldCount = 2;
  } else if(svar == 34){
    fieldCount = 1;
  }

  if(fieldCount == 0) return;

  float x = canvaX + canvaW*4.5/13;
  float y = canvaH*8.5/14;
  float w = 180;
  float h = max(canvaH*3/14, 70 + fieldCount * 42);
  fill(255);
  stroke(80);
  strokeWeight(1.5);
  rect(x, y, w, h, 24);
  fill(0);
  textSize(12);
  textAlign(LEFT, TOP);
  text("Inserir valores para calcular:", x + 14, y + 14, w - 28, 24);

  float fieldX = x + 14;
  float fieldY = y + 40;
  float fieldW = w - 28;
  float fieldH = 28;
  float rowSpacing = 38;

  if(svar == 31 || svar == 32){
    if("Base Quadrada".equals(rotulo3d)){
      campoEntrada3d("l", fieldX, fieldY, fieldW, fieldH, valorL);
      campoEntrada3d("h", fieldX, fieldY + rowSpacing, fieldW, fieldH, valorH);
    } else if("Base Triangular".equals(rotulo3d)){
      campoEntrada3d("b", fieldX, fieldY, fieldW, fieldH, valorB);
      campoEntrada3d("a", fieldX, fieldY + rowSpacing, fieldW, fieldH, valorA);
      campoEntrada3d("h", fieldX, fieldY + rowSpacing*2, fieldW, fieldH, valorH);
    } else if("Base Hexagonal".equals(rotulo3d)){
      campoEntrada3d("P", fieldX, fieldY, fieldW, fieldH, valorP);
      campoEntrada3d("a", fieldX, fieldY + rowSpacing, fieldW, fieldH, valorA);
      campoEntrada3d("h", fieldX, fieldY + rowSpacing*2, fieldW, fieldH, valorH);
    }
    exibirResultados3d(x + w + 20, y, 240, h);
  }

  if(svar == 33){
    campoEntrada3d("r", fieldX, fieldY, fieldW, fieldH, valorR);
    campoEntrada3d("h", fieldX, fieldY + rowSpacing, fieldW, fieldH, valorH);
    exibirResultados3d(x + w + 20, y, 240, h);
  }

  if(svar == 34){
    campoEntrada3d("r", fieldX, fieldY, fieldW, fieldH, valorR);
    exibirResultados3d(x + w + 20, y, 140, h);
  }
}

void campoEntrada3d(String label, float x, float y, float w, float h, String valor){
  boolean over = estaSobre(x, y, w, h);
  boolean active = activeInput.equals(label);
  fill(active ? color(230, 240, 255) : over ? color(235, 245, 255) : color(250));
  if(deducao.isEmpty()){
    stroke(active ? color(90, 140, 255) : 160);
    strokeWeight(active ? 2 : 1);
  } else {
    noStroke();
  }
  rect(x, y, w, h, 12);
  fill(0);
  textSize(14);
  textAlign(LEFT, CENTER);
  text(label + ": " + (valor.equals("") ? "..." : valor), x + 12, y + h/2);

  if(mousePressed){
    if(over){
      tocarClick();
      activeInput = label;
    }
  }
}

void exibirResultados3d(float x, float y, float w, float h){
  fill(245);
  if(deducao.isEmpty()){
    stroke(80);
    strokeWeight(1.2);
  } else {
    noStroke();
  }
  rect(x, y, w, h, 20);
  fill(0);
  textSize(14);
  textAlign(LEFT, TOP);

  float espacamento = 22;
  float posY = y + 16;
  text("Resultados:", x + 14, posY);
  posY += espacamento;

  float baseArea = calcularAreaBase();
  if(baseArea > 0){
    text("Area da base = " + nf(baseArea, 0, 2), x + 14, posY);
    posY += espacamento;
  }

  float volume = calcularVolume();
  if(volume > 0){
    text("Volume = " + nf(volume, 0, 2), x + 14, posY);
  }
}

float parseFloatSeguro(String valor){
  if(valor == null || valor.equals("") || valor.equals(".")) return 0;
  try {
    return float(valor);
  } catch(Exception e){
    return 0;
  }
}

float calcularAreaBase(){
  if(svar == 31 || svar == 32){
    if(rotulo3d.equals("Base Quadrada")){
      return pow(parseFloatSeguro(valorL), 2);
    }
    if(rotulo3d.equals("Base Triangular")){
      return parseFloatSeguro(valorB) * parseFloatSeguro(valorA) / 2;
    }
    if(rotulo3d.equals("Base Hexagonal")){
      return parseFloatSeguro(valorP) * parseFloatSeguro(valorA) / 2;
    }
  }
  if(svar == 33){
    return PI * pow(parseFloatSeguro(valorR), 2);
  }
  if(svar == 34){
    return 0;
  }
  return 0;
}

float calcularVolume(){
  if(svar == 31){
    return calcularAreaBase() * parseFloatSeguro(valorH);
  }
  if(svar == 32){
    return calcularAreaBase() * parseFloatSeguro(valorH) / 3;
  }
  if(svar == 33){
    return PI * pow(parseFloatSeguro(valorR), 2) * parseFloatSeguro(valorH) / 3;
  }
  if(svar == 34){
    return 4 * PI * pow(parseFloatSeguro(valorR), 3) / 3;
  }
  return 0;
}

void keyPressed(){
  if(!activeInput.equals("")){
    if(key == BACKSPACE || key == DELETE){
      if(activeInput.equals("l")) valorL = valorL.length() > 0 ? valorL.substring(0, valorL.length()-1) : "";
      if(activeInput.equals("b")) valorB = valorB.length() > 0 ? valorB.substring(0, valorB.length()-1) : "";
      if(activeInput.equals("h")) valorH = valorH.length() > 0 ? valorH.substring(0, valorH.length()-1) : "";
      if(activeInput.equals("P")) valorP = valorP.length() > 0 ? valorP.substring(0, valorP.length()-1) : "";
      if(activeInput.equals("a")) valorA = valorA.length() > 0 ? valorA.substring(0, valorA.length()-1) : "";
      if(activeInput.equals("r")) valorR = valorR.length() > 0 ? valorR.substring(0, valorR.length()-1) : "";
      // aliases: labels visuais diferentes que mapeiam para as mesmas variaveis
      if(activeInput.equals("D")) valorP = valorP.length() > 0 ? valorP.substring(0, valorP.length()-1) : "";
      if(activeInput.equals("d")) valorA = valorA.length() > 0 ? valorA.substring(0, valorA.length()-1) : "";
      if(activeInput.equals("B")) valorP = valorP.length() > 0 ? valorP.substring(0, valorP.length()-1) : "";
    } else if(key == ENTER || key == RETURN){
      activeInput = "";
    } else if((key >= '0' && key <= '9') || key == '.'){
      String atual = "";
      if(activeInput.equals("l")) atual = valorL;
      if(activeInput.equals("b")) atual = valorB;
      if(activeInput.equals("h")) atual = valorH;
      if(activeInput.equals("P")) atual = valorP;
      if(activeInput.equals("a")) atual = valorA;
      if(activeInput.equals("r")) atual = valorR;
      // aliases: leitura
      if(activeInput.equals("D")) atual = valorP;
      if(activeInput.equals("d")) atual = valorA;
      if(activeInput.equals("B")) atual = valorP;
      
      if(key == '.' && atual.contains(".")) return;
      
      atual += key;
      if(activeInput.equals("l")) valorL = atual;
      if(activeInput.equals("b")) valorB = atual;
      if(activeInput.equals("h")) valorH = atual;
      if(activeInput.equals("P")) valorP = atual;
      if(activeInput.equals("a")) valorA = atual;
      if(activeInput.equals("r")) valorR = atual;
      // aliases: escrita
      if(activeInput.equals("D")) valorP = atual;
      if(activeInput.equals("d")) valorA = atual;
      if(activeInput.equals("B")) valorP = atual;
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
  // Reutiliza a dedução da área da base (2D) como fundamento
  String baseDed = deducaoAreaBase3d();
  return "Deducao do volume do prisma:\n\n" + baseDed + "\n\n1. Considere a area da base Ab (veja acima).\n2. O prisma e o produto dessa area estendida ao longo da altura h.\n3. Assim, para cada unidade de altura adicionamos mais uma camada com area Ab.\n4. Portanto, o volume e a area da base multiplicada pela altura:\nV = Ab x h";
}

String deducaoVolumePiramide(){
  // Explica relacionando com a dedução da area da base (2D)
  String baseDed = deducaoAreaBase3d();
  return "Deducao do volume da piramide:\n\n" + baseDed + "\n\n1. Tome um prisma que tenha a mesma base Ab e a mesma altura h da piramide.\n2. Observa-se geometricamente que e possivel decompor esse prisma em tres piramides congruentes com a mesma base e altura.\n3. Logo, cada piramide corresponde a um terco do volume do prisma.\n4. Como o volume do prisma e V_prisma = Ab x h, segue:\nV_piramide = (Ab x h) / 3";
}

String deducaoVolumeCone(){
  // Usa a dedução da area do circulo como base
  return "Deducao do volume do cone:\n\n1. A area da base circular e Ab = pi x r^2 (ver deducao do circulo).\n2. Considere um cilindro com a mesma base Ab e altura h; seu volume e V_cil = Ab x h = pi x r^2 x h.\n3. Geometricamente (por esgotamento ou comparacoes de seccoes) o cone ocupa exatamente um terco do volume desse cilindro.\n4. Portanto, dividindo por tres obtemos:\nV = (pi x r^2 x h) / 3";
}

String deducaoVolumeEsfera(){
  // Apresenta dedução conceitual e referencia a area circular
  return "Deducao do volume da esfera:\n\n1. A esfera e o conjunto de pontos a distancia r de um centro; sua area maxima de secao e um circulo de raio r.\n2. A area do circulo e Ab = pi x r^2 (veja deducao do circulo).\n3. A derivacao rigorosa do volume exige Calculo Integral (fatia por fatia), mas o resultado, demonstrado por Arquimedes e pelo metodo das seccoes, e:\nV = (4 x pi x r^3) / 3\n4. Intuitivamente: o volume cresce com o cubo do raio e o fator 4/3 ajusta a acumulacao das areas de secao ao longo do diametro.";
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
  float tituloH = canvaH*0.5/14;
  fill(255);
  stroke(130);
  strokeWeight(1.2);
  rect(x, y, w, tituloH, 30);
  fill(50);
  textSize(10);
  textAlign(CENTER, CENTER);
  text(texto, x + w/2, y + tituloH/2);
}
