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
    if (!level_key.getKeyValue() && colisionPlayer(player)){
       exit = true;
    }
    
    return this.exit;
  }
  
  void render() {
    fill(150, 75, 0);
    rect(x, y, w, h);
  }
  
  boolean colisionPlayer(Circle player){ 
    float playerX = player.getX();
    float playerY = player.getY();
    if(playerX < x + w && playerX > x && playerY > y && playerY < y + h) return true;
     
     return false;
  }
  
}
