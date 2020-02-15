class Player {
  public Player(int posX, int posY) {
    PosX = posX;
    PosY = posY;
    texture = loadImage("player.png");
  }
  
  public int PosX;
  public int PosY;
  public Running running = Running.No;
  
  
  PImage texture;
  Running isRunning = Running.No;
  int framesJumping = -1;
  
  // Jump length in frames
  final int jumpLength = 15;
  final int jumpCooldown = 30;

  public void draw() {
    switch (running)
    {
      case Left:
        PosX -= 2;
        break;
      case Right:
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
      PosY -= 4;
    } else {
      byte blockInfo = map.getBlockInfo(player.PosX / BlockHeight, player.PosY / BlockHeight + 2);
      if ((blockInfo & 0x80) == 0x80)
      {
        blockInfo = map.getBlockInfo(player.PosX / BlockHeight, player.PosY / BlockHeight + 3);
        if ((blockInfo & 0x80) != 0x80)
        {
          int rem = player.PosY % BlockHeight;
          PosY += rem >= 4 || rem == 0 ? 4 : rem;
        } else {
          PosY +=4;
        }
      }
    }
    
    image(texture, widthCenter, heightCenter, PlayerWidth, PlayerHeigth);
  }
  
  public boolean isJumping() {
    return framesJumping != -1 && framesJumping <= jumpLength;
  }
  
  public void jump() {
    if (framesJumping == -1) {
      framesJumping = 0;
    }
  }
}

enum Running {
    No,
    Right,
    Left
}
