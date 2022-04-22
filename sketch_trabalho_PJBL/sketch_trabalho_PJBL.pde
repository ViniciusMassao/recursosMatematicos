ArrayList<ScreenInterface> screens = new ArrayList<>();
ScreenInterface actualScreen = null;
int screenIndex = 0;
float startTime = 0;
ArrayList<Circle> enemies = new ArrayList<>();
Circle myCircle = new Circle(150, 500, 40, 200);

void setup() {
  size(1024, 768);
  
  screens.add(new Screen("Início de Jogo"));
  screens.add(new Phase(
    myCircle, enemies
  ));
  screens.add(new Screen("Fim de Jogo"));
  
  actualScreen = screens.get(screenIndex);
  startTime = millis();
}

void draw() {
  clear();
  float elapsedTime = (millis() - startTime) / 1000.0f;
  if (actualScreen.update()) {
    if (screenIndex == 0 || screenIndex == 1) {
      screenIndex++;
      actualScreen = screens.get(screenIndex);
    }
    else {
      
    }
  }
  actualScreen.render(elapsedTime);
  
}

void mousePressed() {
  actualScreen.mousePress();
}
