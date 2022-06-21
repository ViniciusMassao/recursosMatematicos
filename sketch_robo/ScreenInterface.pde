public interface ScreenInterface {
  boolean update(int passedTime);
  void render();
  void keyPress();
  void keyRelease();
  void mousePress();
  void setText(int pontos);
  int getPlayerPontos();
}
