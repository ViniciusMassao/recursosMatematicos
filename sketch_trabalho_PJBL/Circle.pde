public class Circle {
  
  float x;
  float y;
  boolean jumping = true;
  float dx = 0;
  float dy = 0;
  private float vel;
  private float h = 300;
  private float d = 250;
  private boolean state = false;
  private int life = 3;
  
  Circle(float x, float y, float d, float vel) {
    this.x = x;
    this.y = y;
    this.d = d;
    this.vel = vel;
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
    System.out.println(jumping);
    
    if (!jumping){ // enquanto nao estiver saltando
      if (vel >= 0){
        
        for (Plataform plataform: plataforms){
          ArrayList<Float> plataformValues = plataform.getPlataformValues();
          float pX = plataformValues.get(0);
          float pY = plataformValues.get(1);
          float pW = plataformValues.get(2);
          float pH = plataformValues.get(3);
          if (x > pX + pW && x < pX + pW + 15  && y > pY + pH - 20 && y > pY + pH + 20){ // detectar queda na plataforma para a direita
            jumping = true;
            dy = calc_dy(0); 
            y = 748; // posição "zero" para y
          }
          else if(x > pX && x < pX + pW && y - dy + 15 > pY && y - dy + 15 < pY + pH && plataform.movingPlataform()){
            y = pY - 15;
          }
          
        }
        
      }
      else{
        
        for (Plataform plataform: plataforms){
          ArrayList<Float> plataformValues = plataform.getPlataformValues();
          float pX = plataformValues.get(0);
          float pY = plataformValues.get(1);
          float pW = plataformValues.get(2);
          float pH = plataformValues.get(3);
          if (x < pX && x > pX - 15  && y > pY + pH - 20 && y > pY + pH + 20){ // detectar queda na plataforma para a esquerda
            jumping = true;
            dy = calc_dy(0); 
            y = 748; // posição "zero" para y
          }
          else if(x > pX && x < pX + pW && y - dy + 15 > pY && y - dy + 15 < pY + pH && plataform.movingPlataform()){
            y = pY - 15;
          }
        }
        
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
        
          for (Plataform plataform: plataforms){
            ArrayList<Float> plataformValues = plataform.getPlataformValues();
            float pX = plataformValues.get(0);
            float pY = plataformValues.get(1);
            float pW = plataformValues.get(2);
            float pH = plataformValues.get(3);
            if (x > pX && x < pX + pW && y - dy + 15 > pY && y - dy + 15 < pY + pH){ // detectar colisao com plataforma para a direita
              jumping = false;
              y = pY - 15;
              dy = 0;
            }
          }
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
          
          for (Plataform plataform: plataforms){
            ArrayList<Float> plataformValues = plataform.getPlataformValues();
            float pX = plataformValues.get(0);
            float pY = plataformValues.get(1);
            float pW = plataformValues.get(2);
            float pH = plataformValues.get(3);
            if (x > pX && x < pX + pW && y - dy + 15 > pY && y - dy + 15 < pY + pH){ // detectar colisao com plataforma para a direita
              jumping = false;
              y = pY - 15;
              dy = 0;
            }
          }
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
  
  float getX(){
    return this.x;
  }
  
  float getY(){
   return this.y; 
  }
  
  void hit(boolean state) {
    this.state = state;
  }
  
  void keyPressed(){
    if(key == ' '){
      vel = -vel; 
    }
  }
  
  void mousePressed() {
    if (!jumping) {
      if (vel >= 0) dx = -d/2;
      else dx = d/2;
      
      jumping = true;
    }
  }
}
