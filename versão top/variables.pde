// Status de paginas e tamanho
int svar;
int width = 1500;
int height = 700;
PFont fonte;
String deducao = "";

int canvaW = width-200;
int canvaH = height;
int canvaX = 200;
int canvaY = 0;

// ------------------------

// Pag.Inicial - imagens
PImage imgInicial;
PImage imgBotao;
PImage imgCubo3D;
PImage imgPiramide3D;
PImage imgCone3D;
PImage imgEsfera3D;
PImage imgPrismaQuadrado;
Object hoverSound;
Object clickSound;
boolean soundAvailable = false;
String activeInput = "";
String valorL = "";
String valorB = "";
String valorH = "";
String valorP = "";
String valorA = "";
String valorR = "";
PImage imgPrismaTriangular;
PImage imgPrismaHexagonal;
PImage imgPiramideQuadrada;
PImage imgPiramideTriangular;
PImage imgPiramideHexagonal;
float b2dX = width/8.7;
float b2dY = height/2.4;
float b3dX = width/1.69;
float b3dY = height/2.4;
PImage imge;

// ------------------------

// Button variables
int btnHeight = 100;
int btnWidth = 200;

// ------------------------

// Pag.2D - variables
int menu2opcoes;
String rotulo = "Equilátero";

// ------------------------

// Pag.3D - variables
int menu3opcoes;
String rotulo3d = "Base Quadrada";

// ------------------------
// Detector de clique único (evita auto-clique ao segurar o mouse)
boolean clickDetectado = false;

// Rotação das figuras 3D
float anguloRotacao3d = 0;
PGraphics canvas3d;
