public class RobotPlayer implements RobotInterface {
  
  private PVector torso = new PVector(width/3, height/2);
  private PVector leftUpperArm;
  private PVector leftLowerArm;
  private PVector rightUpperArm;
  private PVector rightLowerArm;
  private PVector leftUpperLeg;
  private PVector leftLowerLeg;
  private PVector rightUpperLeg;
  private PVector rightLowerLeg;
  float angle = HALF_PI/2;
  
  RobotPlayer() {}
  
  void update() {
    angle += 0.01;
  }
  
  void render() {
  }
  
  void keyPress(){}
  
  void keyRelease(){}

  void mousePress() {}

  void generateRandomPos(){
    
  }
}
