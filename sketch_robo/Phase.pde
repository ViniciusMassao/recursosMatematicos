public class Phase implements ScreenInterface {
  
  private int level = 0;
  private boolean exit = false;
  private RobotPlayer player = new RobotPlayer();
  private RobotToImitate robot = new RobotToImitate();
  private AnglesRobot phaseAngles;
  private int limitTime;
  private int passedTime;
  
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
    this.passedTime = passedTime/1000;
    if (player.checkPlayerAngles(phaseAngles)){
      exit = true;
    }
    
    if(limitTime < passedTime){
      exit = true;
    }
    
    player.update(level, phaseAngles, passedTime);
    robot.update(level, phaseAngles, passedTime);
    
    return exit;
  }
  
  void render(){
    String levelTxt = "Level: " + level + "    Tempo Limite: " + limitTime/1000 + "     Tempo: " + passedTime;
    fill(255,255,255);
    textSize(20);
    text(levelTxt, 30, 30);
    
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
  
  void setText(int pontos){}
  
  int getPlayerPontos(){
    return player.getPontos();
  }
}
