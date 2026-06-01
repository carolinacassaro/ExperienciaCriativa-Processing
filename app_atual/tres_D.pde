void view3d(){
  background(244, 246, 245);
  menu3d();
}

void view3d_1(){
  background(244, 246, 245);
  menu3d();
  fundoCanvas3d();
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
  fundoCanvas3d();
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
  fundoCanvas3d();
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
  fundoCanvas3d();
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
        activeInput = "";
        
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
  stroke(over ? color(90, 140, 255) : color(120));
  strokeWeight(over ? 3 : 1.5);
  fill(255);
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

void fundoCanvas3d(){
  fill(light_green);
  rect(canvaX, canvaY, canvaW, canvaH);
  noStroke();
  fill(255, 30);
  for(int i = 0; i < 8; i++){
    rect(canvaX + 10, canvaY + i * canvaH/8, canvaW - 20, canvaH/20, 18);
  }
}

void desenharFormaPrincipal3d(PImage imgForma, String legenda){
  float imgX = canvaX + canvaW*0.5/13;
  float imgY = canvaY + canvaH*2.2/14;
  float imgW = canvaW*3.5/13;
  float imgH = canvaH*5.0/14;
  
  preview3d.beginDraw();
  preview3d.clear();
  preview3d.background(0, 0);

  if(imgForma != null){
    preview3d.imageMode(CENTER);
    preview3d.pushMatrix();
    preview3d.translate(preview3d.width/2, preview3d.height/2 + 20);
    preview3d.image(imgForma, 0, 0, preview3d.width * 0.9, preview3d.height * 0.9);
    preview3d.popMatrix();
  } else {
    preview3d.noStroke();
    preview3d.lights();
    preview3d.ambientLight(120, 120, 120);
    preview3d.directionalLight(255, 255, 255, -0.5, -1, -0.5);
    preview3d.pointLight(255, 255, 255, preview3d.width*0.5, preview3d.height*0.2, 300);
    preview3d.pushMatrix();
    preview3d.translate(preview3d.width/2, preview3d.height/2 + 20, 0);
    preview3d.rotateX(-PI/6);
    preview3d.rotateY(angle3d);
    desenharModelo3d(preview3d);
    preview3d.popMatrix();
  }

  preview3d.endDraw();
  imageMode(CORNER);
  image(preview3d, imgX, imgY, imgW, imgH);
}

void desenharModelo3d(PGraphics pg){
  pg.pushMatrix();
  float s = 120;
  if(svar == 31){
    if(rotulo3d.equals("Base Quadrada")) desenharPrismaQuadrado(pg, s);
    else if(rotulo3d.equals("Base Triangular")) desenharPrismaTriangular(pg, s);
    else desenharPrismaHexagonal(pg, s);
  } else if(svar == 32){
    if(rotulo3d.equals("Base Quadrada")) desenharPiramideQuadrada(pg, s);
    else if(rotulo3d.equals("Base Triangular")) desenharPiramideTriangular(pg, s);
    else desenharPiramideHexagonal(pg, s);
  } else if(svar == 33){
    desenharCone(pg, s*0.7, s*1.3);
  } else if(svar == 34){
    desenharEsfera(pg, s*0.8);
  }
  pg.popMatrix();
}

void desenharPrismaQuadrado(PGraphics pg, float s){
  pg.pushMatrix();
  pg.fill(165, 200, 245);
  pg.stroke(80);
  pg.strokeWeight(1.5);
  pg.box(s, s*0.6, s);
  pg.popMatrix();
}

void desenharPrismaTriangular(PGraphics pg, float s){
  float h = s*0.6;
  float d = s*0.8;
  float half = s*0.5;

  PVector a1 = new PVector(-half, h/2, -d/2);
  PVector b1 = new PVector(half, h/2, -d/2);
  PVector c1 = new PVector(0, -h/2, -d/2);
  PVector a2 = new PVector(-half, h/2, d/2);
  PVector b2 = new PVector(half, h/2, d/2);
  PVector c2 = new PVector(0, -h/2, d/2);

  pg.pushMatrix();
  pg.fill(220, 180, 170);
  pg.stroke(80);
  pg.strokeWeight(1.5);
  pg.beginShape(TRIANGLES);
  pg.vertex(a1.x, a1.y, a1.z);
  pg.vertex(b1.x, b1.y, b1.z);
  pg.vertex(c1.x, c1.y, c1.z);
  pg.vertex(a2.x, a2.y, a2.z);
  pg.vertex(c2.x, c2.y, c2.z);
  pg.vertex(b2.x, b2.y, b2.z);
  pg.endShape();

  pg.beginShape(QUADS);
  pg.vertex(a1.x, a1.y, a1.z);
  pg.vertex(b1.x, b1.y, b1.z);
  pg.vertex(b2.x, b2.y, b2.z);
  pg.vertex(a2.x, a2.y, a2.z);
  pg.vertex(b1.x, b1.y, b1.z);
  pg.vertex(c1.x, c1.y, c1.z);
  pg.vertex(c2.x, c2.y, c2.z);
  pg.vertex(b2.x, b2.y, b2.z);
  pg.vertex(c1.x, c1.y, c1.z);
  pg.vertex(a1.x, a1.y, a1.z);
  pg.vertex(a2.x, a2.y, a2.z);
  pg.vertex(c2.x, c2.y, c2.z);
  pg.endShape();
  pg.popMatrix();
}

void desenharPrismaHexagonal(PGraphics pg, float s){
  float r = s*0.35;
  float h = s*0.6;
  float d = s*0.8;
  PVector[] top = new PVector[6];
  PVector[] bot = new PVector[6];
  for(int i = 0; i < 6; i++){
    float ang = TWO_PI * i / 6;
    top[i] = new PVector(cos(ang)*r, -h/2, -d/2);
    bot[i] = new PVector(cos(ang)*r, -h/2, d/2);
  }

  pg.pushMatrix();
  pg.fill(190, 215, 180);
  pg.stroke(80);
  pg.strokeWeight(1.5);
  pg.beginShape(QUADS);
  for(int i = 0; i < 6; i++){
    int j = (i + 1) % 6;
    pg.vertex(top[i].x, top[i].y, top[i].z);
    pg.vertex(top[j].x, top[j].y, top[j].z);
    pg.vertex(bot[j].x, bot[j].y, bot[j].z);
    pg.vertex(bot[i].x, bot[i].y, bot[i].z);
  }
  pg.endShape();

  pg.beginShape(TRIANGLES);
  for(int i = 1; i < 5; i++){
    pg.vertex(top[0].x, top[0].y, top[0].z);
    pg.vertex(top[i].x, top[i].y, top[i].z);
    pg.vertex(top[i+1].x, top[i+1].y, top[i+1].z);
  }
  pg.endShape();

  pg.beginShape(TRIANGLES);
  for(int i = 1; i < 5; i++){
    pg.vertex(bot[0].x, bot[0].y, bot[0].z);
    pg.vertex(bot[i+1].x, bot[i+1].y, bot[i+1].z);
    pg.vertex(bot[i].x, bot[i].y, bot[i].z);
  }
  pg.endShape();
  pg.popMatrix();
}

void desenharPiramideQuadrada(PGraphics pg, float s){
  float h = s*0.8;
  float half = s*0.4;
  PVector a = new PVector(-half, h/2, -half);
  PVector b = new PVector(half, h/2, -half);
  PVector c = new PVector(half, h/2, half);
  PVector d = new PVector(-half, h/2, half);
  PVector apex = new PVector(0, -h/2, 0);

  pg.pushMatrix();
  pg.fill(220, 180, 220);
  pg.stroke(80);
  pg.strokeWeight(1.5);
  pg.beginShape(TRIANGLES);
  pg.vertex(a.x, a.y, a.z); pg.vertex(b.x, b.y, b.z); pg.vertex(apex.x, apex.y, apex.z);
  pg.vertex(b.x, b.y, b.z); pg.vertex(c.x, c.y, c.z); pg.vertex(apex.x, apex.y, apex.z);
  pg.vertex(c.x, c.y, c.z); pg.vertex(d.x, d.y, d.z); pg.vertex(apex.x, apex.y, apex.z);
  pg.vertex(d.x, d.y, d.z); pg.vertex(a.x, a.y, a.z); pg.vertex(apex.x, apex.y, apex.z);
  pg.endShape();
  pg.beginShape(QUADS);
  pg.vertex(a.x, a.y, a.z); pg.vertex(b.x, b.y, b.z);
  pg.vertex(c.x, c.y, c.z); pg.vertex(d.x, d.y, d.z);
  pg.endShape();
  pg.popMatrix();
}

void desenharPiramideTriangular(PGraphics pg, float s){
  float h = s*0.8;
  float half = s*0.5;
  PVector a = new PVector(-half, h/2, -half*0.6);
  PVector b = new PVector(half, h/2, -half*0.6);
  PVector c = new PVector(0, h/2, half*0.8);
  PVector apex = new PVector(0, -h/2, 0);

  pg.pushMatrix();
  pg.fill(200, 170, 220);
  pg.stroke(80);
  pg.strokeWeight(1.5);
  pg.beginShape(TRIANGLES);
  pg.vertex(a.x, a.y, a.z); pg.vertex(b.x, b.y, b.z); pg.vertex(c.x, c.y, c.z);
  pg.vertex(a.x, a.y, a.z); pg.vertex(b.x, b.y, b.z); pg.vertex(apex.x, apex.y, apex.z);
  pg.vertex(b.x, b.y, b.z); pg.vertex(c.x, c.y, c.z); pg.vertex(apex.x, apex.y, apex.z);
  pg.vertex(c.x, c.y, c.z); pg.vertex(a.x, a.y, a.z); pg.vertex(apex.x, apex.y, apex.z);
  pg.endShape();
  pg.popMatrix();
}

void desenharPiramideHexagonal(PGraphics pg, float s){
  float r = s*0.3;
  float h = s*0.9;
  PVector[] base = new PVector[6];
  for(int i = 0; i < 6; i++){
    float ang = TWO_PI * i / 6;
    base[i] = new PVector(cos(ang)*r, h/2, sin(ang)*r);
  }
  PVector apex = new PVector(0, -h/2, 0);

  pg.pushMatrix();
  pg.fill(185, 220, 220);
  pg.stroke(80);
  pg.strokeWeight(1.5);
  pg.beginShape(TRIANGLES);
  for(int i = 0; i < 6; i++){
    int j = (i + 1) % 6;
    pg.vertex(base[i].x, base[i].y, base[i].z);
    pg.vertex(base[j].x, base[j].y, base[j].z);
    pg.vertex(apex.x, apex.y, apex.z);
  }
  pg.endShape();

  pg.beginShape();
  for(int i = 0; i < 6; i++){
    pg.vertex(base[i].x, base[i].y, base[i].z);
  }
  pg.endShape(CLOSE);
  pg.popMatrix();
}

void desenharCone(PGraphics pg, float r, float h){
  pg.pushMatrix();
  pg.fill(220, 200, 160);
  pg.stroke(80);
  pg.strokeWeight(1.5);

  int sides = 36;
  float halfHeight = h * 0.5;
  PVector apex = new PVector(0, -halfHeight, 0);
  PVector[] base = new PVector[sides];
  for(int i = 0; i < sides; i++){
    float ang = TWO_PI * i / sides;
    base[i] = new PVector(cos(ang) * r, halfHeight, sin(ang) * r);
  }

  pg.beginShape(TRIANGLES);
  for(int i = 0; i < sides; i++){
    int j = (i + 1) % sides;
    pg.vertex(base[i].x, base[i].y, base[i].z);
    pg.vertex(base[j].x, base[j].y, base[j].z);
    pg.vertex(apex.x, apex.y, apex.z);
  }
  pg.endShape();

  pg.beginShape();
  for(int i = 0; i < sides; i++){
    pg.vertex(base[i].x, base[i].y, base[i].z);
  }
  pg.endShape(CLOSE);
  pg.popMatrix();
}

void desenharEsfera(PGraphics pg, float r){
  pg.pushMatrix();
  pg.fill(200, 220, 240);
  pg.stroke(80);
  pg.strokeWeight(1.5);
  pg.sphere(r);
  pg.popMatrix();
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
  stroke(active ? color(90, 140, 255) : 160);
  strokeWeight(active ? 2 : 1);
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
  stroke(80);
  strokeWeight(1.2);
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
  if(activeInput != ""){
    if(key == BACKSPACE || key == DELETE){
      if(activeInput.equals("l")) valorL = valorL.length() > 0 ? valorL.substring(0, valorL.length()-1) : "";
      if(activeInput.equals("b")) valorB = valorB.length() > 0 ? valorB.substring(0, valorB.length()-1) : "";
      if(activeInput.equals("h")) valorH = valorH.length() > 0 ? valorH.substring(0, valorH.length()-1) : "";
      if(activeInput.equals("P")) valorP = valorP.length() > 0 ? valorP.substring(0, valorP.length()-1) : "";
      if(activeInput.equals("a")) valorA = valorA.length() > 0 ? valorA.substring(0, valorA.length()-1) : "";
      if(activeInput.equals("r")) valorR = valorR.length() > 0 ? valorR.substring(0, valorR.length()-1) : "";
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
      atual += key;
      if(activeInput.equals("l")) valorL = atual;
      if(activeInput.equals("b")) valorB = atual;
      if(activeInput.equals("h")) valorH = atual;
      if(activeInput.equals("P")) valorP = atual;
      if(activeInput.equals("a")) valorA = atual;
      if(activeInput.equals("r")) valorR = atual;
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
