public class Circle {
  
  float x;
  float y;
  boolean jumping = false;
  float dx = 0;
  float dy = 0;
  private float r;
  private float vel;
  private float h = 250;
  private float d = 200;
  private boolean state = false;
  
  Circle(float x, float y, float r, float vel) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.d = this.r * 2;
    this.vel = vel;
  }
  
  void render() {
    circle(x, y - dy, 30);
    fill(255, 255, 255);
  }
  
  void update(float elapsedTime) {
    if(jumping){
      x += vel * elapsedTime;
      y += calc_dy(vel * elapsedTime);
    }
    else{
      x += vel * elapsedTime;
      if (x > 1024 || x < 0 || y > 768 || y < 0) {
        if (x > 1024 || x < 0)
          vel = -vel;
          if (x > 1024) x = 1023;
          if (x < 0) x = 1;
      }
    }
    
  }
  
  float calc_dy(float dx) {
    return (-4 * h / (d * d)) * dx * dx + h;
  }
  
  Circle verifyCollision(ArrayList<Circle> enemies) {
    for(Circle c: enemies) {
      float ds = dist(x, y, c.x, c.y);
      if (ds < r + c.r)
        return c;
    }
    
    return null;
  }
  
  void hit(boolean state) {
    this.state = state;
  }
  
  void keyPressed(){
    if(keyPressed == true){
      if(key == ' '){
          jumping = true;
      }else if(key == CODED){
        if(keyCode == UP){
          if(vel >= 0) vel += 10;
          else vel -= 10;
        }
        else if(keyCode == DOWN){
          if(vel < 0 )vel -= 10;
          else vel += 10;
        }
        else if(keyCode == LEFT){
          y -= 10;
        }
        else if(keyCode == RIGHT){
          y += 10;
        }
      }
    }
  }
}
