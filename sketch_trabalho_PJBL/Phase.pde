public class Phase implements ScreenInterface {
  
  private boolean exit = false;
  Circle myCircle;
  ArrayList<Circle> enemies;
  ArrayList<Plataform> plataformas;
  
  Phase(Circle myCircle, ArrayList<Circle> enemies) {
    this.myCircle = myCircle;
    this.enemies = enemies;
  }
  
  boolean update() {
    return exit;
  }
  
  void render(float elapsedTime) {
    myCircle.update(elapsedTime);
    myCircle.render();
  }
  
  void mousePress() {
    exit = true;
  }
}
