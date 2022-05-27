public class Shot{
  
  private final int vel = 200;
  
  private PVector pos = new PVector(0,0);
  private PVector dir = new PVector(0,0);
  private boolean onGun = true;
  
  Shot() {}
  
  boolean update(float elapsedTime, PVector targetPos) {
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
    if (checkColision(targetPos)){
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
  
  void shoot(float x, float y, PVector posV) {
    this.pos.x = x;
    this.pos.y = y;
    
    this.dir = PVector.sub(posV, pos).normalize();
    
    onGun = false;
  }
  
  boolean checkColision(PVector targetPos) {
    float d = dist(targetPos.x, targetPos.y, pos.x, pos.y);
    if(d < 49) return true;
    else return false;
  }
  
  float getX(){return pos.x;}
  
  float getY(){return pos.y;}
}
