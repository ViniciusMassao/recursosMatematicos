public class Player{
  private float vel = 100;
  private boolean leftPress = false;
  private boolean rightPress = false;
  private boolean upPress = false;
  private boolean downPress = false;
  private PVector pos;
  private PVector dir;
  private float r = 50;
  private int life = 3;
  private ArrayList<Shot> gun = new ArrayList<>();
  
  Player(float x, float y){
    this.pos = new PVector(x, y);
    this.dir = new PVector(0, -1);
    for(int i=0; i<20; i++) {
      gun.add(new Shot());
    }
  }
 
 void render(){
    fill(0,255,0);
    circle(pos.x, pos.y, r); 
 }
 
 boolean update(float elapsedTime){
   if (life <= 0){
     return false;
   }
   
   colisionGameLimits();
   
    if (leftPress) {
      dir.rotate(HALF_PI * elapsedTime);
    }
    if (rightPress) {
      dir.rotate(-HALF_PI * elapsedTime);
    }
    if (upPress) {
      vel += 80 * elapsedTime;
      if (vel > 300) {
        vel = 300;
      }
    }
    if (downPress) {
      vel -= 80 * elapsedTime;
      if (vel < 20) {
        vel = 50;
      }
    }
    PVector m = PVector.mult(dir, vel * elapsedTime);
    pos.add(m);
    
   return true;
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
 
 float getX(){return this.pos.x;}
 
 float getY(){return this.pos.y;}
 
 PVector getPos(){return this.pos;}
 
 void checkColision(Shot shot){
   float d = dist(shot.getX(), shot.getY(), pos.x, pos.y);
   if(d < r){
     life--;
     System.out.println("Life = "+ life);
   }
 }
 
 Shot shoot(Enemy enemy) {
   if (gun.size() > 0) {
      Shot shot = gun.get(0);
      shot.shoot(pos.x, pos.y, enemy.getPos());
      gun.remove(0);
      
      return shot;
    } 
    return null;
  }
 
 void keyPressed() {
    if (key == CODED) {
      if (keyCode == LEFT) {
        leftPress = true;
      } else if (keyCode == RIGHT) {
        rightPress = true;
      } else if (keyCode == UP) {
        upPress = true;
      } else if (keyCode == DOWN) {
        downPress = true;
      }
    }
  }
  
  void keyReleased() {
    leftPress = false;
    rightPress = false;
    upPress = false;
    downPress = false;
  }
  
}
