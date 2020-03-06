void mouseClicked() {
  if (menu != null) {
    menu.mouseClicked();
    return;
  }
  
  int relMouseX = mouseX - widthCenter;
  int relMouseY = mouseY - heightCenter;
  if (dist(0, 0, relMouseX, relMouseY) <= UseDistance) {
    int blockX = (player.PosX + relMouseX) / BlockHeight;
    int blockY = (player.PosY + relMouseY) / BlockHeight;
    player.use(blockX, blockY);
  }
}
