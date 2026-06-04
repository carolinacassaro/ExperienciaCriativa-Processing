// ==================================================
// questionario.pde
// ==================================================

// ── DADOS DAS PERGUNTAS ──────────────────────────

String[] perguntas = {
  "Qual é a fórmula da área do Triângulo?",
  "A fórmula   A = D x d / 2   pertence a qual figura?",
  "Qual é a fórmula da área do Círculo?",
  "A fórmula   A = (B + b) x h / 2   pertence a qual figura?",
  "Qual é a fórmula da área do Hexágono Regular?",
  "A fórmula   V = Ab x h   pertence a qual sólido?",
  "Qual é a fórmula do volume da Pirâmide?",
  "A fórmula   V = (pi x r² x h) / 3   pertence a qual sólido?",
  "Qual é a fórmula do volume da Esfera?",
  "A fórmula   A = b x h   pertence a qual figura?"
};

String[][] alternativas = {
  {"A = b x h",         "A = b x h / 2",        "A = b + h",            "A = 2 x b x h"},
  {"Triângulo",         "Hexágono",              "Trapézio",             "Losango"},
  {"A = pi x R",        "A = 2 x pi x R",        "A = pi x R²",          "A = pi x D²"},
  {"Retângulo",         "Trapézio",              "Losango",              "Triângulo"},
  {"A = 6 x a²",        "A = a² x √3 / 4",       "A = a² x √3 / 2",      "A = 3 x a² x √3 / 2"},
  {"Pirâmide",          "Esfera",                "Cone",                 "Prisma"},
  {"V = Ab x h",        "V = Ab x h / 2",        "V = Ab x h / 3",       "V = Ab x h / 4"},
  {"Esfera",            "Cilindro",              "Prisma",               "Cone"},
  {"V = pi x r³",       "V = 4 x pi x r³ / 3",  "V = (4/3) x r³",       "V = pi x r²"},
  {"Triângulo",         "Círculo",               "Retângulo",            "Trapézio"}
};

// índice (0-3) da alternativa correta de cada pergunta
int[] gabarito = {1, 3, 2, 1, 3, 3, 2, 3, 1, 2};

// ── ESTADO DO QUESTIONÁRIO ───────────────────────
int questaoAtual = 0;
int[] respostaUsuario = {-1,-1,-1,-1,-1,-1,-1,-1,-1,-1};
int totalAcertos = 0;


// ── TELA: MENU DO QUESTIONÁRIO (svar == 4) ───────
void viewQuestionarioMenu(){
  fundoQuiz();
  
  // -- título --
  float tW = 600;
  float tH = 60;
  float tX = (width - tW) / 2.0;
  float tY = 200;
  fill(255);
  stroke(150);
  strokeWeight(1.5);
  rect(tX, tY, tW, tH, 28);
  fill(40);
  noStroke();
  textSize(22);
  textAlign(CENTER, CENTER);
  text("Questionário de Geometria", tX + tW/2, tY + tH/2);
  
  // -- botão Iniciar Questionário --
  float btnW       = 300;
  float btnH       = 60;
  float btnX       = (width - btnW) / 2.0;
  float btnIniciarY = 320;
  boolean overIniciar = estaSobre(btnX, btnIniciarY, btnW, btnH);
  fill(overIniciar ? color(80, 180, 80) : backgroundButton);
  stroke(100);
  strokeWeight(1.5);
  rect(btnX, btnIniciarY, btnW, btnH, 20);
  fill(255);
  textSize(18);
  textAlign(CENTER, CENTER);
  text("Iniciar Questionário", btnX + btnW/2, btnIniciarY + btnH/2);
  
  // -- botão Voltar ao Início --
  float btnVoltarY = 400;
  boolean overVoltar = estaSobre(btnX, btnVoltarY, btnW, btnH);
  fill(overVoltar ? color(220, 235, 255) : 255);
  stroke(130);
  strokeWeight(1.5);
  rect(btnX, btnVoltarY, btnW, btnH, 20);
  fill(50);
  textSize(18);
  textAlign(CENTER, CENTER);
  text("Voltar ao Início", btnX + btnW/2, btnVoltarY + btnH/2);
  
  // -- detecção de cliques --
  if(clickDetectado){
    if(overIniciar){
      tocarClick();
      iniciarQuestionario();
      svar = 5;
    }
    if(overVoltar){
      tocarClick();
      svar = 1;
    }
  }
}


// ── TELA: PERGUNTA (svar == 5) ───────────────────
void viewQuestionario(){
  fundoQuiz();
  
  float margem   = 80;
  float contentX = margem;
  float contentW = width - margem * 2;
  
  // -- barra de progresso --
  float progW = 900;
  float progX = (width - progW) / 2.0;
  float progY = 15;
  float progH = 12;
  fill(200);
  stroke(180);
  strokeWeight(1);
  rect(progX, progY, progW, progH, 6);
  fill(backgroundButton);
  noStroke();
  rect(progX, progY, progW * (questaoAtual + 1) / 10.0, progH, 6);
  
  // -- rótulo da pergunta --
  float numW = 400;
  float numH = 32;
  float numX = (width - numW) / 2.0;
  float numY = 35;
  fill(255);
  stroke(150);
  strokeWeight(1.2);
  rect(numX, numY, numW, numH, 18);
  fill(50);
  noStroke();
  textSize(14);
  textAlign(CENTER, CENTER);
  text("Pergunta " + (questaoAtual + 1) + " de 10", numX + numW/2, numY + numH/2);
  
  // -- caixa da pergunta --
  float pergH = 110;
  float pergY = 80;
  fill(255);
  stroke(150);
  strokeWeight(1.5);
  rect(contentX, pergY, contentW, pergH, 20);
  fill(30);
  noStroke();
  textSize(20);
  textAlign(CENTER, CENTER);
  text(perguntas[questaoAtual], contentX + 30, pergY + 15, contentW - 60, pergH - 30);
  
  // -- alternativas --
  String[] letras   = {"A", "B", "C", "D"};
  float altH        = 66;
  float altGap      = 8;
  float altStartY   = 205;
  
  for(int i = 0; i < 4; i++){
    float altY  = altStartY + i * (altH + altGap);
    boolean over = estaSobre(contentX, altY, contentW, altH);
    
    // fundo da alternativa
    fill(over ? color(220, 245, 220) : 255);
    stroke(130);
    strokeWeight(1.5);
    rect(contentX, altY, contentW, altH, 14);
    
    // círculo com a letra
    float circX = contentX + 44;
    float circY = altY + altH / 2;
    fill(backgroundButton);
    noStroke();
    circle(circX, circY, 38);
    fill(255);
    textSize(16);
    textAlign(CENTER, CENTER);
    text(letras[i], circX, circY);
    
    // texto da alternativa
    fill(30);
    textSize(18);
    textAlign(LEFT, CENTER);
    text(alternativas[questaoAtual][i], contentX + 80, altY + altH/2);
    
    // -- clique (clickDetectado evita auto-clique ao segurar o mouse) --
    if(clickDetectado && over && respostaUsuario[questaoAtual] == -1){
      tocarClick();
      respostaUsuario[questaoAtual] = i;
      if(questaoAtual < 9){
        questaoAtual++;
      } else {
        calcularResultado();
        svar = 6;
      }
      break; // garante que apenas uma alternativa é processada por clique
    }
  }
}


// ── TELA: RESULTADOS (svar == 6) ─────────────────
void viewResultados(){
  fundoQuiz();
  
  // -- cabeçalho com pontuação --
  float hW = 800;
  float hH = 55;
  float hX = (width - hW) / 2.0;
  float hY = 20;
  if(totalAcertos >= 8)      fill(color(200, 240, 200));
  else if(totalAcertos >= 5) fill(color(255, 248, 200));
  else                       fill(color(255, 210, 210));
  stroke(160);
  strokeWeight(1.5);
  rect(hX, hY, hW, hH, 25);
  fill(30);
  noStroke();
  textSize(20);
  textAlign(CENTER, CENTER);
  text("Você acertou " + totalAcertos + " de 10 perguntas!", hX + hW/2, hY + hH/2);
  
  // -- lista de resultados em 2 colunas (5 itens cada) --
  float colW    = 700;
  float colGap  = 20;
  float col1X   = (width - (colW * 2 + colGap)) / 2.0;
  float col2X   = col1X + colW + colGap;
  float itemH   = 55;
  float itemGap = 6;
  float listY   = 90;
  
  for(int i = 0; i < 10; i++){
    int   col    = i / 5; // 0 = coluna esquerda, 1 = coluna direita
    int   row    = i % 5; // linha dentro da coluna (0-4)
    float itemX  = (col == 0) ? col1X : col2X;
    float itemY  = listY + row * (itemH + itemGap);
    boolean acertou = (respostaUsuario[i] == gabarito[i]);
    
    // -- fundo do item --
    fill(acertou ? color(225, 255, 225) : color(255, 218, 218));
    stroke(acertou ? color(120, 200, 120) : color(200, 110, 110));
    strokeWeight(1.2);
    rect(itemX, itemY, colW, itemH, 12);
    
    // -- ícone ✓ ou ✗ --
    fill(acertou ? color(40, 160, 40) : color(200, 50, 50));
    noStroke();
    circle(itemX + 26, itemY + itemH/2, 30);
    fill(255);
    textSize(15);
    textAlign(CENTER, CENTER);
    text(acertou ? "✓" : "✗", itemX + 26, itemY + itemH/2);
    
    // -- número e texto da pergunta --
    fill(30);
    textSize(12);
    textAlign(LEFT, TOP);
    text((i + 1) + ". " + perguntas[i], itemX + 52, itemY + 9, colW - 60, 20);
    
    // -- resposta correta (exibida somente se errou) --
    if(!acertou){
      fill(color(180, 40, 40));
      textSize(11);
      textAlign(LEFT, TOP);
      text("Correta: " + alternativas[i][gabarito[i]], itemX + 52, itemY + 33, colW - 60, 18);
    }
  }
  
  // -- botões --
  float btnW   = 270;
  float btnH   = 55;
  float btnGap = 30;
  float btnY   = listY + 5 * (itemH + itemGap) + 16;
  float btnX1  = (width - (btnW * 2 + btnGap)) / 2.0;
  float btnX2  = btnX1 + btnW + btnGap;
  
  // botão Refazer Questionário
  boolean overRefazer = estaSobre(btnX1, btnY, btnW, btnH);
  fill(overRefazer ? color(80, 180, 80) : backgroundButton);
  stroke(100);
  strokeWeight(1.5);
  rect(btnX1, btnY, btnW, btnH, 20);
  fill(255);
  textSize(17);
  textAlign(CENTER, CENTER);
  text("Refazer Questionário", btnX1 + btnW/2, btnY + btnH/2);
  
  // botão Voltar ao Início
  boolean overVoltar = estaSobre(btnX2, btnY, btnW, btnH);
  fill(overVoltar ? color(220, 235, 255) : 255);
  stroke(130);
  strokeWeight(1.5);
  rect(btnX2, btnY, btnW, btnH, 20);
  fill(50);
  textSize(17);
  textAlign(CENTER, CENTER);
  text("Voltar ao Início", btnX2 + btnW/2, btnY + btnH/2);
  
  // -- detecção de cliques --
  if(clickDetectado){
    if(overRefazer){
      tocarClick();
      iniciarQuestionario();
      svar = 5;
    }
    if(overVoltar){
      tocarClick();
      svar = 1;
    }
  }
}


// ── FUNÇÕES AUXILIARES ───────────────────────────

void fundoQuiz(){
  // mesmo estilo do resto do app, mas ocupando a tela inteira (sem menu lateral)
  background(255);
  fill(light_green);
  rect(0, 0, width, height);
  noStroke();
  fill(255, 30);
  for(int i = 0; i < 8; i++){
    rect(10, i * height/8, width - 20, height/20, 18);
  }
}

void iniciarQuestionario(){
  questaoAtual    = 0;
  respostaUsuario = new int[]{-1,-1,-1,-1,-1,-1,-1,-1,-1,-1};
  totalAcertos    = 0;
}

void calcularResultado(){
  totalAcertos = 0;
  for(int i = 0; i < 10; i++){
    if(respostaUsuario[i] == gabarito[i]) totalAcertos++;
  }
}
