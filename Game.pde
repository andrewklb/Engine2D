public class Game {
  public Level level;
  public Player player;

  private Map<String, Level> loaded = new HashMap<String, Level>();

  public void newGame() {
    clean();
    level = loadLevel(this, "world");
    player = new Player(40, 20);
    player.level = level;
    level.player = player;
    level.addEntity(player);
  }

  public void update() {
    level.update();
  }

  public void clean() {
    loaded.clear();
  }

  public Level loadLevel(Game game, String name) {
    name = name.toLowerCase();
    if (loaded.containsKey(name)) return loaded.get(name);
    PImage map = res.get(name);

    Level level = byName(name);
    level.init(game, name, map);

    loaded.put(name, level);

    return level;
  }

  private Level byName(String name) {
    if(name == "test") return new TestLevel();
    if(name == "world") return new WorldLevel();
    println("Unable to load level " + name + ": level does not exist.");
    return null;
  }
}