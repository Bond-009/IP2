abstract class Menu {
  public  Menu() {
    fill(0, 0, 0, 150);
    rect(0, 0, width, height);
  }
  
  Button[] buttons = new Button[0];
  
  void draw() {
    int buttonsLen = buttons.length;
    for (int i = 0; i < buttonsLen; i++) {
      buttons[i].draw();
    }
  }
  
  void mouseClicked() {
    int mX = mouseX;
    int mY = mouseY;
    int buttonsLen = buttons.length;
    for (int i = 0; i < buttonsLen; i++) {
      int bX = buttons[i].X;
      int bY = buttons[i].Y;
      if (mX >= bX && mX <= bX + buttons[i].Width && mY >= bY && mY <= bY + buttons[i].Height)
      {
        buttons[i].clicked();
        break;
      }
    }
  }
}

class EscMenu extends Menu {
  public EscMenu() {
    super();
    
    buttons = new Button[1];
    buttons[0] = new QuitButton(width / 2 - 128, height / 2 - 64, 265, 128, "Quit");
  }
}
