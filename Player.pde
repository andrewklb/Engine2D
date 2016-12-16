public class Player extends Entity {
  
  public Player(float x, float y) {
    this.x = x;
    this.y = y;
    this.w = 1.0;
    this.h = 1.0;
    //this.w = 2.0;
    //this.h = 2.0;
    this.xv = 0.0;
    this.yv = 0.0;
    this.col = #FF0000;
  }
  
  public void update() {
    super.update();
    if(keys[2]) this.xv -= 0.02;
    if(keys[3]) this.xv += 0.02;
    this.yv += 0.04;
    move();
  }
  
  protected void collide(Entity entity) {
  }
}