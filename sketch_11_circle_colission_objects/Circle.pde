public class Circle {
  
  float x;
  float y;
  float r;
  private float d;
  private float vel;
  private float angle;
  private boolean state = false;
  
  Circle(float x, float y, float r, float vel, float angle) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.d = this.r * 2;
    this.vel = vel;
    this.angle = angle;
  }
  
  void render() {
    if (state) {
      fill(255, 0, 0);
    }
    circle(x, y, d);
    fill(255, 255, 255);
  }
  
  void update(float elapsedTime) {
    x += vel * elapsedTime;
    y += calcY(vel * elapsedTime);
    if (x > 1024 || x < 0 || y > 768 || y < 0) {
      angle = -angle;
      if (x > 1024 || x < 0)
        vel = -vel;
        if (x > 1024) x = 1023;
        if (x < 0) x = 1;
    }
  }
  
  float calcY(float dx) {
    return tan(angle) * dx;
  }
  
  Circle verifyCollision(ArrayList<Circle> enemies) {
    for(Circle c: enemies) {
      float ds = dist(x, y, c.x, c.y);
      if (ds < r + c.r)
        return c;
    }
    
    return null;
  }
  
  void hit(boolean state) {
    this.state = state;
  }
}
