void settings(){
  size(width, height, P3D);
}

void setup() {
  imgInicial = loadImage("pagInicial.png");
  imgBotao = loadImage("botaoInicial.png");
  fonte = createFont("Arial", 64, true);
  textFont(fonte);
  preview3d = createGraphics(400, 400, P3D);
  
  // Prisma
  imgPrismaQuadrado = loadImage("PrismaQuadrado.png");
  imgPrismaTriangular = loadImage("prismaTriangular.png");
  imgPrismaHexagonal = loadImage("PrismaHexagonal.png");
  
  // Piramide
  imgPiramideQuadrada = loadImage("piramideQuadrada.png");
  imgPiramideTriangular = loadImage("PiramideTriangular.png");
  imgPiramideHexagonal = loadImage("piramideHexagonal.png");
  
  // Cone e esfera
  imgCone3D = loadImage("Cone.png");
  imgEsfera3D = loadImage("Esfera.png");
  
  // Imagens do menu lateral 3D
  imgCubo3D = imgPrismaQuadrado;
  imgPiramide3D = imgPiramideQuadrada;

  // inicializa som via reflexão se a biblioteca estiver disponível
  initSound();

  svar = 1;
}

void draw(){
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
    
    if (!deducao.isEmpty()){
      popUp();
    }

    // animate 3D preview rotation when viewing 3D pages
    if(svar >= 31 && svar <= 34){
      angle3d += rotSpeed3d;
    }
}

// Inicializa objetos de som via reflexão para manter compatibilidade
void initSound(){
  try{
    Class<?> sinClass = Class.forName("processing.sound.SinOsc");
    // marca que som está disponível
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
    // biblioteca não disponível — opera sem som
    soundAvailable = false;
    hoverSound = null;
    clickSound = null;
  }
}
