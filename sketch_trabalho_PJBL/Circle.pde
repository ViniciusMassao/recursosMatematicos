public class Circle {
  
  float x;
  float y;
  boolean jumping = true;
  float dx = 0;
  float dy = 0;
  private float vel;
  private float h = 250;
  private float d = 250;
  private boolean state = false;
  private int life = 3;
  private int dir = 1;
  private ArrayList<Shot> gun = new ArrayList<>();
  
  Circle(float x, float y, float d, float vel) {
    this.x = x;
    this.y = y;
    this.d = d;
    this.vel = vel;
    for(int i=0; i<5; i++) {
      gun.add(new Shot());
    }
  }
  
  boolean alive(){
    if (life < 0) return true;
    return false;
  }
  
  void render() {
    circle(x, y - dy, 30);
    fill(255, 255, 255);
  }
  
  boolean update(float elapsedTime, ArrayList<Plataform> plataforms) {
    System.out.println("x = "+ x +", y = " + y);
    if (life <= 0){ // morto
      return false; 
    }
    
    //x += vel * elapsedTime;
    x += vel;
    
    if (!jumping){ // enquanto nao estiver saltando
      if (vel >= 0){
        verifyFall(plataforms);
      }
      else{
        verifyFall(plataforms);
      }
    }
    else if (jumping) { // ao saltar...
      
      if (vel >= 0){ // logica para a direita
        //dx += vel * elapsedTime;
        dx += vel;
        dy = calc_dy(dx);
      
        if (dx >= (d/2)) { // para salto
          jumping = false;
          dy = 0;
        }
        else if (dx > 0) { // colisao com plataforma
          plataformColision(plataforms);
        }
      }
      else{ // logica para a esquerda
         //dx += vel * elapsedTime;
         dx += vel;
         dy = calc_dy(dx);
         
         if (dx <= -d/2) { // para o salto
          jumping = false;
          dy = 0;
        }
        else if (dx < 0){
          plataformColision(plataforms);
        }
      }
    }
    
    return true;
    
  }
  
  float calc_dy(float dx) {
    return (-4 * h / (d * d)) * dx * dx + h;
  }
  
  Circle verifyCollision(ArrayList<Circle> enemies) {
    for(Circle c: enemies) {
      float ds = dist(x, y, c.x, c.y);
      if (ds < d + c.d)
        return c;
    }
    return null;
  }
  
  boolean plataformColision(ArrayList<Plataform> plataforms){
    for (Plataform plataform: plataforms){
      ArrayList<Float> plataformValues = plataform.getPlataformValues();
      float pX = plataformValues.get(0);
      float pY = plataformValues.get(1);
      float pW = plataformValues.get(2);
      float pH = plataformValues.get(3);
      if (x > pX && x < pX + pW && y - dy + 15 > pY && y - dy + 15 < pY + pH){
        jumping = false;
        y = pY - 15;
        dy = 0;
        return true;
      }
    }
    return false;
  }
  
  boolean verifyFall(ArrayList<Plataform> plataforms){
    for (Plataform plataform: plataforms){
      ArrayList<Float> plataformValues = plataform.getPlataformValues();
      float pX = plataformValues.get(0);
      float pY = plataformValues.get(1);
      float pW = plataformValues.get(2);
      float pH = plataformValues.get(3);
      if (x > pX + pW && x < pX + pW + 15  && y > pY - 20 && y < pY + pH + 20){
        jumping = true;
        dy = calc_dy(0); 
        y = 733; // posição "zero" para y
        return true;
      }
      else if (x > pX - 15 && x < pX && y > pY - 20 && y < pY + pH + 20){
        jumping = true;
        dy = calc_dy(0); 
        y = 733; // posição "zero" para y
        return true;
      }
      else if(x > pX && x < pX + pW && y > pY - 20 && y < pY + pH + 20 && plataform.movingPlataform()){
        y = pY - 15;
        return true;
      }
   }
   
   return false;
  }
  
  float getX(){
    return this.x;
  }
  
  float getY(){
   return this.y; 
  }
  
  void hit(boolean state) {
    this.state = state;
  }
  
  Shot shoot() {
    if (gun.size() > 0) {
      Shot shot = gun.get(0);
      shot.shoot(x, y, dir);
      gun.remove(0);
      
      return shot;
    }
    
    return null;
  }
  
  void keyPressed(){
    if(key == 'a' || key == 'A'){
      vel = -vel; 
    }
    
    if (!jumping && key == ' ') {
      if (vel >= 0) dx = -d/2;
      else dx = d/2;
      
      jumping = true;
    }
  }
  
  void mousePressed() {
    
  }
}
