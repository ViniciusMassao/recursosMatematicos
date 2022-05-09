public class Phase implements ScreenInterface {
  
  private boolean exit = false;
  private int level;
  private Circle player = new Circle(150, 600, 100, 1);
  private ArrayList<Shot> shots = new ArrayList<>();
  private ArrayList<Circle> enemies = new ArrayList<>();
  private ArrayList<Plataform> plataforms = new ArrayList<>();
  private Key level_key = new Key(160, 160, 25, 25);
  private Door level_door = new Door(925, 300, 65, 80);
  
  Phase(int level) {
    this.level = level;
    plataforms.add(new PlataformStatic(100, 500, 200, 20));
    plataforms.add(new PlataformStatic(150, 200, 200, 20));
    plataforms.add(new PlataformStatic(-20, 768, 1300, -20));
    plataforms.add(new PlataformStatic(650, 400, 1300, -20));
    plataforms.add(new PlataformNonStatic(350, 250, 200, 20, 80));
    enemies.add(new Circle(1000, 500, 40, 200));
  }
  
  boolean playerAlive(){
    return this.player.alive();
  }
  
  boolean update() {
    return exit;
  }
  
  void render(float elapsedTime) {
    for (Plataform plataform: plataforms){
      if(plataform.update()) plataform.render();
    }
    
    if(level_key.update(player)) level_key.render();
    
    if(!level_door.update(level_key, player)) level_door.render();
    
    if(player.update(elapsedTime, plataforms)) player.render();
    
    else System.out.println("Player morto");
    
    Shot shotToRemove = null;
    for(Shot shot: shots) {
      if (!shot.update(elapsedTime)) {
        shotToRemove = shot;
      }
    }
    if (shotToRemove != null) {
      shots.remove(shotToRemove);
    }
    
    for(Shot shot: shots) {
      shot.render();
    }
  }
  
  void keyPress(){
    player.keyPressed();
  }
  
  void mousePress(){
    //exit = true;
    //player.mousePressed(); 
    
    Shot shot = player.shoot();
    if (shot != null) {
      shots.add(shot);
    }
  }
}
