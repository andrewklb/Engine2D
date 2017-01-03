
public class TestEntity extends Entity {
  
  public TestEntity(float x, float y) {
    this.x = x;
    this.y = y;
    this.w = 40.0/tileSize;
    this.h = 64.0/tileSize;
    //this.w = 2.0;
    //this.h = 2.0;
    this.xv = 0.0;
    this.yv = 0.0;
    this.col = #FF0000;
    this.frame = 0;
  }
  
  public void update() {
    super.update();
    this.xv += random(-0.1,0.1);
    Tile lowerTile = level.getTile(xTile0,yTile0+1);
    //if(lowerTile.blocks(this)) {
      if(int(random(0,5)) == 1 && this.yv == 0.0) {
        this.yv -= 0.5;
      }
    //}
    this.yv += 0.04;
    move();
  }
  
  protected void collide(Entity entity) {
  }
}