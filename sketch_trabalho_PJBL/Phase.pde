public class Phase implements ScreenInterface {
  
  private boolean exit = false;
  private int level;
  private Circle player = new Circle(10, 740, 100, 1);
  private ArrayList<Shot> shots = new ArrayList<>();
  private ArrayList<Shot> shotsEnemy = new ArrayList<>();
  private ArrayList<Plataform> plataforms = new ArrayList<>();
  private Key level_key = new Key(160, 170, 25, 25);
  private Door level_door = new Door(925, 310, 65, 80);
  private Enemy enemy = new Enemy(900, 385);
  //private Enemy enemy = new Enemy(500, 735);
  private int auxShot = 0;
  
  Phase(int level) {
    this.level = level;
    plataforms.add(new PlataformStatic(100, 500, 200, 20));
    plataforms.add(new PlataformStatic(150, 200, 200, 20));
    plataforms.add(new PlataformStatic(-20, 748, 1300, 20));
    plataforms.add(new PlataformStatic(650, 400, 1300, 20));
    plataforms.add(new PlataformNonStatic(350, 250, 200, 20, 80));
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
    else exit = true;
    
    if(player.update(elapsedTime, plataforms)) player.render();
    else{
      exit = true;
    }
    
    // tiro player
    Shot shotToRemove = null;
    for(Shot shot: shots) {
      if (!shot.update(null, enemy)) {
        shotToRemove = shot;
      }
    }
    if (shotToRemove != null) {
      shots.remove(shotToRemove);
    }
    
    for(Shot shot: shots) {
      shot.render();
    }
    
    if(enemy.update(shotToRemove)) {
      enemy.render();
      
      // tiro inimigo
      float playerX = player.getX();
      float playerY = player.getY();
      float enemyX = enemy.getX();
      float enemyY = enemy.getY();
      
      auxShot++;
      if(dist(playerX, playerY,enemyX, enemyY) <= 250 && auxShot%10 == 0){
        Shot shot = enemy.shoot(player);
        if (shot != null) {
          shotsEnemy.add(shot);
        }
      }
      
      Shot shotToRemoveEnemy = null;
      for(Shot shot: shotsEnemy) {
        if (!shot.update(player, null)) {
          shotToRemoveEnemy = shot;
            player.checkCollisionShot(shotToRemoveEnemy);
        }
      }
      
      if (shotToRemoveEnemy != null) {
        shotsEnemy.remove(shotToRemoveEnemy);
      }
      
      for(Shot shot: shotsEnemy) {
        shot.render();
      }
    }  
  }
  
  void keyPress(){
    player.keyPressed();
  }

  void mousePress(){    
    Shot shot = player.shoot();
    if (shot != null) {
      shots.add(shot);
    }
  }
}
