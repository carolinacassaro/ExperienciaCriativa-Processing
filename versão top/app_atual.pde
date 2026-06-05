void settings(){
  size(width, height, P3D);
}

void setup() {
  imgInicial = loadImage("pagInicial.png");
  imgBotao = loadImage("botaoInicial.png");
  fonte = createFont("Arial", 64, true);
  textFont(fonte);
  
  // Prisma
  imgPrismaQuadrado = loadImage("PrismaQuadrado.png");
  imgPrismaTriangular = loadImage("prismaTriangular.png");
  imgPrismaHexagonal = loadImage("PrismaHexagonal.png");
  
  // Piramide
  imgPiramideQuadrada = loadImage("piramideQuadrada.png");
  imgPiramideTriangular = loadImage("PiramideTriangular.png");
  imgPiramideHexagonal = loadImage("piramideHexagonal.png");
  
  // Cone e esfera
  imgCone3D = loadImage("cone.png");
  imgEsfera3D = loadImage("esfera.png");
  
  // Imagens do menu lateral 3D
  imgCubo3D = imgPrismaQuadrado;
  imgPiramide3D = imgPiramideQuadrada;

  // inicializa som via reflexão se a biblioteca estiver disponível
  initSound();

  svar = 1;
  
  canvas3d = createGraphics(300, 300, P3D);
}

void draw(){
  hint(DISABLE_DEPTH_TEST);
  if(!deducao.isEmpty()){
    noStroke();
  }
  if (svar == 1) viewInicial();
  if (svar == 2) view2d();
    if (svar == 21) view2d_1();
    if (svar == 22) view2d_2();
    if (svar == 23) view2d_3();
    if (svar == 24) view2d_4();
    if (svar == 25) view2d_5();
    if (svar == 26) view2d_6();
  if (svar == 3) view3d();
    if (svar == 31) view3d_1();
    if (svar == 32) view3d_2();
    if (svar == 33) view3d_3();
    if (svar == 34) view3d_4();
  // Questionário
  if (svar == 4) viewQuestionarioMenu();
  if (svar == 5) viewQuestionario();
  if (svar == 6) viewResultados();

  if(!deducao.isEmpty()){
    popUp();
  }
  
  // reset do clique único — deve ser o último comando do draw
  clickDetectado = false;
}

// captura um único clique por pressionamento do mouse
void mousePressed(){
  clickDetectado = true;
}

// Inicializa objetos de som via reflexão para manter compatibilidade
void initSound(){
  try{
    Class<?> sinClass = Class.forName("processing.sound.SinOsc");
    soundAvailable = true;
    java.lang.reflect.Constructor<?> ctor = sinClass.getConstructor(Object.class);
    hoverSound = ctor.newInstance(this);
    soundSetFreq(hoverSound, 880);
    soundSetAmp(hoverSound, 0);
    soundPlay(hoverSound);

    clickSound = ctor.newInstance(this);
    soundSetFreq(clickSound, 440);
    soundSetAmp(clickSound, 0);
    soundPlay(clickSound);
  } catch(Exception e){
    soundAvailable = false;
    hoverSound = null;
    clickSound = null;
  }
}
