public class RobotPlayer implements RobotInterface {
  
  private PVector torso = new PVector(width/3, height/2);
  
  private float leftUpperArmAngle = 0;
  private float leftLowerArmAngle = 0;
  private float leftHandAngle = 0;
  
  private float rightUpperArmAngle = 0;
  private float rightLowerArmAngle = 0;
  private float rightHandAngle = 0;
  
  private float leftUpperLegAngle = 0;
  private float leftLowerLegAngle = 0;
  
  private float rightUpperLegAngle = 0;
  private float rightLowerLegAngle = 0;
  
  private int pontos = 0;
  
  RobotPlayer() {}
  
  void update(int level, AnglesRobot phaseAngles, int passedTime) {
    //System.out.println("leftUpperArmAngle = " + leftUpperArmAngle);
    //System.out.println("leftLowerArmAngle = " + leftLowerArmAngle);
    //System.out.println("leftHandAngle = " + leftHandAngle);
    
    //System.out.println("rightUpperArmAngle = " + rightUpperArmAngle);
    //System.out.println("rightLowerArmAngle = " + rightLowerArmAngle);
    //System.out.println("rightHandAngle = " + rightHandAngle);
    
    //System.out.println("leftUpperLegAngle = " + leftUpperLegAngle);
    //System.out.println("leftLowerLegAngle = " + leftLowerLegAngle);
    
    //System.out.println("rightUpperLegAngle = " + rightUpperLegAngle);
    //System.out.println("rightLowerLegAngle = " + rightLowerLegAngle);
    
    this.pontos = passedTime;
    
    if(leftUpperArmAngle >= 1.5){
      leftUpperArmAngle = 1.5;
    }
    if(leftUpperArmAngle <= -1.5){
      leftUpperArmAngle = -1.5;
    }
    
    if(leftLowerArmAngle >= 1.5){
      leftLowerArmAngle = 1.5;
    }
    if(leftLowerArmAngle <= -1.5){
      leftLowerArmAngle = -1.5;
    }
    
    if(leftHandAngle >= 1.5){
      leftHandAngle = 1.5;
    }
    if(leftHandAngle <= -1.5){
      leftHandAngle = -1.5;
    }
    
    if(rightUpperArmAngle >= 1.5){
      rightUpperArmAngle = 1.5;
    }
    if(rightUpperArmAngle <= -1.5){
      rightUpperArmAngle = -1.5;
    }
    
    if(rightLowerArmAngle >= 1.5){
      rightLowerArmAngle = 1.5;
    }
    if(rightLowerArmAngle <= -1.5){
      rightLowerArmAngle = -1.5;
    }
    
    if(rightHandAngle >= 1.5){
      rightHandAngle = 1.5;
    }
    if(rightHandAngle <= -1.5){
      rightHandAngle = -1.5;
    }
    
    if(leftUpperLegAngle >= 1.0){
      leftUpperLegAngle = 1.0;
    }
    if(leftUpperLegAngle <= -2.0){
      leftUpperLegAngle = -2.0;
    }
    
    if(leftLowerLegAngle >= 0.0){
      leftLowerLegAngle = 0.0;
    }
    if(leftLowerLegAngle <= -1.5){
      leftLowerLegAngle = -1.5;
    }
    
    if(rightUpperLegAngle >= 2.0){
      rightUpperLegAngle = 2.0;
    }
    if(rightUpperLegAngle <= -1.0){
      rightUpperLegAngle = -1.0;
    }
    
    if(rightLowerLegAngle >= 1.5){
      rightLowerLegAngle = 1.5;
    }
    if(rightLowerLegAngle <= 0.0){
      rightLowerLegAngle = 0.0;
    }
    
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
      // upper part
      pushMatrix();
        translate(40, -125);
        rotate(rightUpperArmAngle);
        rect(-15, -20, 150, 30);
        // lower part
        pushMatrix();
          translate(120, 0);
          rotate(rightLowerArmAngle);
          rect(-15, -17, 120, 25);
          // hand
          pushMatrix();
            translate(108, 0);
            rotate(rightHandAngle);
            triangle(-5, -20, 40, 0, -5, 15);
          popMatrix();
        popMatrix();
      popMatrix();
      
      // left arm
      // upper
      pushMatrix();
        translate(-40, -135);
        rotate(leftUpperArmAngle);
        rect(15, 20, -150, -30);
        // lower
        pushMatrix();
          translate(-120, 10);
          rotate(leftLowerArmAngle);
          rect(15, -17, -120, 25);
          // hand
          pushMatrix();
            translate(-108, 0);
            rotate(leftHandAngle);
            triangle(5, -15, -40, 5, 5, 20);
          popMatrix();
        popMatrix();
      popMatrix();
      
      // right leg
      // upper
      pushMatrix();
        translate(20, 110);
        rotate(rightUpperLegAngle);
        rect(-15, -20, 150, 30);
        // lower
        pushMatrix();
          translate(120, 0);
          rotate(rightLowerLegAngle);
          rect(-15, -17, 120, 25);
        popMatrix();
      popMatrix();
      
      // left leg
      // upper
      pushMatrix();
        translate(-30, 110);
        rotate(leftUpperLegAngle);
        rect(15, 20, -150, -30);
        // lower
        pushMatrix();
          translate(-120, 0);
          rotate(leftLowerLegAngle);
          rect(15, 17, -120, -25);
        popMatrix();
      popMatrix();

    popMatrix();
  }
  
  void keyPress(){
    // left arm upper part
    if(key == 'Q' || key == 'q'){
      leftUpperArmAngle += 0.5;
    }
    else if(key == 'W' || key == 'w'){
      leftUpperArmAngle -= 0.5;
    }
    
    // left arm lower part
    else if(key == 'A' || key == 'a'){
      leftLowerArmAngle += 0.5;
    }
    else if(key == 'S' || key == 's'){
      leftLowerArmAngle -= 0.5;
    }
    
    // left hand 
    else if(key == 'Z' || key == 'z'){
      leftHandAngle += 0.5;
    }
    else if(key == 'X' || key == 'x'){
      leftHandAngle -= 0.5;
    }
    
    // right arm upper part 
    else if(key == 'E' || key == 'e'){
      rightUpperArmAngle += 0.5;
    }
    else if(key == 'R' || key == 'r'){
      rightUpperArmAngle -= 0.5;
    }
    
    // right arm lower part 
    else if(key == 'D' || key == 'd'){
      rightLowerArmAngle += 0.5;
    }
    else if(key == 'F' || key == 'f'){
      rightLowerArmAngle -= 0.5;
    }
    
    // right hand
    else if(key == 'C' || key == 'c'){
      rightHandAngle += 0.5;
    }
    else if(key == 'V' || key == 'v'){
      rightHandAngle -= 0.5;
    }
    
    // left leg upper part 
    else if(key == 'T' || key == 't'){
      leftUpperLegAngle += 0.5;
    }
    else if(key == 'Y' || key == 'y'){
      leftUpperLegAngle -= 0.5;
    }
    
    // left leg lower part 
    else if(key == 'G' || key == 'g'){
      leftLowerLegAngle += 0.5;
    }
    else if(key == 'H' || key == 'h'){
      leftLowerLegAngle -= 0.5;
    }
    
    // right leg upper part 
    else if(key == 'U' || key == 'u'){
      rightUpperLegAngle += 0.5;
    }
    else if(key == 'I' || key == 'i'){
      rightUpperLegAngle -= 0.5;
    }
    
    // right leg lower part 
    else if(key == 'J' || key == 'j'){
      rightLowerLegAngle += 0.5;
    }
    else if(key == 'K' || key == 'k'){
      rightLowerLegAngle -= 0.5;
    }
    
  }
  
  void keyRelease(){}

  void mousePress() {}
  
  boolean checkPlayerAngles(AnglesRobot phaseAngles){
    int count = 0;
    
    if (this.leftUpperArmAngle == phaseAngles.getLeftUpperArmAngle()) count++;
    if (this.leftLowerArmAngle == phaseAngles.getLeftLowerArmAngle()) count++;
    if (this.leftHandAngle == phaseAngles.getLeftHandAngle()) count++;
    
    if (this.rightUpperArmAngle == phaseAngles.getRightUpperArmAngle()) count++;
    if (this.rightLowerArmAngle == phaseAngles.getRightLowerArmAngle()) count++;
    if (this.rightHandAngle == phaseAngles.getRightHandAngle()) count++;
    
    if (this.leftUpperLegAngle == phaseAngles.getLeftUpperLegAngle()) count++;
    if (this.leftLowerLegAngle == phaseAngles.getLeftLowerLegAngle()) count++;
    
    if (this.rightUpperLegAngle == phaseAngles.getRightUpperLegAngle()) count++;
    if (this.rightLowerLegAngle == phaseAngles.getRightLowerLegAngle()) count++;
    
    if (count == 10)
      return true;
    else 
      return false;
  }
  
  void addPontos(int pontos){
    this.pontos += pontos;
  }
  
  int getPontos(){
    return 90 - pontos/1000;
  }
}
