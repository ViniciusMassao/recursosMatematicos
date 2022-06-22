ArrayList<ScreenInterface> screens = new ArrayList<>();
ArrayList<AnglesRobot> phasesAngles = new ArrayList<>();
ScreenInterface actualScreen = null;
int screenIndex = 0;
int savedTime = 0;
int playerPoints = 0;
  
void setup() {
  size(1024, 768);
  
  savedTime = millis();
  
  AnglesRobot phase1Pos = new AnglesRobot(
    0.5,
    1.5,
    0.5,
    -0.5,
    -1.5,
    -0.5,
    -1.5,
    0.0,
    1.5,
    0.0
  );
  
  AnglesRobot phase2Pos = new AnglesRobot(
    -0.5,
    -1.5,
    0.0,
    -1.0,
    -1.0,
    0.0,
    -1.0,
    -0.5,
    0.5,
    2.0
  );
  
  AnglesRobot phase3Pos = new AnglesRobot(
    1.5,
    1.5,
    1.5,
    1.0,
    -1.5,
    -0.5,
    -0.5,
    -1.5,
    0.5,
    0.5
  );
  
  phasesAngles.add(phase1Pos);
  phasesAngles.add(phase2Pos);
  phasesAngles.add(phase3Pos);
  
  screens.add(new Screen("Início de Jogo"));
  screens.add(new Phase(1, phase1Pos));
  screens.add(new Phase(2, phase2Pos));
  screens.add(new Phase(3, phase3Pos));
  screens.add(new Screen("Fim de Jogo"));
  
  actualScreen = screens.get(screenIndex);
}

void draw() {
  clear();
  
  int passedTime = millis() - savedTime;
  
  if (actualScreen.update(passedTime)) {
    if (screenIndex >= 0) {
      if(screens.size() - 2 == screenIndex){
        playerPoints = actualScreen.getPlayerPontos();
        System.out.println("playerPoints = "+playerPoints);
      }
      screenIndex++;
      passedTime = 0;
      actualScreen = screens.get(screenIndex);
      if(screens.size() - 1 == screenIndex){
        actualScreen.setText(playerPoints);  
      }
    }
  }
  
  actualScreen.render();
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
