public class Screen implements ScreenInterface {
  
  private String title;
  private boolean exit = false;
  
  Screen(String title) {
    this.title = title;
  }
  
  boolean update() {
    return exit;
  }
  
  void render(float elapsedTime) {
    fill(255,255,255);
    textSize(20);
    text(title, 100, 100);
  }
  
  void mousePress() {
    exit = true;
  }
  
  void keyPress(){}
}
