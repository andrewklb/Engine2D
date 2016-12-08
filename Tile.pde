public class Tile {
  public List<Entity> entities = new ArrayList<Entity>();
  public List<Sprite> sprites = new ArrayList<Sprite>();
  
  public boolean blocksMotion = false;
  public boolean solidRender = false;
  
  public Level level;
  public int x, y;

  public int id;
  public int tex;
  
  public void addSprite(Sprite sprite) {
    sprites.add(sprite);
  }
  
  public void removeEntity(Entity entity) {
    entities.remove(entity);
  }

  public void addEntity(Entity entity) {
    entities.add(entity);
  }
  
  public boolean blocks(Entity entity) {
    return blocksMotion;
  }
  
  public void decorate(Level level, int x, int y) {
    
  }
  
  public void update() {
    for (int i = 0; i < sprites.size(); i++) {
      Sprite sprite = sprites.get(i);
      sprite.update();
      if (sprite.removed) {
        sprites.remove(i--);
      }
    }
  }
  
}