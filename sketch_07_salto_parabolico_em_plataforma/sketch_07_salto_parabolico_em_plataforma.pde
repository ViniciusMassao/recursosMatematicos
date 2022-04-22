float h = 250;
float d = 200;
float x = 50;
float y = 500;
float dx = 0;
float dy = 0;
float vel = 100;
boolean jumping = false;
float startTime = 0;
float pX = 400;
float pY = 300;
float pH = 20;
float pW = 200;
boolean fall = false;

void setup() {
  size(1024, 768);
  startTime = millis();
}

void draw() {
  float elapsedTime = (millis() - startTime) / 1000.0f;
  startTime = millis();
  clear();
  update(elapsedTime);
  rect(pX, pY, pW, pH);
  circle(x, y - dy, 30);
}

void update(float elapsedTime) {
  x += vel * elapsedTime;
  
  if (!jumping){ // enquanto nao estiver saltando
    if (x > pX + pW  && y < pY + pH){ // detectar queda na plataforma
      //System.out.println("queda");
      jumping = true;
      fall = true;
    }
  }
  else if (jumping) { // ao saltar...
    
    if (vel >= 0){ // logica do pula para a direita
      dx += vel * elapsedTime;
      dy = calc_dy(dx);
    
      if (dx >= d/2) { // para salto
        System.out.println("para salto direita");
        jumping = false;
        fall = false;
        dy = 0;
      }
      else if (dx > 0) { // colisao com plataforma
        if (x > pX && x < pX + pW & y - dy + 15 > pY && y - dy + 15 < pY + pH) {
          System.out.println("colisao com plataforma");
          jumping = false;
          fall = false;
          y = pY - 15;
          dy = 0;
        }
        else if (dx < d/2 && fall) { // queda da plataforma
          System.out.println("queda da plataforma, x = " + x + ", dy = " + dy);
          dx += vel * elapsedTime;
          dy = calc_dy_falling(dx);
        }
      }
    }
    else{ // logica do pula para a esquerda
       dx += vel * elapsedTime;
       dy = calc_dy(dx);
       
       if (dx <= -d/2) { // para salto
        System.out.println("para salto esquerda");
        jumping = false;
        fall = false;
        dy = 0;
      }
    }
  }
}

float calc_dy(float dx) {
  return (-4 * h / (d * d)) * dx * dx + h;
}

float calc_dy_falling(float dx) {
  return (-4 * h / (d * d)) * dx * dx;
}

void mousePressed() {
  if (!jumping) {
    if (vel >= 0) dx = -d/2;
    else dx = d/2;
    
    jumping = true;
  }
}

void keyPressed(){
  if(key == ' '){
    vel = -vel; 
  }
}
