Game game = new Game();

void setup() {
  size(600, 400);
  game.SnowGame();
}

void draw() {
  background(BACKGROUND_COLOR);
  game.draw();
}

void keyReleased() {
  game.keyReleased();
}

void keyPressed() {
  game.keyPressed();
}