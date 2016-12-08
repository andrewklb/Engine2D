public class Sprite {
  public float x, y;
  public float scale;
  public int tex;
  public color col = 0x202020;
  public boolean visible = true;
  public boolean removed = false;

  public Sprite(float x, float y, int tex, color col) {
    this.x = x;
    this.y = y;
    this.scale = 1;
    this.tex = tex;
    this.col = col;
  }
  
  public Sprite(float x, float y, int tex, color col, float scale) {
    this.x = x;
    this.y = y;
    this.scale = scale;
    this.tex = tex;
    this.col = col;
  }

  public void update() {
    
  }
}