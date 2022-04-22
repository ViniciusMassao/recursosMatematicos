public class Phase implements ScreenInterface {
  
  private boolean exit = false;
  
  Phase() {
    
  }
  
  boolean update() {
    return exit;
  }
  
  void render() {
    rect(100, 100, 600, 300);
  }
  
  void mousePress() {
    exit = true;
  }
}
