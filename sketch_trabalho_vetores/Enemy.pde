public class Enemy{
  private float vel;
  private PVector pos;
  private PVector dir;
  private boolean seek;
  
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
    float d = dist(pos.x, pos.y, playerX, playerY);
    if (d < 20) {
      dir.set(0, 0);
    }
    return true;
  }
}
