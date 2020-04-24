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
      println("DEBUG: Block is not a door");
      return false;
    }
    
    return true;
  }
}

class RepeaterBlockEntity extends BlockEntity {
  boolean use(int x, int y, Player player) {
    byte info = map.getBlockInfo(x, y);
    byte blockType = (byte)(info & 0x7f);
    
    if (blockType == BlockId.RepeaterOffBlock) {
      map.setBlockInfo(x, y, (byte)(BlockId.RepeaterOnBlock | (info & 0x80)));
    } else if (blockType == BlockId.RepeaterOnBlock) {
      map.setBlockInfo(x, y, (byte)(BlockId.RepeaterOffBlock | (info & 0x80)));
    } else {
      println("DEBUG: Block is not a repeater");
      return false;
    }

    return true;
