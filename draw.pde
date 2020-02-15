void draw()
{
  // TODO: remove
  clear();
  
  // Player movement
  if (keyPressed) {
    if (key == 'q' || key == 'Q')
    {
      posX-=2;
    }
     
    if (key == 'd' || key == 'D') {
      posX+=2;
    }
    
    if (key == 'z' || key == 'Z') {
      posY+=2;
    }
    
    // TODO: remove, for testing only
    if (key == 's' || key == 'S') {
      posY-=2;
    }
  }
  
  // 
  int blockX = posX / BlockHeight;
  int blockY = posY / BlockHeight;
  
  // Pixel ofsetts from the center of the screen
  int pixelX = posX % BlockHeight;
  int pixelY = posY % BlockHeight;
  
  for (int x = -RenderDistance; x < RenderDistance; x++) {
    for (int y = -RenderDistance; y < RenderDistance; y++) {
      int mapPos = (blockY + y) * MapWidth + blockX + x;
      if (blockX + x < 0 || blockX + x >= MapWidth || mapPos < 0 || mapPos >= MapLength)
      {
        // Block is out of bounds, draw nothing
        // println("Block out of bounds (" + (blockY + y) + ", " + (blockX + x) + ")");
        continue;
      }
      
      byte blockInfo = map[mapPos];
      byte blockType = (byte)(blockInfo & 0x7f);
      image(textures[blockType], ScreenWidth / 2 - pixelX + x * BlockHeight, ScreenHeight / 2 + pixelY - y * BlockHeight, BlockHeight, BlockHeight);
      if ((blockInfo & 0x80) == 0x80)
      {
        fill(33, 33, 33, 100);
        square(ScreenWidth / 2 - pixelX + x * BlockHeight, ScreenHeight / 2 + pixelY - y * BlockHeight, BlockHeight);
      }
    }
  }
  
  // TODO: draw vignette
  // TODO: draw player
  
  // Draw FPS indicator
  if (DrawFPS) {
    fill(0, 255, 0);
    textSize(32);
    text("FPS: " + floor(frameRate), ScreenWidth - 128, 32);
  }
}
