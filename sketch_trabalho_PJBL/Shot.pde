public class Shot{
  
  private final int vel = 3;
  
  private float x = 0;
  private float y = 0;
  private int dir = 1;
  private boolean onGun = true;
  
  Shot() {}
  
  boolean update(Circle player, Enemy enemy) {
    if (!onGun) {
      x += dir * vel;
    }
    
    if (x > 1021 || x < 3) {
      return false;
    }
    
    if(player != null){
      if(checkColision(player.getX(), player.getY())){
        return false;
      }    
    }
    else if(enemy != null){
      if(checkColision(enemy.getX(), enemy.getY())){
        return false;
      }
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
  
  boolean checkColision(float inputX, float inputY) {
    float d = dist(inputX, inputY, x, y);
    if(d < 29) return true;
    else return false;
  }
  
  float getX(){
   return x; 
  }
  
  float getY(){
    return y;
  }
}
