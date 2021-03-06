public class Circle {
  
  private float x;
  private float y;
  private boolean jumping = true;
  private float dx = 0;
  private float dy = 0;
  private float vel;
  private float h = 250;
  private float d = 250;
  private int life = 2;
  private int dir = 1;
  private ArrayList<Shot> gun = new ArrayList<>();
  
  Circle(float x, float y, float d, float vel) {
    this.x = x;
    this.y = y;
    this.d = d;
    this.vel = vel;
    for(int i = 0; i < 8; i++) {
      gun.add(new Shot());
    }
  }
  
  int checkLife(){
    return this.life;
  }
  
  void render() {
    fill(0, 0, 255);
    circle(x, y - dy, 30);    
  }
  
  boolean update(float elapsedTime, ArrayList<Plataform> plataforms) {
    if (life <= 0){ // morto
      return false; 
    }
    
    //x += vel * elapsedTime;
    x += vel;
    
    if (!jumping){ // enquanto nao estiver saltando
      if (x > 1024 || x < 0){
        vel = -vel;
      }
      
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
      
        if (dx >= (d/2) && !plataformColision(plataforms)) { // continua o salto caso nao tenha plataforma
          verifyFall(plataforms);
        }
        else if (dx >= (d/2)) { // para salto
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
         
        if (dx <= -d/2 && !plataformColision(plataforms)) { // continua o salto caso nao tenha plataforma
          verifyFall(plataforms);
        }
        else if (dx <= -d/2) { // para o salto
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
  
  void checkCollisionShot(Shot enemyShot) {
    float enemyShotX = enemyShot.getX();
    float enemyShotY = enemyShot.getY();
    //System.out.println("LIFE = " + life);
    System.out.println("DIST = " + dist(enemyShotX, enemyShotY, x, y));
    if(dist(enemyShotX, enemyShotY, x, y) <= 261) {
      life --;
    }
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
        y = 733; // posi????o "zero" para y
        return true;
      }
      else if (x > pX - 15 && x < pX && y > pY - 20 && y < pY + pH + 20){
        jumping = true;
        dy = calc_dy(0); 
        y = 733; // posi????o "zero" para y
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
  
  Shot shoot() {
    if (gun.size() > 0) {
      Shot shot = gun.get(0);
      if (vel < 0) dir = -1;
      else dir = 1;
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
  
  void mousePressed() {}
}
