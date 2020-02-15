static int widthCenter;
static int heightCenter;

Map map;
PImage[] textures;
Player player;
Menu menu = null;

void setup()
{
  // Set screen size
  size(1920, 1080);
  widthCenter = width / 2;
  heightCenter = height / 2;
  
  noStroke();
  noSmooth();
  
  // Load textures
  textures = new PImage[128];
  textures[BlockId.StoneBlock] = loadImage("stone.png");
  textures[BlockId.OakDoorLowerBlock] = loadImage("door_wood_lower.png");
  textures[BlockId.OakDoorUpperBlock] = loadImage("door_wood_upper.png");
  
  map = new Map();
  
  player = new Player(0, 1024);
}
