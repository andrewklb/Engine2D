public class Screen {
  public Screen(int w, int h) {
    
  }
  
  public void update(Game game) {
    background(255);
    for(int x = 0; x < 16; x++) {
      for(int y = 0; y < 16; y++) {
        if(game.level.getTile(x,y).solidRender == true) {
          fill(0);
          rect(x*16,y*16,16,16);
        }
      }
    }
    
    for (int i = 0; i < game.level.entities.size(); i++) {
      Entity e = game.level.entities.get(i);
      fill(e.col);
      rect(e.x*16,e.y*16,ceil(e.w*16),ceil(e.h*16));
    }
  }
  
}