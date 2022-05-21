float startTime = 0;
ArrayList<ScreenInterface> screens = new ArrayList<>();
ScreenInterface actualScreen = null;
int screenIndex = 0;
  
void setup() {
  size(1024, 768);
  screens.add(new Screen("Início de Jogo"));
  screens.add(new Phase(1));
  screens.add(new Screen("Fim de Jogo"));
  
  actualScreen = screens.get(screenIndex);
  startTime = millis();
}

void draw() {
  clear();
  float elapsedTime = (millis() - startTime)/1000.0f;
  startTime = millis();
  
  if (actualScreen.update()) {
    if (screenIndex == 0 || screenIndex == 1) {
      screenIndex++;
      actualScreen = screens.get(screenIndex);
    }
  }
  actualScreen.render(elapsedTime);
  
}

void keyPressed() {
  actualScreen.keyPress();
}

void keyReleased() {
  actualScreen.keyRelease();
}

void mousePressed(){
  actualScreen.mousePress();
}
