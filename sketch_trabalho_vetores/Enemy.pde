public class Enemy{
  private float vel;
  private PVector pos;
  private PVector dir;
  private boolean seek;
  private int life = 3;
  private float av = 50;
  
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
  }
  
  void colisionGameLimits(){
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
 
 boolean alive(){
   if(life <= 0){
     return false;
   }
   return true;
 }
 
 PVector getPos(){return this.pos;}
 
 void checkColision(Shot shot){
   float d = dist(shot.getX(), shot.getY(), pos.x, pos.y);
   if(d < 50){
     life--;
     //System.out.println("Dano");
   }
 }
 
  float calcAngle(Player player) {
    PVector playerPos = player.getPos();
    PVector v1 = PVector.sub(this.pos, playerPos);
    float d = v1.dot(dir);
    float cosAngle = d / (v1.mag()*dir.mag());
    
    return degrees(acos(cosAngle));
  }
 
}
