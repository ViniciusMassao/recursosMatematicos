public class AnglesRobot{
  private float leftUpperArmAngle;
  private float leftLowerArmAngle;
  private float leftHandAngle;
  
  private float rightUpperArmAngle;
  private float rightLowerArmAngle;
  private float rightHandAngle;
  
  private float leftUpperLegAngle;
  private float leftLowerLegAngle;
  
  private float rightUpperLegAngle;
  private float rightLowerLegAngle;
  
  AnglesRobot(float leftUpperArmAngle,
              float leftLowerArmAngle,
              float leftHandAngle,
              float rightUpperArmAngle,
              float rightLowerArmAngle,
              float rightHandAngle,
              float leftUpperLegAngle,
              float leftLowerLegAngle,
              float rightUpperLegAngle,
              float rightLowerLegAngle){
    this.leftUpperArmAngle = leftUpperArmAngle;
    this.leftLowerArmAngle = leftLowerArmAngle;
    this.leftHandAngle = leftHandAngle;
    this.rightUpperArmAngle = rightUpperArmAngle;
    this.rightLowerArmAngle = rightLowerArmAngle;
    this.rightHandAngle = rightHandAngle;
    this.leftUpperLegAngle = leftUpperLegAngle;
    this.leftLowerLegAngle = leftLowerLegAngle;
    this.rightUpperLegAngle = rightUpperLegAngle;
    this.rightLowerLegAngle = rightLowerLegAngle;
  }
  
  float getLeftUpperArmAngle(){
    return leftUpperArmAngle;
  }
  
  float getLeftLowerArmAngle(){
    return leftLowerArmAngle;
  }
  
  float getLeftHandAngle(){
    return leftHandAngle;
  }
  
  float getRightUpperArmAngle(){
    return rightUpperArmAngle;
  }
  
  float getRightLowerArmAngle(){
    return rightLowerArmAngle;
  }
  
  float getRightHandAngle(){
    return rightHandAngle;
  }
  
  float getLeftUpperLegAngle(){
    return leftUpperLegAngle;
  }
  
  float getLeftLowerLegAngle(){
    return leftLowerLegAngle;
  }
  
  float getRightUpperLegAngle(){
    return rightUpperLegAngle;
  }
  
  float getRightLowerLegAngle(){
    return rightLowerLegAngle;
  }
  
  
}
