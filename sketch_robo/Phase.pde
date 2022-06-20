public class Phase implements ScreenInterface {
  
  private int level = 0;
  private boolean exit = false;
  private RobotPlayer player = new RobotPlayer();
  private RobotToImitate robot = new RobotToImitate();
  private AnglesRobot phaseAngles;
  
  Phase(int level, AnglesRobot phaseAngles) {
    this.level = level;
    this.phaseAngles = phaseAngles;
  }
  
  boolean update(){
    if (player.checkPlayerAngles(phaseAngles)){
      exit = true;
    }
    
    player.update(level, phaseAngles);
    robot.update(level, phaseAngles);
    
    return exit;
  }
  
  void render(){
    System.out.println("angulos = " + phaseAngles);
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
    //exit = true;
  }

}
