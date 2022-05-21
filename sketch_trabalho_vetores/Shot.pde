public class Shot{
  
  private final int vel = 200;
  
  private PVector pos = new PVector(0,0);
  private PVector dir = new PVector(0,0);
  private boolean onGun = true;
  
  Shot() {}
  
  boolean update(float elapsedTime, Enemy enemy) {
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
    if (checkColisionEnemy(enemy)){
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
  
  void shoot(float x, float y, Enemy enemy) {
    this.pos.x = x;
    this.pos.y = y;
    
    PVector enemyPos = enemy.getPos();
    PVector enemyV = new PVector(enemyPos.x, enemyPos.y);
    this.dir = PVector.sub(enemyV, pos).normalize();
    
    onGun = false;
  }
  
  boolean checkColisionEnemy(Enemy enemy) {
    PVector enemyPos = enemy.getPos();
    float d = dist(enemyPos.x, enemyPos.y, pos.x, pos.y);
    if(d < 49){
      return true;
   }
   return false;
  }
  
  float getX(){
   return pos.x; 
  }
  
  float getY(){
    return pos.y;
  }
}
