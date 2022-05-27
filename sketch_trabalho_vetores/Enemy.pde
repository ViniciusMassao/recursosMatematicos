public class Enemy{
  private float vel;
  private PVector pos;
  private PVector dir;
  private boolean seek;
  private int life = 3;
  private float av = 270;
  private float r = 50;
  private boolean flag = false;
  private ArrayList<Shot> gun = new ArrayList<>();
  
  Enemy(float x, float y, boolean seek, float vel){
    this.vel = vel;
    this.pos = new PVector(x, y);
    this.dir = new PVector(1, -1);
    this.seek = seek;
    if(seek){
      for(int i=0; i<20; i++) {
        gun.add(new Shot());
      }
    }
  }
  
  void render(){
    if(seek) fill(255,0,0);
    else fill(255,100,0);
    circle(pos.x, pos.y, r);
  }
  
  boolean update(float elapsedTime, Player player, Enemy enemy_seek){
    
    if(life <= 0){
      return false; 
    }
    else {
      float playerX = player.getX();
      float playerY = player.getY();
      
      if(life <= 0){
        return false;
      }
      
      colisionGameLimits();
      
      PVector m = null;
      if(seek){  
        float angle = calcAngle(player);
        float dist = dist(pos.x, pos.y, playerX, playerY);
      
        if(angle < av/2 && dist < 300){
          
          PVector playerVector = new PVector(playerX, playerY);
          dir = PVector.sub(playerVector, pos).normalize();
          
          // Movimento de perseguição
          m = PVector.mult(dir, vel * elapsedTime); 
        }
        else{
          dir.rotate(1 * elapsedTime);
          
          m = PVector.mult(dir, vel * elapsedTime);  
        }
      }
      else{
        float d = dist(pos.x, pos.y, playerX, playerY);
        if(d < 200){
          flag = false;
        }
        if(flag){
          PVector escapeV = enemy_seek.getPos();
          dir = PVector.sub(escapeV, pos).normalize();
          
          // Ir para o inimigo que persegue
          m = PVector.mult(PVector.mult(dir, 1), vel * elapsedTime);
        }
        else{
          PVector playerVector = new PVector(playerX, playerY);
          dir = PVector.sub(playerVector, pos).normalize();
          
          // Direção invertida, movimento de fuga
          m = PVector.mult(PVector.mult(dir, -1), vel * elapsedTime);
        }
      }

      pos.add(m);
  
      return true;
    }
  }
  
  void colisionGameLimits(){
   if (pos.x > width) {
      pos.x = 0;
      flag = true;
    } else if (pos.x < 0) {
      pos.x = width;
      flag = true;
    } else if (pos.y > height) {
      pos.y = 0;
      flag = true;
    } else if (pos.y < 0) {
      pos.y = height;
      flag = true;
    }
 }
 
 boolean alive(){
   if(life <= 0){
     return false;
   }
   return true;
 }
 
 boolean engageShotDist(Player player){
   float playerX = player.getX();
   float playerY = player.getY();
   float angle = calcAngle(player);
   float dist = dist(pos.x, pos.y, playerX, playerY);
   
   if(angle < av/2 && dist < 300){return true;}
   else {return false;}
 }
 
 PVector getPos(){return this.pos;}
 
 void checkColision(Shot shot){
   float d = dist(shot.getX(), shot.getY(), pos.x, pos.y);
   if(d < r){
     life--;
   }
 }
 
  float calcAngle(Player player) {
    PVector playerPos = player.getPos();
    PVector v1 = PVector.sub(this.pos, playerPos);
    float d = v1.dot(dir);
    float cosAngle = d / (v1.mag()*dir.mag());
    
    return degrees(acos(cosAngle));
  }
  
  Shot shoot(Player player) {
    if (gun.size() > 0) {
      Shot shot = gun.get(0);
      shot.shoot(pos.x, pos.y, player.getPos());
      gun.remove(0);
      
      return shot;
    } 
    return null;
  }
 
}
