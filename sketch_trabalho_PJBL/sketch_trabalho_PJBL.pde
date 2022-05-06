ArrayList<ScreenInterface> screens = new ArrayList<>();
ScreenInterface actualScreen = null;
int screenIndex = 0;
float startTime = 0;

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
  float elapsedTime = (millis() - startTime) / 1000.0f;
  if (actualScreen.update()) {
    if (screenIndex == 0) {
      screenIndex++;
      actualScreen = screens.get(screenIndex);
    }
    else if (screenIndex == 1){
      //boolean alive = actualScreen.playerAlive();
      //if (!alive){
      //  screenIndex++;
      //  actualScreen = screens.get(screenIndex);
      //}
    }
  }
  actualScreen.render(elapsedTime);
}

void keyPressed(){
  actualScreen.keyPress(); 
}

void mousePressed() {
  actualScreen.mousePress();
}
