class Map {
  byte[] map;

  public Map() {
    // Create map
    map = new byte[MapLength];

    for (int i = 0; i < MapHeight * MapWidth; i++) {
       map[i] = (byte)(BlockId.HardenedClayStainedLightBlueBlock | 0x80);
    }
    
    for (int i = 21 * MapWidth; i < 22 * MapWidth; i++) {
       map[i] = BlockId.GrassSideBlock;
    }
    
    for (int i = 22 * MapWidth; i < 24 * MapWidth; i++) {
       map[i] = BlockId.DirtBlock;
    }

    for (int i = 24 * MapWidth; i < MapLength; i++) {
       map[i] = BlockId.StoneBlock;
    }
    
    //y = 50 (Top of first floor/Bottom of second floor)
    for (int i = 32; i < 64; i++) {
      map[50 * MapWidth + i] = BlockId.StoneBrickBlock;
    }
    map[50 * MapWidth + 42] = BlockId.StoneBrickMossyBlock;
    map[50 * MapWidth + 43] = BlockId.StoneBrickMossyBlock;
    map[50 * MapWidth + 44] = BlockId.StoneBrickMossyBlock;
    
    //y = 51
    for (int i = 32; i < 64; i++) {
      map[51 * MapWidth + i] = (byte)(BlockId.StoneBlock | 0x80);
    }
    map[51 * MapWidth + 32] = BlockId.StoneBrickBlock;
    map[51 * MapWidth + 42] = (byte)(BlockId.StoneVineBlock | 0x80);
    map[51 * MapWidth + 43] = (byte)(BlockId.StoneVineBlock | 0x80);
    map[51 * MapWidth + 44] = BlockId.StoneBrickMossyBlock;
    map[51 * MapWidth + 63] = BlockId.StoneBrickBlock;
    
    //y = 52
    for (int i = 32; i < 64; i++) {
      map[52 * MapWidth + i] = (byte)(BlockId.StoneBlock | 0x80);
    }
    map[52 * MapWidth + 32] = BlockId.StoneBrickBlock;
    map[52 * MapWidth + 41] = (byte)(BlockId.StoneVineBlock | 0x80);
    map[52 * MapWidth + 42] = (byte)(BlockId.StoneVineBlock | 0x80);
    map[52 * MapWidth + 43] = (byte)(BlockId.StoneVineBlock | 0x80);
    map[52 * MapWidth + 44] = BlockId.StoneBrickMossyBlock;
    map[52 * MapWidth + 63] = BlockId.StoneBrickBlock;
    
    //y = 53
    for (int i = 32; i < 64; i++) {
      map[53 * MapWidth + i] = (byte)(BlockId.StoneBlock | 0x80);
    }
    map[53 * MapWidth + 32] = BlockId.StoneBrickBlock;
    map[53 * MapWidth + 41] = (byte)(BlockId.StoneVineBlock | 0x80);
    map[53 * MapWidth + 42] = (byte)(BlockId.StoneVineBlock | 0x80);
    map[53 * MapWidth + 43] = (byte)(BlockId.StoneVineBlock | 0x80);
    map[53 * MapWidth + 44] = BlockId.StoneBrickMossyBlock;
    map[53 * MapWidth + 61] = (byte)(BlockId.RepeaterOffBlock | 0x80);
    map[53 * MapWidth + 62] = (byte)(BlockId.StoneBlock | 0x80);
    map[53 * MapWidth + 63] = BlockId.DoorUpperBlock;
    
    //y = 54
    for (int i = 32; i < 64; i++) {
      map[54 * MapWidth + i] = (byte)(BlockId.StoneBlock | 0x80);
    }
    map[54 * MapWidth + 32] = BlockId.StoneBrickBlock;
    map[54 * MapWidth + 33] = BlockId.ChestBlock;
    map[54 * MapWidth + 42] = (byte)(BlockId.StoneVineBlock | 0x80);
    map[54 * MapWidth + 43] = (byte)(BlockId.StoneVineBlock | 0x80);
    map[54 * MapWidth + 44] = BlockId.StoneBrickMossyBlock;
    map[54 * MapWidth + 53] = BlockId.StoneBrickBlock;
    map[54 * MapWidth + 56] = BlockId.StoneBrickBlock;
    map[54 * MapWidth + 59] = BlockId.StoneBrickBlock;
    map[54 * MapWidth + 63] = BlockId.DoorLowerBlock;
    
    //y = 55 (Bottom first floor)
    for (int i = 32; i < 64; i++) {
      map[55 * MapWidth + i] = BlockId.StoneBrickBlock;
    }
    map[55 * MapWidth + 37] = (byte)(BlockId.StoneBlock | 0x80);
    map[55 * MapWidth + 38] = (byte)(BlockId.StoneBlock | 0x80);
    map[55 * MapWidth + 44] = BlockId.StoneBrickMossyBlock;
    map[55 * MapWidth + 45] = BlockId.StoneBrickMossyBlock;
    map[55 * MapWidth + 47] = BlockId.LapisBlock;
    map[55 * MapWidth + 48] = BlockId.LapisBlock;
    map[55 * MapWidth + 49] = BlockId.LapisBlock;
    map[55 * MapWidth + 54] = (byte)(BlockId.StoneBlock | 0x80);
    map[55 * MapWidth + 55] = (byte)(BlockId.StoneBlock | 0x80);
    map[55 * MapWidth + 57] = (byte)(BlockId.StoneBlock | 0x80);
    map[55 * MapWidth + 58] = (byte)(BlockId.StoneBlock | 0x80);
    
    //y = 56 (Lava first layer)
    map[56 * MapWidth + 36] = BlockId.StoneBrickBlock;
    map[56 * MapWidth + 37] = (byte)(BlockId.StoneBlock | 0x80);
    map[56 * MapWidth + 38] = (byte)(BlockId.StoneBlock | 0x80);
    map[56 * MapWidth + 39] = BlockId.StoneBrickBlock;
    map[56 * MapWidth + 53] = BlockId.StoneBrickBlock;
    map[56 * MapWidth + 54] = BlockId.LavaBlock;
    map[56 * MapWidth + 55] = BlockId.LavaBlock;
    map[56 * MapWidth + 56] = BlockId.StoneBrickBlock;
    map[56 * MapWidth + 57] = BlockId.LavaBlock;
    map[56 * MapWidth + 58] = BlockId.LavaBlock;
    map[56 * MapWidth + 59] = BlockId.StoneBrickBlock;
    
    //y = 57 (Lava second layer)
    map[57 * MapWidth + 36] = BlockId.StoneBrickBlock;
    map[57 * MapWidth + 37] = BlockId.LavaBlock;
    map[57 * MapWidth + 38] = BlockId.LavaBlock;
    map[57 * MapWidth + 39] = BlockId.StoneBrickBlock;
    for (int i = 53; i <= 59; i++) {
      map[57 * MapWidth + i] = BlockId.StoneBrickBlock;
    }
    
    //y= 58
    for (int i = 36; i <= 39; i++) {
      map[58 * MapWidth + i] = BlockId.StoneBrickBlock;
    }
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
