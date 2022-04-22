int x = 26;
int y = 300;
float startTime = 0;
int yVel = 200;
int xVel = 300;
int r_initial = 50;
int r_double = 50*2;
int r = r_initial;

void setup() {
  size(1024, 768);
  startTime = millis();
}

void draw() {
  float elapsedTime = (millis() - startTime) / 1000.0f;
  startTime = millis();
  clear();
  update(elapsedTime);
  circle(x, y, r);
}

void update(float elapsedTime) {
  x += xVel * elapsedTime;
  y += yVel * elapsedTime;
  if (x < 25 || x > 999) {
    xVel = -xVel;
    if (x < 25) {
      x = 25;
    }
    else if (x > 999) {
      x = 999;
    }
  }
  if (y < 25 || y > 743) {
    yVel = -yVel;
    if (y < 25) {
      y = 25;
    }
    else if (y > 743) {
      y = 743;
    }
  }
}

void keyPressed(){
  if(keyPressed == true){
    if(key == ' '){
        xVel *= -1;
    }
    else if(key == CODED){
      if(keyCode == UP){
        if(xVel >= 0) xVel += 10;
        else xVel -= 10;
      }
      else if(keyCode == DOWN){
        if(xVel < 0 )xVel -= 10;
        else xVel += 10;
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

void mousePressed(){
  if(r < r_double)r += 10;
  else if (r >= r_double)r -= 10;
}
