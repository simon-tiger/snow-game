class Snowball {
  float x;
  float y;
  float r;
  
  float dir;
  float distTraveled;
  
  Snowball(float x, float y, float dir) {
    this.x = x;
    this.y = y;
    r = 20;
    
    this.dir = dir;
    this.distTraveled = 5;
  }
  
  void draw() {
    update();
    
    pushStyle();
    
    fill(SNOWBALL_COLOR);
    noStroke();
    ellipseMode(RADIUS);
    ellipse(x, y, r, r);
    
    popStyle();
  }
  
  void update() {
    x += cos(dir) * distTraveled;
    y += sin(dir) * distTraveled;
  }
  
  boolean collides(Snowball ball) {
    float d = dist(x, y, ball.x, ball.y);
    return d < r;
  }
}