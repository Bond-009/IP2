class Map {
  byte[] map;

  public Map() {
    // Create map
    map = new byte[MapLength];
    for (int i = 0 * MapWidth; i < 45 * MapWidth; i++) {
       map[i] = (byte)0x80;
    }
    
    for (int i = 45 * MapWidth; i < 46 * MapWidth; i++) {
       map[i] = BlockId.GrassSideBlock;
    }

    for (int i = 46 * MapWidth; i < 48 * MapWidth; i++) {
       map[i] = BlockId.DirtBlock;
    }

    for (int i = 48 * MapWidth; i < MapLength; i++) {
       map[i] = BlockId.StoneBlock;
    }

    // mario ending
      // tree
      map[39 * MapWidth + 68] = (byte)(BlockId.LeavesSpruceBlock | 0x80);
      for (int i = 67; i <= 69; i++) {
        map[40 * MapWidth + i] = (byte)(BlockId.LeavesSpruceBlock | 0x80);
      }
      for (int i = 66; i <= 70; i++) {
        map[41 * MapWidth + i] = (byte)(BlockId.LeavesSpruceBlock | 0x80);
      }
      map[42 * MapWidth + 68] = (byte)(BlockId.LogOakVerBlock | 0x80);
      map[43 * MapWidth + 68] = (byte)(BlockId.LogOakVerBlock | 0x80);
      map[44 * MapWidth + 68] = (byte)(BlockId.LogOakVerBlock | 0x80);

      //stairs
      map[40 * MapWidth + 78] = BlockId.BrickBlock;
      for (int i = 77; i <= 78; i++) {
        map[41 * MapWidth + i] = BlockId.BrickBlock;
      }
      for (int i = 76; i <= 78; i++) {
        map[42 * MapWidth + i] = BlockId.BrickBlock;
      }
      for (int i = 75; i <= 78; i++) {
        map[43 * MapWidth + i] = BlockId.BrickBlock;
      }
      for (int i = 74; i <= 78; i++) {
        map[44 * MapWidth + i] = BlockId.BrickBlock;
      }

      // flag
      map[34 * MapWidth + 82] = (byte)(BlockId.LogOakStrippedBlock | 0x80);
      map[34 * MapWidth + 83] = (byte)(BlockId.WoolColoredRedBlock | 0x80);
      map[35 * MapWidth + 82] = (byte)(BlockId.LogOakStrippedBlock | 0x80);
      map[35 * MapWidth + 83] = (byte)(BlockId.WoolColoredRedBlock | 0x80);
      map[35 * MapWidth + 84] = (byte)(BlockId.WoolColoredRedBlock | 0x80);
      map[35 * MapWidth + 85] = (byte)(BlockId.WoolColoredRedBlock | 0x80);
      map[36 * MapWidth + 82] = (byte)(BlockId.LogOakStrippedBlock | 0x80);
      map[36 * MapWidth + 83] = (byte)(BlockId.WoolColoredRedBlock | 0x80);
      map[36 * MapWidth + 84] = (byte)(BlockId.WoolColoredRedBlock | 0x80);
      map[36 * MapWidth + 86] = (byte)(BlockId.WoolColoredRedBlock | 0x80);
      map[37 * MapWidth + 82] = (byte)(BlockId.LogOakStrippedBlock | 0x80);
      map[37 * MapWidth + 83] = (byte)(BlockId.WoolColoredRedBlock | 0x80);
      map[38 * MapWidth + 82] = (byte)(BlockId.LogOakStrippedBlock | 0x80);
      map[39 * MapWidth + 82] = (byte)(BlockId.LogOakStrippedBlock | 0x80);
      map[40 * MapWidth + 82] = (byte)(BlockId.LogOakStrippedBlock | 0x80);
      map[41 * MapWidth + 82] = (byte)(BlockId.LogOakStrippedBlock | 0x80);
      map[42 * MapWidth + 82] = (byte)(BlockId.LogOakStrippedBlock | 0x80);
      for (int i = 81; i <= 83; i++) {
        map[43 * MapWidth + i] = BlockId.HardenedClayStainedLimeBlock;
      }
      map[44 * MapWidth + 82] = BlockId.HardenedClayStainedLimeBlock;

      // fort
      map[40 * MapWidth + 86] = (byte)(BlockId.StoneBrickBlock | 0x80);
      map[40 * MapWidth + 88] = (byte)(BlockId.StoneBrickBlock | 0x80);
      map[40 * MapWidth + 90] = (byte)(BlockId.StoneBrickBlock | 0x80);
      map[40 * MapWidth + 92] = (byte)(BlockId.StoneBrickBlock | 0x80);
      for (int i = 87; i <= 91; i++) {
        map[41 * MapWidth + i] = (byte)(BlockId.StoneBrickBlock | 0x80);
      }
      for (int i = 87; i <= 91; i++) {
        map[42 * MapWidth + i] = (byte)(BlockId.StoneBrickBlock | 0x80);
      }
      for (int i = 87; i <= 91; i++) {
        map[43 * MapWidth + i] = (byte)(BlockId.StoneBrickBlock | 0x80);
      }
      map[43 * MapWidth + 89] = BlockId.DoorUpperBlock;
      for (int i = 87; i <= 91; i++) {
        map[44 * MapWidth + i] = (byte)(BlockId.StoneBrickBlock | 0x80);
      }
      map[44 * MapWidth + 89] = BlockId.DoorLowerBlock;

    // y = 35
    for (int i = 35; i <= 60; i++) {
      map[35 * MapWidth + i] = BlockId.MushroomSkinRedBlock;
    }

    // y = 36
    for (int i = 33; i <= 62; i++) {
      map[36 * MapWidth + i] = BlockId.MushroomSkinRedBlock;
    }

    // y = 37
    for (int i = 32; i <= 63; i++) {
      map[37 * MapWidth + i] = BlockId.MushroomSkinRedBlock;
    }

    // y = 38
    for (int i = 31; i <= 64; i++) {
      map[38 * MapWidth + i] = BlockId.MushroomSkinRedBlock;
    }

    // y = 39
    for (int i = 31; i <= 64; i++) {
      map[39 * MapWidth + i] = BlockId.MushroomSkinRedBlock;
    }

    // y = 40 (roof third floor)
    for (int i = 33; i <= 62; i++) {
      map[40 * MapWidth + i] = BlockId.MushroomSkinStemBlock;
    }
    map[40 * MapWidth + 32] = BlockId.MushroomSkinRedBlock;
    map[40 * MapWidth + 31] = BlockId.MushroomSkinRedBlock;
    map[40 * MapWidth + 63] = BlockId.MushroomSkinRedBlock;
    map[40 * MapWidth + 64] = BlockId.MushroomSkinRedBlock;

    // y = 41
    for (int i = 32; i <= 63; i++) {
      map[41 * MapWidth + i] = (byte)(BlockId.PlanksOakBlock | 0x80);
    }
    for (int i = 41; i <= 46; i++) {
      map[41 * MapWidth + i] = (byte)(BlockId.LogOakHorBlock | 0x80);
    }
    map[41 * MapWidth + 32] = BlockId.MushroomSkinStemBlock;
    map[41 * MapWidth + 33] = BlockId.MushroomSkinStemBlock;
    map[41 * MapWidth + 40] = BlockId.MushroomSkinStemBlock;
    map[41 * MapWidth + 47] = BlockId.MushroomSkinStemBlock;
    map[41 * MapWidth + 48] = (byte)(BlockId.PlanksOakWebBlock | 0x80);
    map[41 * MapWidth + 49] = (byte)(BlockId.PlanksOakWebBlock | 0x80);
    map[41 * MapWidth + 62] = BlockId.MushroomSkinStemBlock;
    map[41 * MapWidth + 63] = BlockId.MushroomSkinStemBlock;

    // y = 42
    for (int i = 32; i <= 63; i++) {
      map[42 * MapWidth + i] = (byte)(BlockId.PlanksOakBlock | 0x80);
    }
    for (int i = 41; i <= 46; i++) {
      map[42 * MapWidth + i] = (byte)(BlockId.BookshelfBlock | 0x80);
    }
    map[42 * MapWidth + 32] = BlockId.MushroomSkinStemBlock;
    map[42 * MapWidth + 40] = BlockId.MushroomSkinStemBlock;
    map[42 * MapWidth + 47] = BlockId.MushroomSkinStemBlock;
    map[42 * MapWidth + 48] = (byte)(BlockId.PlanksOakWebBlock | 0x80);
    map[42 * MapWidth + 50] = (byte)(BlockId.GBlock | 0x80);
    map[42 * MapWidth + 51] = (byte)(BlockId.ABlock | 0x80);
    map[42 * MapWidth + 52] = (byte)(BlockId.MBlock | 0x80);
    map[42 * MapWidth + 53] = (byte)(BlockId.EBlock | 0x80);
    map[42 * MapWidth + 57] = (byte)(BlockId.EBlock | 0x80);
    map[42 * MapWidth + 58] = (byte)(BlockId.NBlock | 0x80);
    map[42 * MapWidth + 59] = (byte)(BlockId.DBlock | 0x80);
    map[42 * MapWidth + 63] = BlockId.MushroomSkinStemBlock;

    // y = 43
    for (int i = 32; i <= 63; i++) {
      map[43 * MapWidth + i] = (byte)(BlockId.PlanksOakBlock | 0x80);
    }
    for (int i = 41; i <= 46; i++) {
      map[43 * MapWidth + i] = (byte)(BlockId.BookshelfBlock | 0x80);
    }
    map[43 * MapWidth + 32] = BlockId.MushroomSkinStemBlock;
    map[43 * MapWidth + 33] = (byte)(BlockId.PortalBlock | 0x80);
    map[43 * MapWidth + 36] = (byte)(BlockId.VaultBlock | 0x80);
    map[43 * MapWidth + 40] = BlockId.DoorUpperBlock;
    map[43 * MapWidth + 47] = BlockId.MushroomSkinStemBlock;
    map[43 * MapWidth + 50] = (byte)(BlockId.OBlock | 0x80);
    map[43 * MapWidth + 51] = (byte)(BlockId.VBlock | 0x80);
    map[43 * MapWidth + 52] = (byte)(BlockId.EBlock | 0x80);
    map[43 * MapWidth + 53] = (byte)(BlockId.RBlock | 0x80);
    map[43 * MapWidth + 58] = (byte)(BlockId.ArrowBlock | 0x80);
    map[43 * MapWidth + 63] = BlockId.DoorUpperBlock;

    // y = 44
    for (int i = 32; i <= 63; i++) {
      map[44 * MapWidth + i] = (byte)(BlockId.PlanksOakBlock | 0x80);
    }
    for (int i = 41; i <= 46; i++) {
      map[44 * MapWidth + i] = (byte)(BlockId.LogOakHorBlock | 0x80);
    }
    map[44 * MapWidth + 32] = BlockId.MushroomSkinStemBlock;
    map[44 * MapWidth + 33] = (byte)(BlockId.PortalBlock | 0x80);
    map[44 * MapWidth + 40] = BlockId.DoorLowerBlock;
    map[44 * MapWidth + 47] = BlockId.MushroomSkinStemBlock;
    map[44 * MapWidth + 63] = BlockId.DoorLowerBlock;

    // y = 45 (Top second floor/Bottom third floor
    for (int i = 32; i <= 63; i++) {
      map[45 * MapWidth + i] = BlockId.StoneBrickBlock;
    }

    // y = 46
    for (int i = 32; i < 64; i++) {
      map[46 * MapWidth + i] = (byte)(BlockId.StoneBlock | 0x80);
    }
    map[46 * MapWidth + 32] = BlockId.StoneBrickBlock;
    map[46 * MapWidth + 33] = (byte)(BlockId.StoneWebBlock | 0x80);
    map[46 * MapWidth + 37] = (byte)(BlockId.StoneTorchBlock | 0x80);
    map[46 * MapWidth + 46] = (byte)(BlockId.StoneWebBlock | 0x80);
    map[46 * MapWidth + 48] = (byte)(BlockId.StoneWebBlock | 0x80);
    map[46 * MapWidth + 49] = (byte)(BlockId.StoneWebBlock | 0x80);
    map[46 * MapWidth + 53] = (byte)(BlockId.StoneButtonBlock | 0x80);
    map[46 * MapWidth + 54] = (byte)(BlockId.StoneButtonBlock | 0x80);
    map[46 * MapWidth + 55] = (byte)(BlockId.StoneButtonBlock | 0x80);
    map[46 * MapWidth + 63] = BlockId.StoneBrickBlock;

    // y = 47
    for (int i = 32; i < 64; i++) {
      map[47 * MapWidth + i] = (byte)(BlockId.StoneBlock | 0x80);
    }
    map[47 * MapWidth + 32] = BlockId.StoneBrickBlock;
    for (int i = 63; i <= 65; i++) {
      map[47 * MapWidth + i] = BlockId.StoneBrickBlock;
    }

    map[47 * MapWidth + 33] = (byte)(BlockId.StoneWebBlock | 0x80);
    map[47 * MapWidth + 34] = (byte)(BlockId.StoneWebBlock | 0x80);
    map[47 * MapWidth + 48] = (byte)(BlockId.StoneWebBlock | 0x80);
    map[47 * MapWidth + 51] = (byte)(BlockId.StoneButtonBlock | 0x80);
    map[47 * MapWidth + 52] = (byte)(BlockId.StoneButtonBlock | 0x80);
    map[47 * MapWidth + 54] = (byte)(BlockId.StoneButtonBlock | 0x80);
    map[47 * MapWidth + 56] = (byte)(BlockId.StoneButtonBlock | 0x80);
    map[47 * MapWidth + 57] = (byte)(BlockId.StoneButtonBlock | 0x80);

    // y = 48
    for (int i = 32; i < 64; i++) {
      map[48 * MapWidth + i] = (byte)(BlockId.StoneBlock | 0x80);
    }

    map[48 * MapWidth + 32] = BlockId.StoneBrickBlock;
    map[48 * MapWidth + 43] = (byte)(BlockId.StoneTorchBlock | 0x80);
    map[48 * MapWidth + 53] = (byte)(BlockId.StoneButtonBlock | 0x80);
    map[48 * MapWidth + 55] = (byte)(BlockId.StoneButtonBlock | 0x80);
    map[48 * MapWidth + 56] = (byte)(BlockId.StoneButtonBlock | 0x80);
    map[48 * MapWidth + 59] = (byte)(BlockId.BarrelBlock | 0x80);
    map[48 * MapWidth + 63] = (byte)(BlockId.DoorUpperBlock | 0x80);
    map[48 * MapWidth + 64] = (byte)(BlockId.PortalBlock | 0x80);
    map[48 * MapWidth + 65] = BlockId.StoneBrickBlock;

    // y = 49
    for (int i = 32; i < 64; i++) {
      map[49 * MapWidth + i] = (byte)(BlockId.StoneBlock | 0x80);
    }

    map[49 * MapWidth + 32] = BlockId.StoneBrickBlock;
    map[49 * MapWidth + 52] = (byte)(BlockId.BarrelBlock | 0x80);
    map[49 * MapWidth + 58] = (byte)(BlockId.BarrelBlock | 0x80);
    map[49 * MapWidth + 59] = (byte)(BlockId.BarrelBlock | 0x80);
    map[49 * MapWidth + 60] = (byte)(BlockId.BarrelBlock | 0x80);
    map[49 * MapWidth + 63] = (byte)(BlockId.DoorLowerBlock | 0x80);
    map[49 * MapWidth + 64] = (byte)(BlockId.PortalBlock | 0x80);
    map[49 * MapWidth + 65] = BlockId.StoneBrickBlock;

    // walkthrough wall
    map[46 * MapWidth + 47] = BlockId.StoneBrickBlock;
    map[47 * MapWidth + 47] = BlockId.StoneBrickBlock;
    map[48 * MapWidth + 47] = (byte)(BlockId.StoneBrickBleachedBlock | 0x80);
    map[49 * MapWidth + 47] = (byte)(BlockId.StoneBrickBleachedBlock | 0x80);

    // y = 50 (Top of first floor/Bottom of second floor)
    for (int i = 32; i <= 44; i++) {
      map[50 * MapWidth + i] = (byte)(BlockId.StoneBlock | 0x80);
    }
    for (int i = 44; i <= 65; i++) {
      map[50 * MapWidth + i] = BlockId.StoneBrickBlock;
    }

    map[50 * MapWidth + 32] = BlockId.StoneBrickBlock;
    map[50 * MapWidth + 43] = BlockId.StoneBrickMossyBlock;
    map[50 * MapWidth + 44] = BlockId.StoneBrickMossyBlock;

    // portal area
    map[48 * MapWidth + 33] = BlockId.StoneBrickBlock;
    map[48 * MapWidth + 34] = BlockId.StoneBrickBlock;
    map[48 * MapWidth + 36] = BlockId.StoneBrickBlock;
    map[48 * MapWidth + 37] = BlockId.StoneBrickBlock;
    map[48 * MapWidth + 38] = BlockId.StoneBrickBlock;
    map[49 * MapWidth + 33] = (byte)(BlockId.PortalBlock | 0x80);
    map[49 * MapWidth + 37] = (byte)(BlockId.PortalBlock | 0x80);
    map[49 * MapWidth + 38] = BlockId.StoneBrickBlock;
    map[49 * MapWidth + 39] = BlockId.StoneDarkenedBlock;
    map[49 * MapWidth + 40] = BlockId.StoneDarkenedBlock;
    map[50 * MapWidth + 33] = (byte)(BlockId.PortalBlock | 0x80);
    map[50 * MapWidth + 37] = (byte)(BlockId.PortalBlock | 0x80);
    map[50 * MapWidth + 38] = BlockId.StoneBrickBlock;
    map[50 * MapWidth + 41] = BlockId.StoneDarkenedBlock;
    map[50 * MapWidth + 42] = BlockId.StoneDarkenedBlock;

    // y = 51
    for (int i = 44; i < 64; i++) {
      map[51 * MapWidth + i] = (byte)(BlockId.StoneBlock | 0x80);
    }
    for (int i = 32; i <= 44; i++) {
      map[51 * MapWidth + i] = BlockId.StoneBrickBlock;
    }

    map[51 * MapWidth + 32] = BlockId.StoneBrickBlock;
    map[51 * MapWidth + 42] = BlockId.StoneBrickMossyBlock;
    map[51 * MapWidth + 43] = BlockId.StoneBrickMossyBlock;
    map[51 * MapWidth + 44] = BlockId.StoneBrickMossyBlock;
    map[51 * MapWidth + 63] = BlockId.StoneBrickBlock;

    // y = 52
    for (int i = 32; i < 64; i++) {
      map[52 * MapWidth + i] = (byte)(BlockId.StoneBlock | 0x80);
    }

    map[52 * MapWidth + 32] = BlockId.StoneBrickBlock;
    map[52 * MapWidth + 42] = (byte)(BlockId.StoneVineBlock | 0x80);
    map[52 * MapWidth + 43] = (byte)(BlockId.StoneVineBlock | 0x80);
    map[52 * MapWidth + 44] = BlockId.StoneBrickMossyBlock;
    for (int i = 63; i <= 65; i++) {
      map[52 * MapWidth + i] = BlockId.StoneBrickBlock;
    }

    // y = 53
    for (int i = 32; i < 64; i++) {
      map[53 * MapWidth + i] = (byte)(BlockId.StoneBlock | 0x80);
    }

    map[53 * MapWidth + 32] = BlockId.StoneBrickBlock;
    map[53 * MapWidth + 35] = (byte)(BlockId.StoneTorchBlock | 0x80);
    map[53 * MapWidth + 42] = (byte)(BlockId.StoneVineBlock | 0x80);
    map[53 * MapWidth + 43] = (byte)(BlockId.StoneVineBlock | 0x80);
    map[53 * MapWidth + 44] = BlockId.StoneBrickMossyBlock;
    map[53 * MapWidth + 46] = (byte)(BlockId.StoneTorchBlock | 0x80);
    map[53 * MapWidth + 50] = (byte)(BlockId.StoneTorchBlock | 0x80);
    map[53 * MapWidth + 61] = (byte)(BlockId.RepeaterOffBlock | 0x80);
    map[53 * MapWidth + 62] = (byte)(BlockId.StoneBlock | 0x80);
    map[53 * MapWidth + 63] = BlockId.DoorUpperBlock;
    map[53 * MapWidth + 64] = (byte)(BlockId.PortalBlock | 0x80);
    map[53 * MapWidth + 65] = BlockId.StoneBrickBlock;

    // y = 54
    for (int i = 32; i < 64; i++) {
      map[54 * MapWidth + i] = (byte)(BlockId.StoneBlock | 0x80);
    }

    map[54 * MapWidth + 32] = BlockId.StoneBrickBlock;
    map[54 * MapWidth + 33] = BlockId.ChestBlock;
    map[54 * MapWidth + 43] = (byte)(BlockId.StoneVineBlock | 0x80);
    map[54 * MapWidth + 44] = BlockId.StoneBrickMossyBlock;
    map[54 * MapWidth + 53] = BlockId.StoneBrickBlock;
    map[54 * MapWidth + 56] = BlockId.StoneBrickBlock;
    map[54 * MapWidth + 59] = BlockId.StoneBrickBlock;
    map[54 * MapWidth + 63] = BlockId.DoorLowerBlock;
    map[54 * MapWidth + 64] = (byte)(BlockId.PortalBlock | 0x80);
    map[54 * MapWidth + 65] = BlockId.StoneBrickBlock;

    // y = 55 (Bottom first floor)
    for (int i = 32; i <= 65; i++) {
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

    // y = 56 (Lava first layer)
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

    // y = 57 (Lava second layer)
    map[57 * MapWidth + 36] = BlockId.StoneBrickBlock;
    map[57 * MapWidth + 37] = BlockId.LavaBlock;
    map[57 * MapWidth + 38] = BlockId.LavaBlock;
    map[57 * MapWidth + 39] = BlockId.StoneBrickBlock;
    for (int i = 53; i <= 59; i++) {
      map[57 * MapWidth + i] = BlockId.StoneBrickBlock;
    }

    // y= 58
    for (int i = 36; i <= 39; i++) {
      map[58 * MapWidth + i] = BlockId.StoneBrickBlock;
    }

    // Block Entities
    ChestBlockEntity chest1 = new ChestBlockEntity(BlockId.CopperKey);
    blockEntities.put(54 * MapWidth + 33, chest1);
    
    ChestBlockEntity chest2 = new ChestBlockEntity(BlockId.SilverKey);
    blockEntities.put(49 * MapWidth + 58, chest2);
    
    LockedChestBlockEntity lockedChest = new LockedChestBlockEntity(BlockId.SilverKey, BlockId.GoldenKey);
    blockEntities.put(43 * MapWidth + 36, lockedChest);
    
    RepeaterBlockEntity repeater = new RepeaterBlockEntity(new Runnable() {
      public void run() {
        map[52 * MapWidth + 44] = (byte)(BlockId.StoneBrickMossyBlock | 0x80);
        map[53 * MapWidth + 44] = (byte)(BlockId.StoneBrickMossyBlock | 0x80);
        map[54 * MapWidth + 44] = (byte)(BlockId.StoneBrickMossyBlock | 0x80);
      }
    });
    blockEntities.put(53 * MapWidth + 61, repeater);
    
    HiddenSwitchBlockEntity hiddenSwitch = new HiddenSwitchBlockEntity(new Runnable() {
      public void run() {
        map[41 * MapWidth + 47] = (byte)(BlockId.MushroomSkinStemBlock | 0x80);
        map[42 * MapWidth + 47] = (byte)(BlockId.MushroomSkinStemBlock | 0x80);
        map[43 * MapWidth + 47] = (byte)(BlockId.MushroomSkinStemBlock | 0x80);
        map[44 * MapWidth + 47] = (byte)(BlockId.MushroomSkinStemBlock | 0x80);
      }
    });
    blockEntities.put(43 * MapWidth + 44, hiddenSwitch);
    
    HiddenSwitchBlockEntity hiddenKillSwitch = new HiddenSwitchBlockEntity(new Runnable() {
      public void run() {
        exit();
      }
    });
    blockEntities.put(44 * MapWidth + 89, hiddenKillSwitch);
    blockEntities.put(43 * MapWidth + 89, hiddenKillSwitch);
    
    DoorBlockEntity door = new DoorBlockEntity();
    blockEntities.put(44 * MapWidth + 63, door);
    blockEntities.put(43 * MapWidth + 63, door);

    LockedDoorBlockEntity lockedDoor1 = new LockedDoorBlockEntity(BlockId.CopperKey);
    blockEntities.put(54 * MapWidth + 63, lockedDoor1);
    blockEntities.put(53 * MapWidth + 63, lockedDoor1);

    LockedDoorBlockEntity lockedDoor2 = new LockedDoorBlockEntity(BlockId.GoldenKey);
    blockEntities.put(43 * MapWidth + 40, lockedDoor2);
    blockEntities.put(44 * MapWidth + 40, lockedDoor2);
    
    PortalBlockEntity portal1 = new PortalBlockEntity(64, 48);
    blockEntities.put(54 * MapWidth + 64, portal1);
    blockEntities.put(53 * MapWidth + 64, portal1);
    
    PortalBlockEntity portal2Lower = new PortalBlockEntity(64, 53);
    blockEntities.put(49 * MapWidth + 64, portal2Lower);
    PortalBlockEntity portal2Upper = new PortalBlockEntity(64, 53);
    blockEntities.put(48 * MapWidth + 64, portal2Upper);
    
    PortalBlockEntity portal3Lower = new PortalBlockEntity(48, 53);
    blockEntities.put(50 * MapWidth + 37, portal3Lower);
    PortalBlockEntity portal3Upper = new PortalBlockEntity(48, 53);
    blockEntities.put(49 * MapWidth + 37, portal3Upper);
    
    PortalBlockEntity portal4Lower = new PortalBlockEntity(33, 43);
    blockEntities.put(50 * MapWidth + 33, portal4Lower);
    PortalBlockEntity portal4Upper = new PortalBlockEntity(33, 43);
    blockEntities.put(49 * MapWidth + 33, portal4Upper);
    
    PortalBlockEntity portal5Lower = new PortalBlockEntity(33, 49);
    blockEntities.put(44 * MapWidth + 33, portal5Lower);
    PortalBlockEntity portal5Upper = new PortalBlockEntity(33, 49);
    blockEntities.put(43 * MapWidth + 33, portal5Upper);
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
