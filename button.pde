final static int BorderWidth = 4;

class Button {
  public Button(int x, int y, int bWidth, int bHeight, String text) {
    X = x;
    Y = y;
    Heigth = bHeight;
    Width = bWidth;
    Text = text;
  }
  
  public int X;
  public int Y;
  public int Heigth;
  public int Width;
  public String Text;
  
  public void draw() {
    fill(0, 0, 0);
    rect(X, Y, Width, Heigth);
    
    fill(150, 150, 150);
    rect(X + BorderWidth, Y + BorderWidth, Width - BorderWidth * 2, Heigth - BorderWidth * 2);
    
    fill(180, 180, 180);
    rect(X + BorderWidth, Y + BorderWidth, Width - BorderWidth * 2, BorderWidth);
    rect(X + BorderWidth, Y + BorderWidth, BorderWidth, Heigth - BorderWidth * 2);
    
    fill(70, 70, 70);
    rect(X + BorderWidth, Y + Heigth - BorderWidth * 2, Width - BorderWidth * 2, BorderWidth);
    rect(X + Width - BorderWidth * 2, Y + BorderWidth, BorderWidth, Heigth - BorderWidth * 2);
    
    boolean mouseHover = mouseX > X && mouseX < X + Width && mouseY > Y && mouseY < Y + Heigth;
    if (mouseHover) {
      fill(120, 125, 230, 100);
      rect(X + BorderWidth, Y + BorderWidth, Width - BorderWidth * 2, Heigth - BorderWidth * 2);
    }
    
    // Draw text
    textSize(Heigth - BorderWidth * BorderWidth);
    
    // Draw text shadow
    fill(70, 70, 70);
    text(Text, X + BorderWidth * BorderWidth, Y + Heigth / 1.25);
    
    if (mouseHover) {
      fill(225, 225, 110);
    } else {
      fill(225, 225, 225);
    }

    text(Text, X + BorderWidth * BorderWidth - BorderWidth, Y + Heigth / 1.25 - BorderWidth);
  }
}
