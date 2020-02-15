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
}

class EscMenu extends Menu {
  public EscMenu() {
    super();
    
    buttons = new Button[1];
    buttons[0] = new Button(width / 2 - 128, height / 2 - 64, 265, 128, "Quit");
  }
}
