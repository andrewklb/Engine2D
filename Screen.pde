public class Screen {
  
  public Screen(int w, int h) {
  }
  
  public void update(Game game) {
    //background(0);
    image(res.get("background"),width/2,height/2);
    float camx = game.player.x;
    float camy = game.player.y;
    //float camx = mouseX;
    //float camy = mouseY;
    println(camx+", "+camy);
    int mapDisplayWidth = ceil(width/(tileSize));
    int mapDisplayHeight = ceil(height/(tileSize));
    float xOffset = (camx*tileSize % float(tileSize));
    float yOffset = (camy*tileSize % float(tileSize));
    int firstTileX = floor(camx-(width/2/(tileSize)));
    int firstTileY = floor(camy-(height/2/(tileSize)));
    
    for(int x = 0; x < mapDisplayWidth+2; x++) {
      for(int y = 0; y < mapDisplayHeight+2; y++) {
        Tile tile = game.level.getTile(x+firstTileX,y+firstTileY);
        if(tile.solidRender == true) {
          PImage icon = tileSheet[tile.tex];
          image(icon, x*tileSize-xOffset, y*tileSize-yOffset);
        }
      }
    }
    
    for (int i = 0; i < game.level.entities.size(); i++) {
      Entity e = game.level.entities.get(i);
      int spritex = int((e.x-camx+(width/2/tileSize))*tileSize);
      int spritey = int((e.y-camy+(height/2/tileSize))*tileSize);
      PImage icon = spriteSheet[e.tex+e.frame];
      image(icon, spritex, spritey);
      //fill(e.col);
      //rect(,,ceil(e.w*tileSize),ceil(e.h*tileSize));
    }
  }
  
}