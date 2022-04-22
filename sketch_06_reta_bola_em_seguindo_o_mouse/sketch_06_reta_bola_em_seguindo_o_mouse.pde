float x, y, angle;
float step = 0;
//ArrayList<Float> pontosAngle = new ArrayList<>();
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
  System.out.println("1.x = " + mouseX + ", y = " + mouseY);
  
  if(pontosX.size() == index + 1){
        System.out.println("Reiniciar");
        System.out.println("2.x = " + pontosX.get(index) + ", y = " + pontosY.get(index));
        index = 0;
  }
  
  if(pontosX.size() != 0){
    angle = atan((mouseY - pontosY.get(index)) / (mouseX - pontosX.get(index)));
    
    if(pontosX.get(index) == x && pontosY.get(index) == y){
      index += 1;
      angle = atan((mouseY - pontosY.get(index)) / (mouseX - pontosX.get(index)));
    }
  }
  
  x += step;
  y += calcY(step);
  if (x > 1024 || x < 0 || y > 768 || y < 0) {
    angle = -angle;
    if (x > 1024 || x < 0)
      step = -step;
  }
  //System.out.println("2.x = " + x + ", y = " + y);
}

float calcY(float dx) {
  return tan(angle) * dx;
}

void mouseClicked() {
  //pontosAngle.add(atan((mouseY - y) / (mouseX - x)));
  pontosX.add(float(mouseX));
  pontosY.add(float(mouseY));
  
  step = 4;
  
  if (mouseX > x)
    step = 1;
  else
    step = -1;
}
