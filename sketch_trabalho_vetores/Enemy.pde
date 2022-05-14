public class Enemy{
  private float vel;
  private PVector pos;
  private PVector dir;
  private boolean seek;
  private int life = 3;
  
  Enemy(float x, float y, boolean seek, float vel){
    this.vel = vel;
    this.pos = new PVector(x, y);
    this.dir = new PVector(0, 0);
    this.seek = seek;
  }
  
  void render(){
    if(seek) fill(255,0,0);
    else fill(255,100,0);
    circle(pos.x, pos.y, 50);
  }
  
  boolean update(float elapsedTime, Player player){
    float playerX = player.getX();
    float playerY = player.getY();
    
    // logica de tiro
    //float d = dist(pos.x, pos.y, playerX, playerY);
    //if (d < 20) {
    //  life--;
    //}
    
    if(life <= 0){
      return false;
    }
    
    colisionGameLimits();
    
    PVector playerVector = new PVector(playerX, playerY);
    dir = PVector.sub(playerVector, pos).normalize();
    
    PVector m;
    if(seek){
      // Movimento de perseguição
      m = PVector.mult(dir, vel * elapsedTime); 
    }
    else{
      // Direção invertida, movimento de fuga
      m = PVector.mult(PVector.mult(dir, -1), vel * elapsedTime);
    }
    
    pos.add(m);

    return true;
  }
  
  void colisionGameLimits(){
    //size(1024, 768);
   // colisao parte inferior direita
   if (pos.x > width) {
      pos.x = 0;
    } else if (pos.x < 0) {
      pos.x = width;
    } else if (pos.y > height) {
      pos.y = 0;
    } else if (pos.y < 0) {
      pos.y = height;
    }
 }
 
}
