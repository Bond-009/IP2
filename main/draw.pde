void draw() {
  if (menu != null) {
    cursor(ARROW);
    menu.draw();
  } else {
    drawGame();
  }

  // Draw FPS indicator
  if (DrawFPS) {
    // Don't write over previous FPS
    if (menu != null) {
      fill(0);
      rect(width - 128, 0, 128, 32);
    }

    fill(0, 255, 0);
    textSize(32);
    text("FPS: " + floor(frameRate), width - 128, 32);
  }
}

void drawGame() {
  clear();

  int blockX = player.PosX / BlockHeight;
  int blockY = player.PosY / BlockHeight;

  // Pixel ofsetts from the center of the screen
  int pixelX = player.PosX % BlockHeight;
  int pixelY = player.PosY % BlockHeight;

  for (int x = -RenderDistance; x < RenderDistance; x++) {
    for (int y = -RenderDistance; y < RenderDistance; y++) {
      byte blockInfo = map.getBlockInfo(blockX + x, blockY + y);
      if (blockInfo == 0) {
        // Block is out of bounds, draw nothing
        // println("Block out of bounds (" + (blockY + y) + ", " + (blockX + x) + ")");
        continue;
      }

      byte blockType = (byte)(blockInfo & 0x7f);
      image(textures[blockType], widthCenter - pixelX + x * BlockHeight, heightCenter - pixelY + y * BlockHeight, BlockHeight, BlockHeight);
      if ((blockInfo & 0x80) == 0x80) {
        fill(33, 33, 33, 100);
        square(widthCenter - pixelX + x * BlockHeight, heightCenter - pixelY + y * BlockHeight, BlockHeight);
      }
    }
  }

  image(vignette, 0, 0);
  
  //fill(0, 255, 0);
  //textSize(32);
  //text("Pos: (" + blockX + ", " + blockY + ")", 0, 32);

  player.draw();


  int relMouseX = mouseX - widthCenter;
  int relMouseY = mouseY - heightCenter;
  if (dist(0, 0, relMouseX, relMouseY) <= UseDistance) {
    byte blockId = map.getBlockId((player.PosX + relMouseX) / BlockHeight, (player.PosY + relMouseY) / BlockHeight);
    if (BlockId.isUsable(blockId)) {
      cursor(HAND);
    }
    else {
      cursor(CROSS);
    }
  }
  else {
    cursor(CROSS);
  }
}
