final static int BorderWidth = 4;

abstract class Button {
  public Button(int x, int y, int bWidth, int bHeight, String text) {
    X = x;
    Y = y;
    Height = bHeight;
    Width = bWidth;
    Text = text;
    
    graphic = createGraphics(bWidth, bHeight);
    graphic.noSmooth();
    graphic.beginDraw();
    graphic.noStroke();

    graphic.fill(0, 0, 0);
    graphic.rect(0, 0, Width, Height);

    graphic.fill(150, 150, 150);
    graphic.rect(BorderWidth, BorderWidth, Width - BorderWidth * 2, Height - BorderWidth * 2);

    graphic.fill(180, 180, 180);
    graphic.rect(BorderWidth, BorderWidth, Width - BorderWidth * 2, BorderWidth);
    graphic.rect(BorderWidth, BorderWidth, BorderWidth, Height - BorderWidth * 2);

    graphic.fill(70, 70, 70);
    graphic.rect(BorderWidth, Height - BorderWidth * 2, Width - BorderWidth * 2, BorderWidth);
    graphic.rect(Width - BorderWidth * 2, BorderWidth, BorderWidth, Height - BorderWidth * 2);

    graphic.endDraw();
  }
  
  public int X;
  public int Y;
  public int Height;
  public int Width;
  public String Text;
  PGraphics graphic;
  
  public void draw() {
    image(graphic, X, Y);
    
    boolean mouseHover = mouseX >= X && mouseX <= X + Width && mouseY >= Y && mouseY <= Y + Height;
    if (mouseHover) {
      fill(120, 125, 230, 100);
      rect(X + BorderWidth, Y + BorderWidth, Width - BorderWidth * 2, Height - BorderWidth * 2);
    }
    
    // Draw text
    textSize(Height - BorderWidth * BorderWidth);
    
    // Draw text shadow
    fill(70, 70, 70);
    text(Text, X + BorderWidth * BorderWidth, Y + Height / 1.25);
    
    if (mouseHover) {
      fill(225, 225, 110);
    } else {
      fill(225, 225, 225);
    }

    text(Text, X + BorderWidth * BorderWidth - BorderWidth, Y + Height / 1.25 - BorderWidth);
  }
  
  public abstract void clicked();
}

public class QuitButton extends Button {
  public QuitButton(int x, int y, int bWidth, int bHeight, String text) {
    super(x, y, bWidth, bHeight, text);
  }
  
  public void clicked() {
    exit();
  }
}
