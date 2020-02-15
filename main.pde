byte[] map;
PImage[] textures;
int posX = 128, posY = 128;

void setup()
{
  // Set screen size
  // NOTE: Keep up to date with the constants at the top of the file (can't use variables with the 'size' function)
  size(720, 480);
  noStroke();
  
  // Load textures
  textures = new PImage[128];
  textures[StoneBlock] = loadImage("stone.png");
  textures[OakDoorLowerBlock] = loadImage("door_wood_lower.png");
  textures[OakDoorUpperBlock] = loadImage("door_wood_upper.png");
  
  // Create map
  map = new byte[MapLength];
  for (int i = 0; i < MapLength; i++)
  {
     map[i] = (byte)(((i / MapWidth)  % 2 + (i % MapWidth) % 2 == 0 ? 0x80 : 0) | 1);
  }
  
  map[7 * MapWidth + 8] = OakDoorLowerBlock;
  map[8 * MapWidth + 8] = OakDoorUpperBlock;
}
