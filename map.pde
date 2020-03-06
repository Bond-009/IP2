class Map {
  byte[] map;

  public Map() {
    // Create map
    map = new byte[MapLength];

    for (int i = 0; i < MapLength - MapWidth; i++) {
       map[i] = (byte)(BlockId.StoneBlock | 0x80);
    }
    
    for (int i = MapLength - MapWidth * 5; i < MapLength - MapWidth * 4; i++) {
       map[i] = BlockId.StoneBlock;
    }

    for (int i = MapLength - MapWidth; i < MapLength; i++) {
       map[i] = BlockId.StoneBlock;
    }

    map[8 * MapWidth + 8] = BlockId.DoorLowerBlock;
    map[7 * MapWidth + 8] = BlockId.DoorUpperBlock;
    map[9 * MapWidth + 8] = BlockId.StoneBlock;
    map[9 * MapWidth + 7] = BlockId.StoneBlock;
    map[9 * MapWidth + 9] = BlockId.StoneBlock;
    
    DoorBlockEntity door = new DoorBlockEntity();
    blockEntities.put(8 * MapWidth + 8, door);
    blockEntities.put(7 * MapWidth + 8, door);
  }

  int getMapPos(int x, int y) {
    int mapPos = y * MapWidth + x;
    if (x < 0 || x >= MapWidth || y < 0 || y >= MapHeight || mapPos < 0 || mapPos >= MapLength) {
      // Block is out of bounds, return -1
      return -1;
    }

    return mapPos;
  }

  public byte getBlockInfo(int x, int y) {
    int mapPos = getMapPos(x, y);
    return mapPos == -1 ? 0 : map[mapPos];
  }

  public byte getBlockId(int x, int y) {
    return (byte)(getBlockInfo(x, y) & 0x7f);
  }
  
  public void setBlockInfo(int x, int y, byte blockInfo) {
    int mapPos = getMapPos(x, y);
    if (mapPos == -1)
    {
      return;
    }
    
    map[mapPos] = blockInfo;
  }
}
