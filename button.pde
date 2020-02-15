final static int BorderWidth = 4;

class Button {
  public Button(int x, int y, int bWidth, int bHeight, String text) {
    X = x;
    Y = y;
    Heigth = bHeight;
    Width = bWidth;
    Text = text;
    
    graphic = createGraphics(bWidth, bHeight);
    graphic.noSmooth();
    graphic.beginDraw();
    graphic.noStroke();

    graphic.fill(0, 0, 0);
    graphic.rect(0, 0, Width, Heigth);

    graphic.fill(150, 150, 150);
    graphic.rect(BorderWidth, BorderWidth, Width - BorderWidth * 2, Heigth - BorderWidth * 2);

    graphic.fill(180, 180, 180);
    graphic.rect(BorderWidth, BorderWidth, Width - BorderWidth * 2, BorderWidth);
    graphic.rect(BorderWidth, BorderWidth, BorderWidth, Heigth - BorderWidth * 2);

    graphic.fill(70, 70, 70);
    graphic.rect(BorderWidth, Heigth - BorderWidth * 2, Width - BorderWidth * 2, BorderWidth);
    graphic.rect(Width - BorderWidth * 2, BorderWidth, BorderWidth, Heigth - BorderWidth * 2);

    graphic.endDraw();
  }
  
  public int X;
  public int Y;
  public int Heigth;
  public int Width;
  public String Text;
  PGraphics graphic;
  
  public void draw() {
    image(graphic, X, Y);
    
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
