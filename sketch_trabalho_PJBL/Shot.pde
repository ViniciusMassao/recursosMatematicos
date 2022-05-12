public class Shot{
  
  private final int vel = 50;
  
  private float x = 0;
  private float y = 0;
  private int dir = 1;
  private boolean onGun = true;
  
  Shot() {}
  
  boolean update(float deltaTime) {
    if (!onGun) {
      //x += dir * vel * deltaTime;
      x += dir * vel/4;
    }
    if (x > 1021 || x < 3) {
      return false;
    }
    
    return true;
  }
  
  void render() {
    if (!onGun) {
      fill(255,230,0);
      circle(x, y, 7);
    }
  }
  
  void shoot(float x, float y, int dir) {
    this.x = x;
    this.y = y;
    this.dir = dir;
    onGun = false;
  }
  
  float getX(){
   return x; 
  }
  
  float getY(){
    return y;
  }
}
