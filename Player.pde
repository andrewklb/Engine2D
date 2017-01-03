public class Player extends Entity {
  float mxv, myv;
  
  public Player(float x, float y) {
    this.x = x;
    this.y = y;
    this.w = 40.0/tileSize;
    this.h = 64.0/tileSize;
    //this.w = 2.0;
    //this.h = 2.0;
    this.xv = 0.0;
    this.yv = 0.0;
    this.col = #FF0000;
    this.tex = 0;
    this.mxv = 0.15;
    this.myv = 1.0;
  }
  
  public void update() {
    super.update();
    frame = int(millis()/10*abs(this.xv))%8;
    if(!this.facingRight) frame += 9;
    if(keys[2]) this.xv -= 0.02;
    if(keys[3]) this.xv += 0.02;
    
    if(this.xv < -this.mxv) this.xv = -this.mxv;
    if(this.xv > this.mxv)  this.xv =  this.mxv;
    if(this.yv < -this.myv) this.yv = -this.myv;
    if(this.yv > this.myv)  this.yv =  this.myv;
    if(keys[0] && this.yv == 0.0) this.yv-=0.6;
    this.yv += 0.04;
    move();
  }
  
  protected void collide(Entity entity) {
  }
}