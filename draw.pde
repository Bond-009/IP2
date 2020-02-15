void draw()
{
  clear();
  
  // 
  int blockX = player.PosX / BlockHeight;
  int blockY = player.PosY / BlockHeight;
  
  // Pixel ofsetts from the center of the screen
  int pixelX = player.PosX % BlockHeight;
  int pixelY = player.PosY % BlockHeight;
  
  for (int x = -RenderDistance; x < RenderDistance; x++) {
    for (int y = -RenderDistance; y < RenderDistance; y++) {
      byte blockInfo = map.getBlockInfo(blockX + x, blockY + y);
      if (blockInfo == 0)
      {
        // Block is out of bounds, draw nothing
        // println("Block out of bounds (" + (blockY + y) + ", " + (blockX + x) + ")");
        continue;
      }
      
      byte blockType = (byte)(blockInfo & 0x7f);
      image(textures[blockType], widthCenter - pixelX + x * BlockHeight, heightCenter - pixelY + y * BlockHeight, BlockHeight, BlockHeight);
      if ((blockInfo & 0x80) == 0x80)
      {
        fill(33, 33, 33, 100);
        square(widthCenter - pixelX + x * BlockHeight, heightCenter - pixelY + y * BlockHeight, BlockHeight);
      }
    }
  }
  
  fill(0, 255, 0);
  textSize(32);
  text("Pos: (" + blockX + ", " + blockY + ")", 0, 32);
  
  // TODO: draw vignette
  /*int lightDistance = RenderDistance * BlockHeight;
  for (int px = 0; px < width; px++) {
    for (int py = 0; py < height; py++) {
      if (abs(px - WidthCenter) <= lightDistance && abs(py - HeightCenter) <= lightDistance) {
        
      }
    }
  }*/
  
  player.draw();
  
  if (menu != null) {
    cursor(ARROW);
    menu.draw();
  } else {
    byte blockId = map.getBlockId((player.PosX + mouseX - widthCenter) / BlockHeight, (player.PosY - mouseY + heightCenter) / BlockHeight + 1);
    if (BlockId.isUsable(blockId))
    {
      cursor(HAND);
    }
    else {
      cursor(CROSS);
    }
  }

  // Draw FPS indicator
  if (DrawFPS) {
    fill(0, 255, 0);
    textSize(32);
    text("FPS: " + floor(frameRate), width - 128, 32);
  }
}
