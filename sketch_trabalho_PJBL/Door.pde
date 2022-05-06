public class Door {
  
  private boolean exit = false;
  private float x;
  private float y;
  private float w;
  private float h;
  
  Door(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  boolean update(Key level_key, Circle player) {
    if (level_key.getKeyValue() && colisionPlayer(player)){
       exit = true;
    }
    
    return this.exit;
  }
  
  void render() {
    rect(x, y, w, h);
  }
  
  boolean colisionPlayer(Circle player){ 
    if (dist(x,y, player.getX(), player.getY()) <= 5){
       return true;  
     }
     
     return false;
  }
  
}
