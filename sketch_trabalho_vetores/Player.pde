public class Player{
  private float vel = 150;
  private boolean leftPress = false;
  private boolean rightPress = false;
  private boolean upPress = false;
  private boolean downPress = false;
  private PVector pos;
  private PVector dir;
  private float r = 50;
  private int life = 3;
  
  Player(float x, float y){
    this.pos = new PVector(x, y);
    this.dir = new PVector(0, -1);
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
 
 float getX(){
   return this.pos.x; 
 }
 
 float getY(){
   return this.pos.y; 
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
