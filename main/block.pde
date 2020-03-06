public static class BlockId {
  final static byte BedrockBlock = 1;
  final static byte BookshelfBlock = 2;
  final static byte BrickBlock = 3;
  final static byte CobblestoneBlock = 4;
  final static byte CraftingTableBlock = 5;
  final static byte DirtBlock = 6;
  final static byte DoorLowerBlock = 7;
  final static byte DoorUpperBlock = 8;
  final static byte FurnaceFrontOffBlock = 9;
  final static byte FurnaceFrontOnBlock = 10;
  final static byte GrassSideBlock = 11;
  final static byte HardenedClayBlock = 12;
  final static byte HardenedClayStainedLightBlueBlock = 13;
  final static byte HardenedClayStainedLimeBlock = 14;
  final static byte HardenedClayStainedMagentaBlock = 15;
  final static byte HardenedClayStainedOrangeBlock = 16;
  final static byte HardenedClayStainedPinkBlock = 17;
  final static byte HardenedClayStainedPurpleBlock = 18;
  final static byte HardenedClayStainedRedBlock = 19;
  final static byte HardenedClayStainedSilverBlock = 20;
  final static byte HardenedClayStainedWhiteBlock = 21;
  final static byte HardenedClayStainedYellowBlock = 22;
  final static byte IronBlock = 23;
  final static byte LapisBlock = 24;
  final static byte LeavesSpruceBlock = 25;
  final static byte LogOakBlock = 26;
  final static byte LogOakTopBlock = 27;
  final static byte MushroomSkinRedBlock = 28;
  final static byte MushroomSkinStemBlock = 29;
  final static byte PlanksOakBlock = 30;
  final static byte PlanksSpruceBlock = 31;
  final static byte PortalBlock = 32;
  final static byte PumpkinFaceOffBlock = 33;
  final static byte RedstoneLampOffBlock = 34;
  final static byte RedstoneLampOnBlock =35; 
  final static byte RepeaterOffBlock = 36;
  final static byte RepeaterOnBlock = 37;
  final static byte SandBlock = 38;
  final static byte SlimeBlock = 39;
  final static byte StoneBlock = 40;
  final static byte StoneSlabBlock = 41;
  final static byte StoneBrickBlock = 42;
  final static byte TntBlock = 43;
  final static byte WoolColoredBlueBlock = 44;
  final static byte WoolColoredBrownBlock = 45;
  final static byte WoolColoredCyanBlock = 46;
  final static byte WoolColoredLightBlueBlock =47; 
  final static byte WoolColoredLimeBlock = 48;
  final static byte WoolColoredMagentaBlock = 49;
  final static byte WoolColoredOrangeBlock = 50;
  final static byte WoolColoredPinkBlock = 51;
  final static byte WoolColoredPurpleBlock = 52;
  final static byte WoolColoredRedBlock = 53;
  final static byte WoolColoredYellowBlock = 54;

  public static boolean isUsable(int blockId) {
    switch (blockId) {
        case DoorLowerBlock:
        case DoorUpperBlock:
        return true;
      default:
        return false;
    }
  }
}
