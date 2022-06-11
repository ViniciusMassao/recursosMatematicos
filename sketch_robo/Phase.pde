public class Phase implements ScreenInterface {
  
  private int level = 0;
  private boolean exit = false;
  private RobotPlayer player = new RobotPlayer();
  private RobotToImitate robot = new RobotToImitate();
  
  Phase(int level) {
    this.level = level;
  }
  
  boolean update(){
    player.update();
    robot.update();
    return exit;
  }
  
  void render(){
    String levelTxt = "Level: " + level;
    fill(255,255,255);
    textSize(20);
    text(levelTxt, 100, 100);
    
    player.render();
    robot.render();
  }
  
  void keyPress() {
    player.keyPress();
  }
  
  void keyRelease() {
    player.keyRelease();
  }
  
  void mousePress(){
    exit = true;
  }

}
