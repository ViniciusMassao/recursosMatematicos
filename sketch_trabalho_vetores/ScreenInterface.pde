public interface ScreenInterface {
  boolean update();
  void render(float elapsedTime);
  void keyPress();
  void keyRelease();
  void mousePress();
}
