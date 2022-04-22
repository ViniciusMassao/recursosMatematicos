public class Screen implements ScreenInterface {
  
  private String title;
  private boolean exit = false;
  
  Screen(String title) {
    this.title = title;
  }
  
  boolean update() {
    return exit;
  }
  
  void render() {
    textSize(20);
    text(title, 100, 100);
  }
  
  void mousePress() {
    exit = true;
  }
}
