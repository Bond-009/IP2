public class Player {
  public Player(int posX, int posY) {
    PosX = posX;
    PosY = posY;

    playerTextures = new PImage[4];
    playerTextures[0] = loadImage("player_right.png");
    playerTextures[1] = loadImage("player_left.png");
    playerTextures[2] = loadImage("player_dyn_right.png");
    playerTextures[3] = loadImage("player_dyn_left.png");
  }

  public int PosX;
  public int PosY;
  Running running = Running.No;
  /// Previous running state
  Running pRunning = Running.No;

  PImage[] playerTextures;
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
}

enum Running {
    No,
    Right,
    Left
}
