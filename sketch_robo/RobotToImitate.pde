public class RobotToImitate implements RobotInterface {
  
  private PVector torso = new PVector(width/1.5, height/2);
  private PVector leftUpperArm;
  private PVector leftLowerArm;
  private PVector rightUpperArm;
  private PVector rightLowerArm;
  private PVector leftUpperLeg;
  private PVector leftLowerLeg;
  private PVector rightUpperLeg;
  private PVector rightLowerLeg;
  
  float angle = HALF_PI/2;
  
  RobotToImitate() {
    generateRandomPos();
  }
  
  void update() {
    angle += 0.01;
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
        //rotate(angle);
        rect(-15, -20, 150, 30);
        pushMatrix();
          translate(120, 0);
          rect(-15, -17, 120, 25);
          pushMatrix();
            translate(108, 0);
            //rotate(angle);
            triangle(-5, -20, 40, 0, -5, 15);
          popMatrix();
        popMatrix();
      popMatrix();
      
      //left arm
      pushMatrix();
        translate(-40, -135);
        //rotate(-angle);
        rect(15, 20, -150, -30);
        pushMatrix();
          translate(-120, 10);
          //rotate(angle);
          rect(15, -17, -120, 25);
          pushMatrix();
            translate(-108, 0);
            //rotate(angle);
            triangle(5, -15, -40, 5, 5, 20);
          popMatrix();
        popMatrix();
      popMatrix();
      
      // right leg
      pushMatrix();
        translate(20, 110);
        //rotate(-4.7);
        //rotate(angle);
        rect(-15, -20, 150, 30);
        pushMatrix();
          translate(120, 0);
          rect(-15, -17, 120, 25);
        popMatrix();
      popMatrix();
      
      //left leg
      pushMatrix();
        translate(-30, 110);
        //rotate(4.7);
        //rotate(-angle);
        rect(15, 20, -150, -30);
        pushMatrix();
          translate(-120, 0);
          rect(15, 17, -120, -25);
        popMatrix();
      popMatrix();
      
    popMatrix();
  }
  
  void keyPress(){}
  
  void keyRelease(){}

  void mousePress() {}

  void generateRandomPos(){
    
  }
}
