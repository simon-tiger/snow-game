color BACKGROUND_COLOR = color(0, 191, 255);
color PERSON_COLOR = color(255, 192, 203);
color SNOWBALL_COLOR = color(255);

class Game {
  Person thrower;
  Person holder;
  
  char k;
  int kc;
  
  void SnowGame() {
    thrower = new Person(width - 56, height/2, true);
    holder = new Person(56, height/2, false);
  }
  
  void draw() {
    thrower.draw();
    holder.draw();
    
    for (Snowball b1 : thrower.snowballs) {
      if (holder.holds(b1)) {
        b1.distTraveled = 0;
      }
      for (Snowball b2 : thrower.snowballs) {
        if (b1 != b2 && b1.collides(b2)) {
          b1.distTraveled = 0;
        }
      }
    }
  }
  
  void keyReleased() {
    if ((k == CODED) && (kc == LEFT || kc == RIGHT)) {
      thrower.turn(0);
    }
  }
  
  void keyPressed() {
    k = key;
    kc = keyCode;
    if (key == CODED) {
      if (keyCode == LEFT) {
        thrower.turn(-0.02);
      } else if (keyCode == RIGHT) {
        thrower.turn(0.02);
      } else if (keyCode == UP) {
        thrower.throwBall();
      }
    } else if (key == 'r' || key == 'R') {
      SnowGame();
    }
  }
}