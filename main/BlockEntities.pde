abstract class BlockEntity {
  abstract boolean use(int x, int y, Player player);
}

class DoorBlockEntity extends BlockEntity {
  boolean use(int x, int y, Player player) {
    byte info = map.getBlockInfo(x, y);
    byte blockType = (byte)(info & 0x7f);
    boolean isOpen = (info & 0x80) == 0x80;
    
    if (blockType == BlockId.DoorLowerBlock) {
      map.setBlockInfo(x, y, isOpen ? BlockId.DoorLowerBlock : (byte)(BlockId.DoorLowerBlock | 0x80));
      map.setBlockInfo(x, y - 1, isOpen ? BlockId.DoorUpperBlock : (byte)(BlockId.DoorUpperBlock | 0x80));
    } else if (blockType == BlockId.DoorUpperBlock) {
      map.setBlockInfo(x, y, isOpen ? BlockId.DoorUpperBlock : (byte)(BlockId.DoorUpperBlock | 0x80));
      map.setBlockInfo(x, y + 1, isOpen ? BlockId.DoorLowerBlock : (byte)(BlockId.DoorLowerBlock | 0x80));
    } else {
      println("DEBUG: unreachable");
      return false;
    }
    
    return true;
  }
}
