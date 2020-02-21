static int widthCenter;
static int heightCenter;

Map map;
PImage[] textures;
Player player;
Menu menu = null;
PGraphics vignette;

void setup() {
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

  player = new Player(256, 64 * 64 - 64 * 3);

  // Draw vignette
  vignette = createGraphics(width, height);
  vignette.noSmooth();
  vignette.beginDraw();
  int lightDistance = RenderDistance * BlockHeight - BlockHeight * 2;

  for (int px = 0; px < width; px++) {
    for (int py = 0; py < height; py++) {
      float dist = dist(px, py, widthCenter + BlockHeight / 2, heightCenter + BlockHeight);
      if (dist > lightDistance) {
        vignette.stroke(0);
        vignette.point(px, py);
    } /*
    REVIEW: transition doesn't function:
    else if (dist > lightDistance - 48) {
        vignette.stroke(0, 255 - (dist - lightDistance + 48) / 48 * 255);
        vignette.point(px, py);
      } */
    }
  }

  vignette.endDraw();
}
