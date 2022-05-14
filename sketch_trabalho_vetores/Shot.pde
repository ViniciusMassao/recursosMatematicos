public class Shot{
  
  private final int vel = 50;
  
  private PVector pos;
  private PVector dir;
  private boolean onGun = true;
  
  Shot() {}
  
  boolean update(float elapsedTime) {
    if (!onGun) {
      PVector m = PVector.mult(dir, vel * elapsedTime);
      pos.add(m);
    }
    if (pos.x > width || pos.x < 0) {
      return false;
    }
    if (pos.y < 0 || pos.y > height){
      return false;
    }
    return true;
  }
  
  void render() {
    if (!onGun) {
      fill(255,230,0);
      circle(pos.x, pos.y, 7);
    }
  }
  
  void shoot(float x, float y, PVector dir) {
    this.pos.x = x;
    this.pos.y = y;
    this.dir = dir;
    onGun = false;
  }
  
  float getX(){
   return pos.x; 
  }
  
  float getY(){
    return pos.y;
  }
}
