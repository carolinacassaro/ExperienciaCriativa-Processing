void view3d(){
  background(255);
  menu3d();
}

void view3d_1(){
  background(255);
  menu3d();
  fundoCanvas();
  cabecalhoCanvas("Prisma  —  " + rotulo3d, "SÓLIDO 3D");
  painelFigura(canvaX+canvaW*0.5/13 - 20, 46, canvaW*3.5/13 + 40, canvaH*2.2/14 + canvaH*5.0/14 - 46 + 20);
  titulo("AREA DA BASE", canvaX+canvaW*4.5/13, canvaH*1/14);
  card(deducaoAreaBase3d(), formulaAreaBase3d(), canvaX+canvaW*4.5/13, canvaH*2/14, 150, canvaH*2/14);
  titulo("VOLUME", canvaX+canvaW*4.5/13, canvaH*5/14);
  card(deducaoVolumePrisma(), formulaVolumePrisma(), canvaX+canvaW*4.5/13, canvaH*6/14, 150, canvaH*2/14);
  desenharFormaPrincipal3d(imagemPrismaSelecionada(), "Prisma " + rotulo3d);
  painelValores3d();
  botoesVariacaoPrisma();
  float glossTitleY = canvaH*11.0/14;
  float glossBoxY = glossTitleY + (canvaH*0.5/14) + 8;
  tituloCurto("GLOSSARIO", canvaX+canvaW*0.5/13, glossTitleY, 360);
  glossario3d(glossarioPrismaPiramide(), canvaX+canvaW*0.5/13, glossBoxY, 360, alturaGlossarioPrismaPiramide());
}

void view3d_2(){
  background(255);
  menu3d();
  fundoCanvas();
  cabecalhoCanvas("Pirâmide  —  " + rotulo3d, "SÓLIDO 3D");
  painelFigura(canvaX+canvaW*0.5/13 - 20, 46, canvaW*3.5/13 + 40, canvaH*2.2/14 + canvaH*5.0/14 - 46 + 20);
  titulo("AREA DA BASE", canvaX+canvaW*4.5/13, canvaH*1/14);
  card(deducaoAreaBase3d(), formulaAreaBase3d(), canvaX+canvaW*4.5/13, canvaH*2/14, 150, canvaH*2/14);
  titulo("VOLUME", canvaX+canvaW*4.5/13, canvaH*5/14);
  card(deducaoVolumePiramide(), "Ab x h\n-------------\n      3      ", canvaX+canvaW*4.5/13, canvaH*6/14, 150, canvaH*2/14);
  desenharFormaPrincipal3d(imagemPiramideSelecionada(), "Piramide " + rotulo3d);
  painelValores3d();
  botoesVariacaoPiramide();
  float glossTitleY = canvaH*11.0/14;
  float glossBoxY = glossTitleY + (canvaH*0.5/14) + 8;
  tituloCurto("GLOSSARIO", canvaX+canvaW*0.5/13, glossTitleY, 360);
  glossario3d(glossarioPrismaPiramide(), canvaX+canvaW*0.5/13, glossBoxY, 360, alturaGlossarioPrismaPiramide());
}

void view3d_3(){
  background(255);
  menu3d();
  fundoCanvas();
  cabecalhoCanvas("Cone", "SÓLIDO 3D");
  painelFigura(canvaX+canvaW*0.5/13 - 20, 46, canvaW*3.5/13 + 40, canvaH*2.2/14 + canvaH*5.0/14 - 46 + 20);
  titulo("VOLUME", canvaX+canvaW*4.5/13, canvaH*1/14);
  card(deducaoVolumeCone(), "pi x r^2 x h\n-------------\n      3      ", canvaX+canvaW*4.5/13, canvaH*2/14, 150, canvaH*2/14);
  desenharFormaPrincipal3d(imgCone3D, "Cone");
  painelValores3d();
  float glossTitleY = canvaH*11.0/14;
  float glossBoxY = glossTitleY + (canvaH*0.5/14) + 8;
  tituloCurto("GLOSSARIO", canvaX+canvaW*0.5/13, glossTitleY, 360);
  glossario3d("r = raio | h = altura | pi = 3,14", canvaX+canvaW*0.5/13, glossBoxY, 360, 40);
}

void view3d_4(){
  background(255);
  menu3d();
  fundoCanvas();
  cabecalhoCanvas("Esfera", "SÓLIDO 3D");
  painelFigura(canvaX+canvaW*0.5/13 - 20, 46, canvaW*3.5/13 + 40, canvaH*2.2/14 + canvaH*5.0/14 - 46 + 20);
  titulo("VOLUME", canvaX+canvaW*4.5/13, canvaH*1/14);
  card(deducaoVolumeEsfera(), "4 x pi x r^3\n-------------\n      3      ", canvaX+canvaW*4.5/13, canvaH*2/14, 150, canvaH*2/14);
  desenharFormaPrincipal3d(imgEsfera3D, "Esfera");
  painelValores3d();
  float glossTitleY = canvaH*11.0/14;
  float glossBoxY = glossTitleY + (canvaH*0.5/14) + 8;
  tituloCurto("GLOSSARIO", canvaX+canvaW*0.5/13, glossTitleY, 360);
  glossario3d("r = raio | pi = 3,14", canvaX+canvaW*0.5/13, glossBoxY, 260, 40);
}

// ── Menu lateral 3D ──────────────────────────────
void menu3d(){
  noStroke(); fill(sidebar_bg);
  rect(0, 0, btnWidth, height);

  menu3opcoes = 4;
  for(int i = 0; i < menu3opcoes; i++) button(i);

  if(mousePressed && deducao.isEmpty()){
    for(int i = 0; i < menu3opcoes; i++){
      if(mouseX >= 0 && mouseX <= btnWidth && mouseY >= btnHeight*i && mouseY <= btnHeight*(i+1)){
        tocarClick();
        svar = 31 + i;
        limparValores();
        if(svar == 31 || svar == 32) rotulo3d = "Base Quadrada";
      }
    }
  }

  desenharIconeMenu3d(imgCubo3D,    40, 8,   120, 80, "Prisma");
  desenharIconeMenu3d(imgPiramide3D,40, 108, 120, 80, "Pirâmide");
  desenharIconeMenu3d(imgCone3D,    40, 208, 120, 80, "Cone");
  desenharIconeMenu3d(imgEsfera3D,  40, 308, 120, 80, "Esfera");

  String[] nomes3d = {"Prisma","Pirâmide","Cone","Esfera"};
  fill(badge_text); textSize(9); textAlign(CENTER, CENTER);
  for(int i = 0; i < 4; i++){
    text(nomes3d[i], btnWidth/2, btnHeight*(i+1) - 14);
  }

  buttonBack(1);
}

void desenharIconeMenu3d(PImage imgForma, float x, float y, float w, float h, String legenda){
  boolean over = estaSobre(x, y, w, h);
  if(over && deducao.isEmpty()){
    noStroke(); fill(255, 255, 255, 30);
    rect(x - 4, y - 4, w + 8, h + 8, 14);
  }
  if(imgForma != null){
    tint(255, over ? 255 : 200);
    image(imgForma, x, y, w, h);
    noTint();
  } else {
    fill(255, 60); noStroke();
    rect(x, y, w, h, 12);
    fill(255); textSize(11);
    textAlign(CENTER, CENTER);
    text(legenda, x + w/2, y + h/2);
  }
}

void desenharFormaPrincipal3d(PImage imgForma, String legenda){
  float imgX = canvaX + canvaW*0.5/13;
  float imgY = canvaY + canvaH*2.2/14;
  float imgW = canvaW*3.5/13;
  float imgH = canvaH*5.0/14;

  // -- atualiza angulo de rotacao --
  anguloRotacao3d += 0.008;

  // -- renderiza forma 3D no canvas auxiliar (P3D isolado) --
  canvas3d.beginDraw();
  canvas3d.background(238, 248, 238);
  canvas3d.noStroke();
  canvas3d.ambientLight(120, 120, 120);
  canvas3d.directionalLight(255, 255, 255, -1, -0.8, -0.5);
  canvas3d.pushMatrix();
  canvas3d.translate(canvas3d.width/2.0, canvas3d.height/2.0, 0);
  canvas3d.rotateX(anguloRotacao3d * 0.35);
  canvas3d.rotateY(anguloRotacao3d);
  canvas3d.fill(200, 208, 218);

  if(svar == 31){
    if(rotulo3d.equals("Base Quadrada"))        canvas3d.box(120, 170, 120);
    else if(rotulo3d.equals("Base Triangular")) desenhar3dPrismaPoligonal(3, 95, 170);
    else if(rotulo3d.equals("Base Hexagonal"))  desenhar3dPrismaPoligonal(6, 80, 170);
  }
  else if(svar == 32){
    if(rotulo3d.equals("Base Quadrada"))        desenhar3dPiramideQuadrada(140, 190);
    else if(rotulo3d.equals("Base Triangular")) desenhar3dPiramidePoligonal(3, 95, 190);
    else if(rotulo3d.equals("Base Hexagonal"))  desenhar3dPiramidePoligonal(6, 80, 190);
  }
  else if(svar == 33) desenhar3dCone(90, 190);
  else if(svar == 34) canvas3d.sphere(110);

  canvas3d.popMatrix();
  canvas3d.endDraw();
  image(canvas3d, imgX, imgY, imgW, imgH);
}

// ── Botões de variação 3D (estilo pílula) ────────
void botoesVariacaoPrisma(){
  float clX = canvaX + 30;
  float clY = canvaH*10.2/14;
  int n = 3; float gap = 12;
  float clW = min(120, (canvaW - 30 - 40 - (n-1)*gap) / n);
  float clH = 34;
  botaoVariacao3d("Base Quadrada",   clX, clY, clW, clH);
  botaoVariacao3d("Base Triangular", clX+clW+gap, clY, clW, clH);
  botaoVariacao3d("Base Hexagonal",  clX+(clW+gap)*2, clY, clW, clH);
}

void botoesVariacaoPiramide(){
  float clX = canvaX + 30;
  float clY = canvaH*10.2/14;
  int n = 3; float gap = 12;
  float clW = min(120, (canvaW - 30 - 40 - (n-1)*gap) / n);
  float clH = 34;
  botaoVariacao3d("Base Quadrada",   clX, clY, clW, clH);
  botaoVariacao3d("Base Triangular", clX+clW+gap, clY, clW, clH);
  botaoVariacao3d("Base Hexagonal",  clX+(clW+gap)*2, clY, clW, clH);
}

void botaoVariacao3d(String texto, float x, float y, float w, float h){
  boolean over = estaSobre(x, y, w, h);
  boolean active = rotulo3d.equals(texto);

  noStroke(); fill(shadow_col);
  rect(x+2, y+2, w, h, h/2);

  if(active)                         fill(backgroundButton);
  else if(over && deducao.isEmpty()) fill(card_hover);
  else                               fill(255);

  if(deducao.isEmpty()){
    stroke(active ? header_bg : borda_cor);
    strokeWeight(active ? 1.5 : 1);
  } else { noStroke(); }
  rect(x, y, w, h, h/2);

  noStroke();
  fill(active ? 255 : (over ? header_bg : texto_dark));
  textSize(10); textAlign(CENTER, CENTER);
  text(texto, x+w/2, y+h/2);

  if(mousePressed && over && deducao.isEmpty()){
    tocarClick();
    rotulo3d = texto;
    limparValores();
  }
}

// ── Painel de cálculo 3D ─────────────────────────
void painelValores3d(){
  int fieldCount = 0;
  if(svar == 31 || svar == 32){
    if("Base Quadrada".equals(rotulo3d)) fieldCount = 2;
    else fieldCount = 3;
  } else if(svar == 33) fieldCount = 2;
  else if(svar == 34) fieldCount = 1;
  if(fieldCount == 0) return;

  float x = canvaX + canvaW*4.5/13;
  float y = canvaH*8.5/14;
  float w = 180;
  float h = max(canvaH*3/14, 90 + fieldCount * 42);

  noStroke(); fill(shadow_col);
  rect(x+3, y+3, w, h, 24);
  fill(255);
  if(deducao.isEmpty()){ stroke(borda_cor); strokeWeight(1.5); }
  else { noStroke(); }
  rect(x, y, w, h, 24);

  fill(header_bg); noStroke();
  rect(x, y, w, 38, 24, 24, 0, 0);
  fill(255); textSize(11); textAlign(LEFT, CENTER);
  text("Calcular volume", x+14, y+19);

  float fieldX = x+14;
  float fieldY = y+50;
  float fieldW = w-28;
  float fieldH = 28;
  float rowSpacing = 38;

  if(svar == 31 || svar == 32){
    if("Base Quadrada".equals(rotulo3d)){
      campoEntrada3d("l", fieldX, fieldY, fieldW, fieldH, valorL);
      campoEntrada3d("h", fieldX, fieldY+rowSpacing, fieldW, fieldH, valorH);
    } else if("Base Triangular".equals(rotulo3d)){
      campoEntrada3d("b", fieldX, fieldY, fieldW, fieldH, valorB);
      campoEntrada3d("a", fieldX, fieldY+rowSpacing, fieldW, fieldH, valorA);
      campoEntrada3d("h", fieldX, fieldY+rowSpacing*2, fieldW, fieldH, valorH);
    } else if("Base Hexagonal".equals(rotulo3d)){
      campoEntrada3d("P", fieldX, fieldY, fieldW, fieldH, valorP);
      campoEntrada3d("a", fieldX, fieldY+rowSpacing, fieldW, fieldH, valorA);
      campoEntrada3d("h", fieldX, fieldY+rowSpacing*2, fieldW, fieldH, valorH);
    }
    exibirResultados3d(x+w+20, y, 240, h);
  }
  if(svar == 33){
    campoEntrada3d("r", fieldX, fieldY, fieldW, fieldH, valorR);
    campoEntrada3d("h", fieldX, fieldY+rowSpacing, fieldW, fieldH, valorH);
    exibirResultados3d(x+w+20, y, 240, h);
  }
  if(svar == 34){
    campoEntrada3d("r", fieldX, fieldY, fieldW, fieldH, valorR);
    exibirResultados3d(x+w+20, y, 140, h);
  }
}

void campoEntrada3d(String label, float x, float y, float w, float h, String valor){
  boolean over = estaSobre(x, y, w, h);
  boolean active = activeInput.equals(label);

  noStroke(); fill(shadow_col);
  rect(x+1, y+1, w, h, 12);

  fill(active ? color(218,250,218) : over ? color(235,250,235) : color(250,252,250));
  if(deducao.isEmpty()){
    stroke(active ? backgroundButton : borda_cor);
    strokeWeight(active ? 2 : 1);
  } else { noStroke(); }
  rect(x, y, w, h, 12);

  if(active){ fill(backgroundButton); noStroke(); circle(x+8, y+h/2, 6); }
  noStroke(); fill(texto_dark);
  textSize(13); textAlign(LEFT, CENTER);
  text(label+": "+(valor.equals("")?"...":valor), x+(active?18:10), y+h/2);

  if(mousePressed && over){ tocarClick(); activeInput = label; }
}

void exibirResultados3d(float x, float y, float w, float h){
  noStroke(); fill(shadow_col);
  rect(x+3, y+3, w, h, 20);

  fill(248, 253, 248);
  if(deducao.isEmpty()){ stroke(borda_cor); strokeWeight(1.2); }
  else { noStroke(); }
  rect(x, y, w, h, 20);

  fill(header_bg); noStroke();
  rect(x, y, w, 38, 20, 20, 0, 0);
  fill(255); textSize(12); textAlign(LEFT, CENTER);
  text("Resultados", x+14, y+19);

  noStroke(); fill(texto_dark);
  textSize(13); textAlign(LEFT, TOP);

  float posY = y + 48;
  float baseArea = calcularAreaBase();
  if(baseArea > 0){
    fill(header_bg);
    text("Ab = "+nf(baseArea, 0, 2), x+14, posY);
    posY += 22;
  }
  float volume = calcularVolume();
  if(volume > 0){
    fill(texto_dark);
    text("V = "+nf(volume, 0, 2), x+14, posY);
  }
  if(baseArea == 0 && volume == 0){
    fill(160); textSize(12);
    text("Preencha os campos...", x+14, y+48);
  }
}

// ── Glossário 3D (com barra de acento) ───────────
void glossario3d(String texto, float x, float y, float w, float h){
  noStroke(); fill(shadow_col);
  rect(x+2, y+2, w, h, 16);

  fill(backgroundButton); noStroke();
  rect(x, y, 4, h, 2);

  fill(248, 252, 248);
  if(deducao.isEmpty()){ stroke(borda_cor); strokeWeight(1); }
  else { noStroke(); }
  rect(x+4, y, w-4, h, 0, 16, 16, 0);

  noStroke(); fill(texto_dark);
  textSize(11); textAlign(LEFT, TOP);
  text(texto, x+16, y+10);
}

// ── Funções lógicas (sem alteração visual) ────────
float parseFloatSeguro(String valor){
  if(valor == null || valor.equals("") || valor.equals(".")) return 0;
  try { return float(valor); } catch(Exception e){ return 0; }
}

float calcularAreaBase(){
  if(svar == 31 || svar == 32){
    if(rotulo3d.equals("Base Quadrada"))    return pow(parseFloatSeguro(valorL), 2);
    if(rotulo3d.equals("Base Triangular"))  return parseFloatSeguro(valorB)*parseFloatSeguro(valorA)/2;
    if(rotulo3d.equals("Base Hexagonal"))   return parseFloatSeguro(valorP)*parseFloatSeguro(valorA)/2;
  }
  if(svar == 33) return PI * pow(parseFloatSeguro(valorR), 2);
  return 0;
}

float calcularVolume(){
  if(svar == 31) return calcularAreaBase() * parseFloatSeguro(valorH);
  if(svar == 32) return calcularAreaBase() * parseFloatSeguro(valorH) / 3;
  if(svar == 33) return PI * pow(parseFloatSeguro(valorR),2) * parseFloatSeguro(valorH) / 3;
  if(svar == 34) return 4 * PI * pow(parseFloatSeguro(valorR),3) / 3;
  return 0;
}

void keyPressed(){
  if(!activeInput.equals("")){
    if(key == BACKSPACE || key == DELETE){
      if(activeInput.equals("l")) valorL = valorL.length()>0?valorL.substring(0,valorL.length()-1):"";
      if(activeInput.equals("b")) valorB = valorB.length()>0?valorB.substring(0,valorB.length()-1):"";
      if(activeInput.equals("h")) valorH = valorH.length()>0?valorH.substring(0,valorH.length()-1):"";
      if(activeInput.equals("P")) valorP = valorP.length()>0?valorP.substring(0,valorP.length()-1):"";
      if(activeInput.equals("a")) valorA = valorA.length()>0?valorA.substring(0,valorA.length()-1):"";
      if(activeInput.equals("r")) valorR = valorR.length()>0?valorR.substring(0,valorR.length()-1):"";
      if(activeInput.equals("D")) valorP = valorP.length()>0?valorP.substring(0,valorP.length()-1):"";
      if(activeInput.equals("d")) valorA = valorA.length()>0?valorA.substring(0,valorA.length()-1):"";
      if(activeInput.equals("B")) valorP = valorP.length()>0?valorP.substring(0,valorP.length()-1):"";
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
      if(activeInput.equals("D")) valorP = atual;
      if(activeInput.equals("d")) valorA = atual;
      if(activeInput.equals("B")) valorP = atual;
    }
  }
}

PImage imagemPrismaSelecionada(){
  if(rotulo3d.equals("Base Triangular")) return imagemOuFallback(imgPrismaTriangular, imgPrismaQuadrado);
  if(rotulo3d.equals("Base Hexagonal"))  return imagemOuFallback(imgPrismaHexagonal,  imgPrismaQuadrado);
  return imgPrismaQuadrado;
}

PImage imagemPiramideSelecionada(){
  if(rotulo3d.equals("Base Triangular")) return imagemOuFallback(imgPiramideTriangular, imgPiramideQuadrada);
  if(rotulo3d.equals("Base Hexagonal"))  return imagemOuFallback(imgPiramideHexagonal,  imgPiramideQuadrada);
  return imgPiramideQuadrada;
}

PImage imagemOuFallback(PImage principal, PImage fallback){
  return principal != null ? principal : fallback;
}

String formulaVolumePrisma()  { return "Ab x h"; }

String formulaAreaBase3d(){
  if(rotulo3d.equals("Base Triangular")) return "b x h\n-------------\n      2      ";
  if(rotulo3d.equals("Base Hexagonal"))  return "P x a\n-------------\n      2      ";
  return "l x l";
}

String deducaoVolumePrisma(){
  return "Deducao do volume do prisma:\n\n"+deducaoAreaBase3d()+"\n\n1. Considere a area da base Ab.\n2. O prisma e a extensao dessa area ao longo da altura h.\n3. Portanto:\nV = Ab x h";
}

String deducaoVolumePiramide(){
  return "Deducao do volume da piramide:\n\n"+deducaoAreaBase3d()+"\n\n1. Um prisma de mesma base e altura pode ser dividido em 3 piramides iguais.\n2. Logo cada piramide vale um terco do prisma.\n3. Portanto:\nV = (Ab x h) / 3";
}

String deducaoVolumeCone(){
  return "Deducao do volume do cone:\n\n1. A base circular tem area Ab = pi x r^2.\n2. Um cilindro de mesma base e altura tem V_cil = pi x r^2 x h.\n3. O cone ocupa exatamente 1/3 desse cilindro.\n4. Portanto:\nV = (pi x r^2 x h) / 3";
}

String deducaoVolumeEsfera(){
  return "Deducao do volume da esfera:\n\n1. A secao maxima da esfera e um circulo de raio r com area pi x r^2.\n2. A derivacao completa exige Calculo Integral (somatoria de fatias).\n3. Resultado demonstrado por Arquimedes:\nV = (4 x pi x r^3) / 3";
}

String deducaoAreaBase3d(){
  if(rotulo3d.equals("Base Triangular")) return "Base triangular: Ab = (b x h) / 2";
  if(rotulo3d.equals("Base Hexagonal"))  return "Base hexagonal: Ab = (P x a) / 2";
  return "Base quadrada: Ab = l x l";
}

String glossarioPrismaPiramide(){
  if(rotulo3d.equals("Base Triangular")) return "Ab = area da base | h = altura do solido\nb = base do triangulo | a = altura do triangulo";
  if(rotulo3d.equals("Base Hexagonal"))  return "Ab = area da base | h = altura do solido\nP = perimetro | a = apotema";
  return "Ab = area da base | h = altura do solido\nl = lado da base";
}

float alturaGlossarioPrismaPiramide(){
  return (rotulo3d.equals("Base Triangular") || rotulo3d.equals("Base Hexagonal")) ? 52 : 40;
}

// ── Formas 3D (lógica sem alteração) ─────────────
void desenhar3dPrismaPoligonal(int n, float r, float h){
  float hh = h/2;
  canvas3d.beginShape(QUAD_STRIP);
  for(int i = 0; i <= n; i++){
    float ang = TWO_PI*i/n;
    canvas3d.vertex(r*cos(ang),-hh,r*sin(ang));
    canvas3d.vertex(r*cos(ang), hh,r*sin(ang));
  }
  canvas3d.endShape();
  canvas3d.beginShape(TRIANGLE_FAN);
  canvas3d.vertex(0,-hh,0);
  for(int i = 0; i <= n; i++){ float ang=TWO_PI*i/n; canvas3d.vertex(r*cos(ang),-hh,r*sin(ang)); }
  canvas3d.endShape();
  canvas3d.beginShape(TRIANGLE_FAN);
  canvas3d.vertex(0,hh,0);
  for(int i = n; i >= 0; i--){ float ang=TWO_PI*i/n; canvas3d.vertex(r*cos(ang),hh,r*sin(ang)); }
  canvas3d.endShape();
}

void desenhar3dPiramideQuadrada(float w, float h){
  float hw=w/2, base=h/2, topo=-h/2;
  canvas3d.beginShape(TRIANGLES);
  canvas3d.vertex(0,topo,0); canvas3d.vertex(-hw,base,-hw); canvas3d.vertex(hw,base,-hw);
  canvas3d.vertex(0,topo,0); canvas3d.vertex(hw,base,-hw);  canvas3d.vertex(hw,base,hw);
  canvas3d.vertex(0,topo,0); canvas3d.vertex(hw,base,hw);   canvas3d.vertex(-hw,base,hw);
  canvas3d.vertex(0,topo,0); canvas3d.vertex(-hw,base,hw);  canvas3d.vertex(-hw,base,-hw);
  canvas3d.endShape();
  canvas3d.beginShape(QUADS);
  canvas3d.vertex(-hw,base,-hw); canvas3d.vertex(hw,base,-hw);
  canvas3d.vertex(hw,base,hw);   canvas3d.vertex(-hw,base,hw);
  canvas3d.endShape();
}

void desenhar3dPiramidePoligonal(int n, float r, float h){
  float hh=h/2;
  canvas3d.beginShape(TRIANGLE_FAN);
  canvas3d.vertex(0,-hh,0);
  for(int i=0;i<=n;i++){float ang=TWO_PI*i/n;canvas3d.vertex(r*cos(ang),hh,r*sin(ang));}
  canvas3d.endShape();
  canvas3d.beginShape(TRIANGLE_FAN);
  canvas3d.vertex(0,hh,0);
  for(int i=n;i>=0;i--){float ang=TWO_PI*i/n;canvas3d.vertex(r*cos(ang),hh,r*sin(ang));}
  canvas3d.endShape();
}

void desenhar3dCone(float r, float h){
  int lados=32; float hh=h/2;
  canvas3d.beginShape(TRIANGLE_FAN);
  canvas3d.vertex(0,-hh,0);
  for(int i=0;i<=lados;i++){float ang=TWO_PI*i/lados;canvas3d.vertex(r*cos(ang),hh,r*sin(ang));}
  canvas3d.endShape();
  canvas3d.beginShape(TRIANGLE_FAN);
  canvas3d.vertex(0,hh,0);
  for(int i=lados;i>=0;i--){float ang=TWO_PI*i/lados;canvas3d.vertex(r*cos(ang),hh,r*sin(ang));}
  canvas3d.endShape();
}
