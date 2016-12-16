import java.util.*;

public class Level {
  public Tile[] tiles;
  public int levelWidth, levelHeight;
  
  private Tile airTile = new VoidTile();

  public List<Entity> entities = new ArrayList<Entity>();
  protected Game game;

  public Player player;

  public void init(Game game, String name, PImage map) {
    this.game = game;

    player = game.player;
    
    this.levelWidth = map.width;
    this.levelHeight = map.height;
    tiles = new Tile[levelWidth * levelHeight];
    
    map.loadPixels();
    
    
    for (int y = 0; y < levelHeight; y++) {
      for (int x = 0; x < levelWidth; x++) {
        color col = map.pixels[x + y * levelWidth];
        int id = 255 - int(alpha(col));

        Tile tile = decodeTile(col);
        tile.id = id;
        
        tiles[x + y * levelWidth] = tile;
        tile.level = this;
        tile.x = x;
        tile.y = y;
      }
    }

    for (int y = 0; y < levelHeight; y++) {
      for (int x = 0; x < levelWidth; x++) {
        color col = map.pixels[x + y * levelWidth];
        decorateTile(x, y, tiles[x + y * levelWidth], col);
      }
    }
  }
  
  
  
  public void addEntity(Entity e) {
    entities.add(e);
    e.level = this;
    e.updatePos();
  }

  public Tile getTile(int x, int y) {
    if (x < 0 || y < 0 || x >= levelWidth || y >= levelHeight) {
      return airTile;
    }
    return tiles[x + y * levelWidth];
  }
  
  public Tile decodeTile(color col) {
    if(col == #000000) return new SolidTile();
    if(col == #0BD900) return new GrassTile();
    if(col == #875438) return new DirtTile();
    if(col == #808080) return new SnowTile();
    return airTile;
  }
  
  public void decorateTile(int x, int y, Tile tile, color col) {
    tile.decorate(this, x, y);
    
    if(col == #FF0000) addEntity(new TestEntity(x, y));
  }

  public void update() {
    //time = game.time;
    
    for (int i = 0; i < entities.size(); i++) {
      Entity e = entities.get(i);
      e.update();
      e.updatePos();
      if (e.isRemoved()) {
        entities.remove(i--);
      }
    }

    for (int y = 0; y < levelHeight; y++) {
      for (int x = 0; x < levelWidth; x++) {
        tiles[x + y * levelWidth].update();
      }
    }
  }
}