public interface RobotInterface {
  void update(int level, AnglesRobot phaseAngles, int passedTime);
  void render();
  void keyPress();
  void keyRelease();
  void mousePress();
  boolean checkPlayerAngles(AnglesRobot phaseAngles);
  int getPontos();
  void addPontos(int pontos);
}
