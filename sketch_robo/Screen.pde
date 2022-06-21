public class Screen implements ScreenInterface {
  
  private String title;
  private boolean exit = false;
  
  Screen(String title) {
    this.title = title;
  }
  
  boolean update(int passedTime) {
    return exit;
  }
  
  void render() {
    fill(255,255,255);
    textSize(20);
    text(title, 100, 100);
  }
  
  void mousePress() {
    exit = true;
  }
  
  void keyPress(){}
  
  void keyRelease(){}
  
  void setText(int pontos){
    this.title = this.title + ". Pontuação final = " + pontos;
  }
  
  int getPlayerPontos(){
    return 0;
  }
}
