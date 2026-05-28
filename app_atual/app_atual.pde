void settings(){
    size(width, height);
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
  imgCone3D = loadImage("Cone.png");
  imgEsfera3D = loadImage("Esfera.png");
  
  // Imagens do menu lateral 3D
  imgCubo3D = imgPrismaQuadrado;
  imgPiramide3D = imgPiramideQuadrada;

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
}
