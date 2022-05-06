float h = 250;
float d = 200;
float x = 50;
float y = 500;
float dx = 0;
float dy = 0;
float vel = 100;
boolean jumping = false;
float startTime = 0;
float p1X = 200;
float p1Y = 300;
float p1H = 20;
float p1W = 200;

float p2X = 600;
float p2Y = 300;
float p2H = 20;
float p2W = 200;

void setup() {
  size(1024, 768);
  startTime = millis();
}

void draw() {
  float elapsedTime = (millis() - startTime) / 1000.0f;
  startTime = millis();
  clear();
  update(elapsedTime);
  rect(p1X, p1Y, p1W, p1H);
  rect(p2X, p2Y, p2W, p2H);
  circle(x, y - dy, 30);
}

void update(float elapsedTime) {
  x += vel * elapsedTime;
  
  if (!jumping){ // enquanto nao estiver saltando
    if (vel >= 0){
      if (x > p1X + p1W && x < p1X + p1W + 15  && y < p1Y + p1H ){ // detectar queda na primeira plataforma para a direita
        jumping = true;
        dy = calc_dy(0); 
        y = 515; // posição "zero" para y
      }
      else if (x > p2X + p2W && x < p2X + p2W + 15  && y < p2Y + p2H ){ // detectar queda na primeira plataforma para a direita
        jumping = true;
        dy = calc_dy(0); 
        y = 515; // posição "zero" para y
      }
    }
    else{
      if (x < p1X  && y < p1Y + p1H){ // detectar queda na primeira plataforma para a esquerda
        jumping = true;
        dy = calc_dy(0);
        y = 515; // posição "zero" para y
      }
      else if (x < p2X && x > p2X - 15  && y < p2Y + p2H){ // detectar queda na primeira plataforma para a esquerda
        jumping = true;
        dy = calc_dy(0);
        y = 515; // posição "zero" para y
      }
    }
  }
  else if (jumping) { // ao saltar...
    
    if (vel >= 0){ // logica para a direita
      dx += vel * elapsedTime;
      dy = calc_dy(dx);
    
      if (dx >= (d/2)) { // para salto
        jumping = false;
        dy = 0;
      }
      else if (dx > 0) { // colisao com plataforma
        if (x > p1X && x < p1X + p1W && y - dy + 15 > p1Y && y - dy + 15 < p1Y + p1H) { // queda da primeira plataforma
          jumping = false;
          y = p1Y - 15;
          dy = 0;
        }
        else 
        if (x > p2X && x < p2X + p2W && y - dy + 15 > p2Y && y - dy + 15 < p2Y + p2H) { // queda da segunda plataforma
          jumping = false;
          y = p2Y - 15;
          dy = 0;
        }
      }
    }
    else{ // logica para a esquerda
       dx += vel * elapsedTime;
       dy = calc_dy(dx);
       
       if (dx <= -d/2) { // para o salto
        jumping = false;
        dy = 0;
      }
      else if (dx < 0){
        if (x > p1X && x < p1X + p1W && y - dy + 15 > p1Y && y - dy + 15 < p1Y + p1H) { // queda da primeira plataforma
          jumping = false;
          y = p1Y - 15;
          dy = 0;
        }
        else 
        if (x > p2X && x < p2X + p2W && y - dy + 15 > p2Y && y - dy + 15 < p2Y + p2H) { // queda da segunda plataforma
          jumping = false;
          y = p2Y - 15;
          dy = 0;
        }
      }
    }
  }
}

float calc_dy(float dx) {
  return (-4 * h / (d * d)) * dx * dx + h;
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
