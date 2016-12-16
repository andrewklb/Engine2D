public class SnowTile extends Tile {
  public SnowTile() {
    solidRender = true;
    blocksMotion = true;
    tex = 0;
  }
  
  public void decorate(Level level, int x, int y) {
    boolean left = false, right = false, up = false, down = false;
    if(level.getTile(x-1,y) instanceof SnowTile) left = true;
    if(level.getTile(x+1,y) instanceof SnowTile) right = true;
    if(level.getTile(x,y-1) instanceof SnowTile) up = true;
    if(level.getTile(x,y+1) instanceof SnowTile) down = true;
    if(up) tex = 5;
    if(!up && left && right) tex = int(random(1,4));
    if(!up && left && !right) tex = 4;
    if(!up && !left && right) tex = 0;
    if(!down) tex = int(random(11,14));
    if(!down && !left) tex = 10;
    if(!down && !right) tex = 14;
  }
}