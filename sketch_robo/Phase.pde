public class Phase implements ScreenInterface {
  
  private int level = 0;
  private boolean exit = false;
  private RobotPlayer player = new RobotPlayer();
  private RobotToImitate robot = new RobotToImitate();
  private AnglesRobot phaseAngles;
  private int limitTime;
  
  Phase(int level, AnglesRobot phaseAngles) {
    this.level = level;
    this.phaseAngles = phaseAngles;
    if(level == 1){
      limitTime = 30000;
    }
    else if(level == 2){
      limitTime = 60000;
    }
    else{
      limitTime = 90000;  
    }
  }
  
  boolean update(int passedTime){
    if (player.checkPlayerAngles(phaseAngles)){
      player.addPontos(passedTime);
      exit = true;
    }
    
    if(limitTime < passedTime){
      exit = true;
    }
    
    System.out.println("Tempo em milisegundos " + passedTime);
    
    player.update(level, phaseAngles);
    robot.update(level, phaseAngles);
    
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
  
  void setText(int pontos){}
  
  int getPlayerPontos(){
    return player.getPontos();
  }
}
