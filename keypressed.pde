void keyPressed() {
  if (key == ESC) {
    // Don't exit
    key = 0;
    if (menu == null) {
      menu = new EscMenu();
    }
    else {
      menu = null;
    }
  }
  
  // Player movement
  if (menu == null) {
    if (key == 'q' || key == 'Q')
    {
      player.running = Running.Left;
    }
    
    if (key == 'd' || key == 'D') {
      player.running = Running.Right;
    }
    
    if (key == ' ') {
      player.jump();
    }
  }
}

void keyReleased() {
  // Player movement
  if (menu == null) {
    if ((key == 'q' || key == 'Q') && player.running == Running.Left)
    {
      player.running = Running.No;
    }
    
    if ((key == 'd' || key == 'D') && player.running == Running.Right) {
      player.running = Running.No;
    }
  }
}
