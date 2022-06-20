public interface RobotInterface {
  void update(int level, AnglesRobot phaseAngles);
  void render();
  void keyPress();
  void keyRelease();
  void mousePress();
  boolean checkPlayerAngles(AnglesRobot phaseAngles);
}
