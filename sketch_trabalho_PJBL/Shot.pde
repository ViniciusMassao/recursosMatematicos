public class Shot{
  
  private final int vel = 200;
  
  private float x = 0;
  private float y = 0;
  private int dir = 1;
  private boolean onGun = true;
  
  Shot() {}
  
  boolean update(float deltaTime) {
    if (!onGun) {
      //x += dir * vel * deltaTime;
      x += dir * vel;
    }
    if (x > 1021 || x < 3) {
      return false;
    }
    
    return true;
  }
  
  void render() {
    if (!onGun) {
      circle(x, y, 5);
    }
  }
  
  void shoot(float x, float y, int dir) {
    this.x = x;
    this.y = y;
    this.dir = dir;
    onGun = false;
  }
}
