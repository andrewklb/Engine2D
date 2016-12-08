public HashMap<String, PImage> res = new HashMap<String, PImage>();

public Game game;
public Screen screen;

void setup() {
  size(512, 512);
  noStroke();
  rectMode(CENTER);
  imageMode(CENTER);
  
  load("Test.png");
  
  game = new Game();
  screen = new Screen(width,height);
  game.newGame();
}

void draw() {
  println(frameRate);
  game.update();
  screen.update(game);
}

// Load a resource into hashmap
void load(String name) {
  PImage image = loadImage(name);
  res.put(split(name, ".")[0].toLowerCase(), image);
}