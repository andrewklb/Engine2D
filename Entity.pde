public class Entity {
  
  public List<Sprite> sprites = new ArrayList<Sprite>();
  
  public float x, y;
  public float xv, yv;
  public float w, h;
  
  public color col;
  
  public Level level;
  public int xTile0 = -1;
  public int yTile0 = -1;


  private boolean removed = false;
  
  public void update() {
    
  }

  public final void updatePos() {
    int xTile = floor(x+0.5);
    int yTile = floor(y+0.5);
    if (xTile != xTile0 || yTile != yTile0) {
      level.getTile(xTile0, yTile0).removeEntity(this);

      xTile0 = xTile;
      yTile0 = yTile;

      if (!removed) level.getTile(xTile0, yTile0).addEntity(this);
    }
  }

  public void remove() {
    level.getTile(xTile0, yTile0).removeEntity(this);
    removed = true;
  }
  
  public boolean isRemoved() {
    return removed;
  }

  protected void move() {
    int xSteps = int(abs(xv * 100) + 1);
    for (int i = xSteps; i > 0; i--) {
      float xxv = xv;
      if (isFree(x + xxv * i / xSteps, y)) {
        x += xxv * i / xSteps;
        break;
      } else {
        xv = 0.0;
      }
    }

    int ySteps = int(abs(yv * 100) + 1);
    for (int i = ySteps; i > 0; i--) {
      float yyv = yv;
      if (isFree(x, y + yyv * i / ySteps)) {
        y += yyv * i / ySteps;
        break;
      } else {
        yv = 0.0;
        //yv *= 0.1;
      }
    }
  }

  protected boolean isFree(float xx, float yy) {
    int x0 = floor(xx + 0.5 - w/2);
    int x1 = floor(xx + 0.5 + w/2);
    int y0 = floor(yy + 0.5 - h/2);
    int y1 = floor(yy + 0.5 + h/2);
    
    
    for(int xn = x0; xn <= x1; xn++) {
      for(int yn = y0; yn <= y1; yn++) {
        if (level.getTile(xn, yn).blocks(this)) return false;
      }
    }
    
    //if (level.getTile(x0, y0).blocks(this)) return false;
    //if (level.getTile(x1, y0).blocks(this)) return false;
    //if (level.getTile(x0, y1).blocks(this)) return false;
    //if (level.getTile(x1, y1).blocks(this)) return false;

    int xc = floor(xx + 0.5);
    int yc = floor(yy + 0.5);
    int rr = 2;
    for (int y = yc - rr; y <= yc + rr; y++) {
      for (int x = xc - rr; x <= xc + rr; x++) {
        List<Entity> es = level.getTile(x, y).entities;
        for (int i = 0; i < es.size(); i++) {
          Entity e = es.get(i);
          if (e == this) continue;

          if (!e.blocks(this, this.x, this.y, this.w, this.h) && e.blocks(this, xx, yy, this.w, this.h)) {
            e.collide(this);
            this.collide(e);
            return false;
          }
        }
      }
    }
    return true;
  }

  public boolean blocks(Entity entity, float x2, float y2, float w2, float h2) {
    if (x + w/2 <= x2 - w2/2) return false;
    if (x - w/2 >= x2 + w2/2) return false;

    if (y + h/2 <= y2 - h2/2) return false;
    if (y - h/2 >= y2 + h2/2) return false;

    return true;
  }

  public boolean contains(float x2, float y2) {
    if (x + w/2 <= x2) return false;
    if (x - w/2 >= x2) return false;

    if (y + h/2 <= y2) return false;
    if (y - h/2 >= y2) return false;

    return true;
  }

  public boolean isInside(float x0, float y0, float x1, float y1) {
    if (x + w/2 <= x0) return false;
    if (x - w/2 >= x1) return false;

    if (y + h/2 <= y0) return false;
    if (y - h/2 >= y1) return false;

    return true;
  }

  protected void collide(Entity entity) {
  }
}