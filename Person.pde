class Person {
  float x;
  float y;
  float r;
  
  float dir;
  float amt;
  
  boolean isThrower;
  ArrayList<Snowball> snowballs;
  
  Person(float x, float y, boolean isThrower) {
    this.x = x;
    this.y = y;
    r = 40;
    
    dir = PI;
    amt = 0;
    
    this.isThrower = isThrower;
    snowballs = new ArrayList<Snowball>();
  }
  
  void draw() {
    update();
    
    pushStyle();
    
    if (isThrower) {
      stroke(255);
      float xend = x + cos(dir) * r*3;
      float yend = y + sin(dir) * r*3;
      line(x, y, xend, yend);
    
      float xend2 = x + cos(dir-0.1) * r*2.7;
      float yend2 = y + sin(dir-0.1) * r*2.7;
      float xend3 = x + cos(dir+0.1) * r*2.7;
      float yend3 = y + sin(dir+0.1) * r*2.7;
      line(xend, yend, xend2, yend2);
      line(xend, yend, xend3, yend3);
    } else {
      stroke(255);
      noFill();
      ellipseMode(RADIUS);
      ellipse(x, y, r*3, r*3);
    }
    
    for (Snowball b : snowballs) {
      b.draw();
    }
    
    fill(PERSON_COLOR);
    noStroke();
    ellipseMode(RADIUS);
    ellipse(x, y, r, r);
    
    popStyle();
  }
  
  void update() {
    dir += amt;
  }
  
  void turn(float amt) {
    this.amt = amt;
  }
  
  void throwBall() {
    snowballs.add(new Snowball(x, y, dir));
  }
  
  boolean holds(Snowball ball) {
    float d = dist(x, y, ball.x, ball.y);
    return (!isThrower) && (d < r*3);
  }
}