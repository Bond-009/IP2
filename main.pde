static int widthCenter;
static int heightCenter;

Map map;
HashMap<Integer, BlockEntity> blockEntities;
PImage[] textures;
Player player;
Menu menu = null;
PGraphics vignette;

void setup() {
  // Set screen size
  // size(1920, 1080, UseOpenGL ? P2D : JAVA2D);
  fullScreen(UseOpenGL ? P2D : JAVA2D);
  if (UseOpenGL) {
    hint(DISABLE_TEXTURE_MIPMAPS);
    ((PGraphicsOpenGL)g).textureSampling(2);
  }
  
  widthCenter = width / 2;
  heightCenter = height / 2;

  pixelDensity(1);
  noStroke();
  noSmooth();
  
  // Load textures
  textures = new PImage[128];
  textures[BlockId.BedrockBlock] = loadImage("bedrock.png");
  textures[BlockId.BookshelfBlock] = loadImage("bookshelf.png");
  textures[BlockId.BrickBlock] = loadImage("brick.png");
  textures[BlockId.CobblestoneBlock] = loadImage("cobblestone.png");
  textures[BlockId.CraftingTableBlock] = loadImage("crafting_table_front.png");
  textures[BlockId.DirtBlock] = loadImage("dirt.png");
  textures[BlockId.DoorLowerBlock] = loadImage("door_spruce_lower.png");
  textures[BlockId.DoorUpperBlock] = loadImage("door_spruce_upper.png");
  textures[BlockId.FurnaceFrontOffBlock] = loadImage("furnace_front_off.png");
  textures[BlockId.FurnaceFrontOnBlock] = loadImage("furnace_front_on.png");
  textures[BlockId.GrassSideBlock] = loadImage("grass_side.png");
  textures[BlockId.HardenedClayBlock] = loadImage("hardened_clay.png");
  textures[BlockId.HardenedClayStainedLightBlueBlock] = loadImage("hardened_clay_stained_light_blue.png");
  textures[BlockId.HardenedClayStainedLimeBlock] = loadImage("hardened_clay_stained_lime.png");
  textures[BlockId.HardenedClayStainedMagentaBlock] = loadImage("hardened_clay_stained_magenta.png");
  textures[BlockId.HardenedClayStainedOrangeBlock] = loadImage("hardened_clay_stained_orange.png");
  textures[BlockId.HardenedClayStainedPinkBlock] = loadImage("hardened_clay_stained_pink.png");
  textures[BlockId.HardenedClayStainedPurpleBlock] = loadImage("hardened_clay_stained_purple.png");
  textures[BlockId.HardenedClayStainedRedBlock] = loadImage("hardened_clay_stained_red.png");
  textures[BlockId.HardenedClayStainedSilverBlock] = loadImage("hardened_clay_stained_silver.png");
  textures[BlockId.HardenedClayStainedWhiteBlock] = loadImage("hardened_clay_stained_white.png");
  textures[BlockId.HardenedClayStainedYellowBlock] = loadImage("hardened_clay_stained_yellow.png");
  textures[BlockId.IronBlock] = loadImage("iron_block.png");
  textures[BlockId.LapisBlock] = loadImage("lapis_block.png");
  textures[BlockId.LeavesSpruceBlock] = loadImage("leaves_spruce.png");
  textures[BlockId.LogOakBlock] = loadImage("log_oak.png");
  textures[BlockId.LogOakTopBlock] = loadImage("log_oak_top.png");
  textures[BlockId.MushroomSkinRedBlock] = loadImage("mushroom_block_skin_red.png");
  textures[BlockId.MushroomSkinStemBlock] = loadImage("mushroom_block_skin_stem.png");
  textures[BlockId.PlanksOakBlock] = loadImage("planks_oak.png");
  textures[BlockId.PlanksSpruceBlock] = loadImage("planks_spruce.png");
  textures[BlockId.PortalBlock] = loadImage("portal.png");
  textures[BlockId.PumpkinFaceOffBlock] = loadImage("pumpkin_face_off.png");
  textures[BlockId.RedstoneLampOffBlock] = loadImage("redstone_lamp_off.png");
  textures[BlockId.RedstoneLampOnBlock] = loadImage("redstone_lamp_on.png");
  textures[BlockId.RepeaterOffBlock] = loadImage("repeater_off.png");
  textures[BlockId.RepeaterOnBlock] = loadImage("repeater_on.png");
  textures[BlockId.SandBlock] = loadImage("sand.png");
  textures[BlockId.SlimeBlock] = loadImage("slime.png");
  textures[BlockId.StoneBlock] = loadImage("stone.png");
  textures[BlockId.StoneSlabBlock] = loadImage("stone_slab_top.png");
  textures[BlockId.StoneBrickBlock] = loadImage("stonebrick.png");
  textures[BlockId.TntBlock] = loadImage("tnt_side.png");
  textures[BlockId.WoolColoredBlueBlock] = loadImage("wool_colored_blue.png");
  textures[BlockId.WoolColoredBrownBlock] = loadImage("wool_colored_brown.png");
  textures[BlockId.WoolColoredCyanBlock] = loadImage("wool_colored_cyan.png");
  textures[BlockId.WoolColoredLightBlueBlock] = loadImage("wool_colored_light_blue.png");
  textures[BlockId.WoolColoredLimeBlock] = loadImage("wool_colored_lime.png");
  textures[BlockId.WoolColoredMagentaBlock] = loadImage("wool_colored_magenta.png");
  textures[BlockId.WoolColoredOrangeBlock] = loadImage("wool_colored_orange.png");
  textures[BlockId.WoolColoredPinkBlock] = loadImage("wool_colored_pink.png");
  textures[BlockId.WoolColoredPurpleBlock] = loadImage("wool_colored_purple.png");
  textures[BlockId.WoolColoredRedBlock] = loadImage("wool_colored_red.png");
  textures[BlockId.WoolColoredYellowBlock] = loadImage("wool_colored_yellow.png");

  blockEntities = new HashMap<Integer, BlockEntity>();
  map = new Map();

  player = new Player(256, 0);

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
