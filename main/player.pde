public class Player {
  public Player(int posX, int posY) {
    PosX = posX;
    PosY = posY;

    Inventory = new byte[PlayerInventorySize];
    LastItem = 0;
    
    inventoryGraphic = createGraphics(PlayerInventorySize * InventoryHeight, InventoryHeight, UseOpenGL ? P2D : JAVA2D);
    inventoryGraphic.noSmooth();
    inventoryGraphic.beginDraw();
    inventoryGraphic.noStroke();
    
    inventoryGraphic.fill(150, 150, 150);
    for (int i = 0; i < PlayerInventorySize * InventoryHeight; i += InventoryHeight) {
      inventoryGraphic.rect(i, 0, BorderWidth, InventoryHeight);
      inventoryGraphic.rect((i + InventoryHeight) - BorderWidth, 0, BorderWidth, InventoryHeight);
    }
    
    inventoryGraphic.rect(0, 0, PlayerInventorySize * InventoryHeight, BorderWidth);
    inventoryGraphic.rect(0, InventoryHeight - BorderWidth, PlayerInventorySize * InventoryHeight, BorderWidth);
    
    inventoryGraphic.fill(70, 70, 70);
    for (int i = 0; i < PlayerInventorySize * InventoryHeight; i += InventoryHeight) {
      inventoryGraphic.rect(i + HalfBorderWidth, 0, HalfBorderWidth, InventoryHeight);
      inventoryGraphic.rect((i + InventoryHeight) - BorderWidth, 0, HalfBorderWidth, InventoryHeight);
    }
    
    inventoryGraphic.rect(0, HalfBorderWidth, PlayerInventorySize * InventoryHeight, HalfBorderWidth);
    inventoryGraphic.rect(0, InventoryHeight - BorderWidth, PlayerInventorySize * InventoryHeight, HalfBorderWidth);

    inventoryGraphic.endDraw();
  }
  

  public int PosX;
  public int PosY;
  
  public byte[] Inventory;
  public int LastItem;
  
  PGraphics inventoryGraphic;

  Running running = Running.No;
  /// Previous running state
  Running pRunning = Running.No;

  
  int framesJumping = -1;

  // Jump length in frames
  final int jumpLength = 15;
  final int jumpCooldown = 30;

  public void draw() {
    switch (running)
    {
      case Left:
        if ((map.getBlockInfo((player.PosX - 1) / BlockHeight, player.PosY / BlockHeight) & 0x80) != 0x80
          || (map.getBlockInfo((player.PosX - 1) / BlockHeight, player.PosY / BlockHeight + 1) & 0x80) != 0x80
          || (map.getBlockInfo((player.PosX - 1) / BlockHeight, (player.PosY - 1) / BlockHeight + 2) & 0x80) != 0x80)
        {
          break;
        }
      
        PosX -= 2;
        break;
      case Right:
        if ((map.getBlockInfo(player.PosX / BlockHeight + 1, player.PosY / BlockHeight) & 0x80) != 0x80
          || (map.getBlockInfo(player.PosX / BlockHeight + 1, player.PosY / BlockHeight + 1) & 0x80) != 0x80
          || (map.getBlockInfo(player.PosX / BlockHeight + 1, (player.PosY - 1) / BlockHeight + 2) & 0x80) != 0x80)
        {
          break;
        }
        
        PosX += 2;
        
        break;
      case No:
        break;
    }

    if (framesJumping == jumpCooldown) {
      framesJumping = -1;
    } else if (framesJumping != -1) {
      framesJumping++;
    }

    if (isJumping()) {
      if ((map.getBlockInfo(player.PosX / BlockHeight, (player.PosY - 1) / BlockHeight) & 0x80) == 0x80
        && (map.getBlockInfo((player.PosX - 1) / BlockHeight + 1, (player.PosY - 1) / BlockHeight) & 0x80) == 0x80)
      {
        byte blockInfo = map.getBlockInfo(player.PosX / BlockHeight, player.PosY / BlockHeight - 1);
        if ((blockInfo & 0x80) != 0x80)
        {
          int rem = player.PosY % BlockHeight;
          PosY -= rem >= 4 || rem == 0 ? 4 : rem;
        } else {
          PosY -= 4;
        }
      }
    } else {
      if ((map.getBlockInfo(player.PosX / BlockHeight, player.PosY / BlockHeight + 2) & 0x80) == 0x80
        && (map.getBlockInfo((player.PosX - 1) / BlockHeight + 1, player.PosY / BlockHeight + 2) & 0x80) == 0x80)
      {
        byte blockInfo = map.getBlockInfo(player.PosX / BlockHeight, player.PosY / BlockHeight + 3);
        if ((blockInfo & 0x80) != 0x80)
        {
          int rem = player.PosY % BlockHeight;
          PosY += rem >= 4 || rem == 0 ? 4 : rem;
        } else {
          PosY += 4;
        }
      }
    }

    switch (running) {
      case No:
        if (pRunning == Running.No || pRunning == Running.Right) {
          image(playerTextures[framesJumping == -1 ? 0 : 2], widthCenter, heightCenter, PlayerWidth, PlayerHeigth);
        } else {
          image(playerTextures[framesJumping == -1 ? 1 : 3], widthCenter, heightCenter, PlayerWidth, PlayerHeigth);
        }

        break;
      case Right:
        image(playerTextures[framesJumping != -1 || (frameCount & 0x0f) < 8 ? 2: 0], widthCenter, heightCenter, PlayerWidth, PlayerHeigth);
        break;
      case Left:
        image(playerTextures[framesJumping != -1 || (frameCount & 0x0f) < 8 ? 3: 1], widthCenter, heightCenter, PlayerWidth, PlayerHeigth);
        break;
    }

    int invX = widthCenter - (PlayerInventorySize * InventoryHeight) / 2;
    fill(100, 100, 100, 75);
    rect(invX, height - InventoryHeight - BorderWidth, PlayerInventorySize * InventoryHeight, InventoryHeight);
    image(inventoryGraphic, invX, height - InventoryHeight - BorderWidth);
    for (int i = 0; i < player.LastItem; i++) {
      image(textures[player.Inventory[i]], invX + BorderWidth + i * InventoryHeight, height - InventoryHeight, BlockHeight * 2, BlockHeight * 2);
    }
  }

  public boolean isJumping() {
    return framesJumping != -1 && framesJumping <= jumpLength;
  }

  public void jump() {
    if (framesJumping == -1) {
      framesJumping = 0;
    }
  }

  public void setRunning(Running newRunning) {
    pRunning = running;
    running = newRunning;
  }
  
  public void use(int x, int y) {
    BlockEntity blockEntity = blockEntities.get(y * MapWidth + x);
    if (blockEntity == null) {
      return; 
    }
    
    blockEntity.use(x, y, this);
  }
  
  public boolean addToInventory(byte id) {
    if (LastItem < PlayerInventorySize) {
      Inventory[LastItem++] = id;
      return true;
    }
    
    return false;
  }
}

enum Running {
  No,
  Right,
  Left
}
