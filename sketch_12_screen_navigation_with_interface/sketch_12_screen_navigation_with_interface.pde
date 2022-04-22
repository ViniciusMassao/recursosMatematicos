ArrayList<ScreenInterface> screens = new ArrayList<>();
ScreenInterface actualScreen = null;
int screenIndex = 0;

void setup() {
  size(1024, 768);
  screens.add(new Screen("Início de Jogo"));
  screens.add(new Phase());
  screens.add(new Screen("Fim de Jogo"));
  
  actualScreen = screens.get(screenIndex);
}

void draw() {
  clear();
  if (actualScreen.update()) {
    if (screenIndex == 0 || screenIndex == 1) {
      screenIndex++;
      actualScreen = screens.get(screenIndex);
    }
    else {
      
    }
  }
  actualScreen.render();
}

void mousePressed() {
  actualScreen.mousePress();
}
