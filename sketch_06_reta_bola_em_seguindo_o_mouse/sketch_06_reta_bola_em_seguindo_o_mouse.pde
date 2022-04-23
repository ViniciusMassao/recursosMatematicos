float x, y, angle;
float step = 2;
int dir = 0;
ArrayList<Float> pontosX = new ArrayList<>();
ArrayList<Float> pontosY = new ArrayList<>();
int index = 0;

void setup() {
  size(1024, 768);
  x = 512;
  y = 384;
  angle = PI / 6;
}

void draw() {
  clear();
  update();
  circle(x, y, 25);
}

void update() {
  
  if(pontosX.size() > 0){
    if(pontosX.size() == index + 1){
      index = 0;
    }
    
    if(dist(x,y,pontosX.get(index), pontosY.get(index)) <= 5 && pontosX.size() > 1) index += 1;
    else if (pontosX.size() == 1) {
      dir = 0;
    }
    
    if(x > pontosX.get(index)) dir = -1;
    else dir = 1;
    
    angle = atan((pontosY.get(index) - y) / (pontosX.get(index) - x));
  }
  else{
    dir = 0;
  }
  
  x += step * dir;
  y += calcY(step * dir);
}

float calcY(float dx) {
  return tan(angle) * dx;
}

void mouseClicked() {
  pontosX.add(float(mouseX));
  pontosY.add(float(mouseY));
}
