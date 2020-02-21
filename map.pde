class Map {
  byte[] map;

  public Map() {
    // Create map
    map = new byte[MapLength];
    for (int i = 0; i < MapLength - MapWidth; i++)
    {
       map[i] = (byte)0x81;
    }
    
    for (int i = MapLength - MapWidth * 5; i < MapLength - MapWidth * 4; i++)
    {
       map[i] = 1;
    }

    for (int i = MapLength - MapWidth; i < MapLength; i++)
    {
       map[i] = 1;
    }

    map[8 * MapWidth + 8] = BlockId.OakDoorLowerBlock;
    map[7 * MapWidth + 8] = BlockId.OakDoorUpperBlock;
    map[9 * MapWidth + 8] = BlockId.StoneBlock;
    map[9 * MapWidth + 7] = BlockId.StoneBlock;
    map[9 * MapWidth + 9] = BlockId.StoneBlock;
  }

  int getMapPos(int x, int y) {
    int mapPos = y * MapWidth + x;
    if (x < 0 || x >= MapWidth || y < 0 || y >= MapHeight || mapPos < 0 || mapPos >= MapLength)
    {
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
}
