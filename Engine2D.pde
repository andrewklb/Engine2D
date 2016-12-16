public HashMap<String, PImage> res = new HashMap<String, PImage>();

public boolean[] keys = new boolean[10];

public PImage[] playerSheet;
public PImage[] tileSheet;


public int tileSize = 32;
public int playerSize = 16;

public Game game;
public Screen screen;

void setup() {
  size(640, 360);
  noStroke();
  noSmooth();
  rectMode(CENTER);
  imageMode(CENTER);
  load("Test.png");
  load("World.png");
  playerSheet = loadSheet("player.png", playerSize);
  tileSheet = loadSheet("SnowTiles.png", tileSize);
  
  game = new Game();
  screen = new Screen(width,height);
  game.newGame();
}

void draw() {
  //println(frameRate);
  game.update();
  screen.update(game);
}

// Load a resource into hashmap
void load(String name) {
  PImage image = loadImage(name);
  res.put(split(name, ".")[0].toLowerCase(), image);
}

PImage[] loadSheet(String name, int size) {
  PImage sheet = loadImage(name);
  int w = sheet.width/size;
  int h = sheet.height/size;
  PImage[] icons = new PImage[w*h];
  for(int y = 0; y < h; y++) {
    for(int x = 0; x < w; x++) {
      PImage icon = sheet.get(x*size,y*size,size,size);
      icons[x+y*w] = icon;
    }
  }
  return icons;
}

void keyPressed() {
  if(keyCode == UP) keys[0] = true;
  if(keyCode == DOWN) keys[1] = true;
  if(keyCode == LEFT) keys[2] = true;
  if(keyCode == RIGHT) keys[3] = true;
}

void keyReleased() {
  if(keyCode == UP) keys[0] = false;
  if(keyCode == DOWN) keys[1] = false;
  if(keyCode == LEFT) keys[2] = false;
  if(keyCode == RIGHT) keys[3] = false;
} 