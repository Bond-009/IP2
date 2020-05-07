public abstract class BlockEntity {
  public abstract boolean use(int x, int y, Player player);
}

public class DoorBlockEntity extends BlockEntity {
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

public class LockedDoorBlockEntity extends DoorBlockEntity {
  public byte KeyId;
  
  public LockedDoorBlockEntity(byte keyId) {
    KeyId = keyId;
  }
  
  boolean use(int x, int y, Player player) {
    for (int i = 0; i <= player.LastItem; i++) {
      if (player.Inventory[i] == KeyId)
      {
        return super.use(x, y, player); 
      }
    }
    
    return false;
  }
}

public class RepeaterBlockEntity extends BlockEntity {
  public Runnable Func;
  
  public RepeaterBlockEntity(Runnable func) {
    Func = func;
  }
 
  boolean use(int x, int y, Player player) {
    byte info = map.getBlockInfo(x, y);
    byte blockType = (byte)(info & 0x7f);
    
    if (blockType == BlockId.RepeaterOffBlock) {
      map.setBlockInfo(x, y, (byte)(BlockId.RepeaterOnBlock | (info & 0x80)));
      Func.run();
    } else if (blockType == BlockId.RepeaterOnBlock) {
      map.setBlockInfo(x, y, (byte)(BlockId.RepeaterOffBlock | (info & 0x80)));
    } else {
      println("DEBUG: Block is not a repeater");
      return false;
    }

    return true;
  }
}

public class HiddenSwitchBlockEntity extends BlockEntity {
  public Runnable Func;
  
  public HiddenSwitchBlockEntity(Runnable func) {
    Func = func;
  }
 
  boolean use(int x, int y, Player player) {
    Func.run();

    return true;
  }
}

public class ChestBlockEntity extends BlockEntity {
  public byte ItemId;
  
  public ChestBlockEntity(byte itemId) {
    ItemId = itemId;
  }
  
  boolean use(int x, int y, Player player) {
    for (int i = 0; i < player.LastItem; i++) {
      if (player.Inventory[i] == ItemId)
      {
        return false; 
      }
    }
    
    player.Inventory[player.LastItem++] = ItemId;
    
    return false;
  }
}

public class LockedChestBlockEntity extends ChestBlockEntity {
  public byte KeyId;
  
  public LockedChestBlockEntity(byte keyId, byte itemId) {
    super(itemId);
    KeyId = keyId;
  }
  
  boolean use(int x, int y, Player player) {
    for (int i = 0; i < player.LastItem; i++) {
      if (player.Inventory[i] == KeyId)
      {
        return super.use(x, y, player); 
      }
    }
    
    return false;
  }
}

public class PortalBlockEntity extends BlockEntity {
  public int X;
  public int Y;
  
  public PortalBlockEntity(int x, int y) {
    X = x;
    Y = y;
  }
  
  boolean use(int x, int y, Player player) {
    if (abs(player.PosX - x * BlockHeight) < BlockHeight / 2)
    {
      player.PosX = X * BlockHeight;
      player.PosY = Y * BlockHeight;
    }
    
    return false;
  }
}
