public class Enemy {
  
  private float x;
  private float y;
  private int life = 1;
  private int dir = -1;
  private boolean alive= true;
  private ArrayList<Shot> gun = new ArrayList<>();
  
  Enemy(float x, float y) {
    this.x = x;
    this.y = y;
    for(int i=0; i<200; i++) {
      gun.add(new Shot());
    }
  }
  
  void render() {
    fill(255, 0, 0);
    circle(x, y, 30);    
  }
  
  boolean update(Shot shot) {
    if(shot != null){
      float sX = shot.getX();
      float sY = shot.getY();
      if(dist(sX, sY, x, y) <= 30){
        life --;
      }
    }
    if (life <= 0){ // morto
      x = 0; 
      y = 0;
      alive = false;
    }
    return alive;
  }
  
  float getX(){
    return this.x;
  }
  
  float getY(){
   return this.y; 
  }
  
  Shot shoot(Circle player) {
    if (gun.size() > 0) {
      Shot shot = gun.get(0);
      if (player.getX() < x) dir = -1;
      else dir = 1;
      shot.shoot(x, y, dir);
      gun.remove(0);
      
      return shot;
    }
    
    return null;
  }
}
