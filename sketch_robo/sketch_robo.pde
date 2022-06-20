import java.util.Map;

ArrayList<ScreenInterface> screens = new ArrayList<>();
ArrayList<AnglesRobot> phasesAngles = new ArrayList<>();
ScreenInterface actualScreen = null;
int screenIndex = 0;
int points = 0;
  
void setup() {
  size(1024, 768);
  
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
  
  HashMap<Integer, AnglesRobot> hashMapLevelPos = new HashMap<Integer, AnglesRobot>();
  hashMapLevelPos.put(1, phase1Pos);
  hashMapLevelPos.put(2, phase2Pos);
  hashMapLevelPos.put(3, phase3Pos);
  
  
  screens.add(new Screen("Início de Jogo"));
  screens.add(new Phase(1, phase1Pos));
  screens.add(new Phase(2, phase2Pos));
  screens.add(new Phase(3, phase3Pos));
  screens.add(new Screen("Fim de Jogo"));
  
  actualScreen = screens.get(screenIndex);
}

void draw() {
  clear();
  
  if (actualScreen.update()) {
    if (screenIndex >= 0) {
      screenIndex++;
      actualScreen = screens.get(screenIndex);
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
