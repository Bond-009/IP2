public static class BlockId {
  final static byte StoneBlock = 1;
  final static byte OakDoorLowerBlock = 6;
  final static byte OakDoorUpperBlock = 64;

  public static boolean isUsable(int blockId) {
    switch (blockId) {
      case OakDoorLowerBlock:
      case OakDoorUpperBlock:
        return true;
      default:
        return false;
    }
  }
  
  public static void use(int blockId, int x, int y) {
    if (!BlockId.isUsable(blockId)) {
      return;
    }
    
    // TODO:
  }
}
