public class Key {
  
  private boolean level_key_render = true;
  private float x;
  private float y;
  private float w;
  private float h;
  
  Key(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  boolean update(Circle player) {
    if (colisionPlayer(player)) level_key_render = false;
    
    return this.level_key_render;
  }
  
  void render() {
    fill(255,255,0);
    rect(x, y, w, h);
  }
  
  boolean colisionPlayer(Circle player){ 
    float playerX = player.getX();
    float playerY = player.getY();
    if(playerX < x + w && playerX > x && playerY > y && playerY < y + h) return true;
    
    return false;
  }
  
  boolean getKeyValue(){
    return this.level_key_render; 
  }
  
}
