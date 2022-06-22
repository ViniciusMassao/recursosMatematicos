public class RobotToImitate implements RobotInterface {
  
  private PVector torso = new PVector(width/1.5, height/2);
  
  float leftUpperArmAngle = HALF_PI/2;
  float leftLowerArmAngle = HALF_PI/2;
  float leftHandAngle = HALF_PI/2;
  
  float rightUpperArmAngle = HALF_PI/2;
  float rightLowerArmAngle = HALF_PI/2;
  float rightHandAngle = HALF_PI/2;
  
  float leftUpperLegAngle = HALF_PI/2;
  float leftLowerLegAngle = HALF_PI/2;
  
  float rightUpperLegAngle = HALF_PI/2;
  float rightLowerLegAngle = HALF_PI/2;
  
  RobotToImitate() {}
  
  void update(int level, AnglesRobot phaseAngles, int passedTime) {
    this.leftUpperArmAngle = phaseAngles.getLeftUpperArmAngle();
    this.leftLowerArmAngle = phaseAngles.getLeftLowerArmAngle();
    this.leftHandAngle = phaseAngles.getLeftHandAngle();
    
    this.rightUpperArmAngle = phaseAngles.getRightUpperArmAngle();
    this.rightLowerArmAngle = phaseAngles.getRightLowerArmAngle();
    this.rightHandAngle = phaseAngles.getRightHandAngle();
    
    this.leftUpperLegAngle = phaseAngles.getLeftUpperLegAngle();
    this.leftLowerLegAngle = phaseAngles.getLeftLowerLegAngle();
    
    this.rightUpperLegAngle = phaseAngles.getRightUpperLegAngle();
    this.rightLowerLegAngle = phaseAngles.getRightLowerLegAngle();
  }
  
  void render() {
    pushMatrix();
      translate(torso.x, torso.y);
      rect(-50, -150, 100, 280);
      
      // head
      pushMatrix();
        translate(0, -190);
        circle(0, 0, 75);
      popMatrix();
      
      // right arm
      pushMatrix();
        translate(40, -125);
        rotate(rightUpperArmAngle);
        rect(-15, -20, 150, 30);
        pushMatrix();
          translate(120, 0);
          rotate(rightLowerArmAngle);
          rect(-15, -17, 120, 25);
          pushMatrix();
            translate(108, 0);
            rotate(rightHandAngle);
            triangle(-5, -20, 40, 0, -5, 15);
          popMatrix();
        popMatrix();
      popMatrix();
      
      //left arm
      pushMatrix();
        translate(-40, -135);
        rotate(leftUpperArmAngle);
        rect(15, 20, -150, -30);
        pushMatrix();
          translate(-120, 10);
          rotate(leftLowerArmAngle);
          rect(15, -17, -120, 25);
          pushMatrix();
            translate(-108, 0);
            rotate(leftHandAngle);
            triangle(5, -15, -40, 5, 5, 20);
          popMatrix();
        popMatrix();
      popMatrix();
      
      // right leg
      pushMatrix();
        translate(20, 110);
        rotate(rightUpperLegAngle);
        rect(-15, -20, 150, 30);
        pushMatrix();
          translate(120, 0);
          rotate(rightLowerLegAngle);
          rect(-15, -17, 120, 25);
        popMatrix();
      popMatrix();
      
      //left leg
      pushMatrix();
        translate(-30, 110);
        rotate(leftUpperLegAngle);
        rect(15, 20, -150, -30);
        pushMatrix();
          translate(-120, 0);
          rotate(leftLowerLegAngle);
          rect(15, 17, -120, -25);
        popMatrix();
      popMatrix();
      
    popMatrix();
  }
  
  void keyPress(){}
  
  void keyRelease(){}

  void mousePress() {}
  
  boolean checkPlayerAngles(AnglesRobot phaseAngles){return false;}
  
  int getPontos(){return 0;}
  
  void addPontos(int pontos){}
}
