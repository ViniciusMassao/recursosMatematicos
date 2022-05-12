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
    
    if(enemy.update(shotToRemove, elapsedTime, player)) {
      enemy.render();
      
      // tiro inimigo
      //System.out.println(elapsedTime);
      float playerX = player.getX();
      float playerY = player.getY();
      float enemyX = enemy.getX();
      float enemyY = enemy.getY();
      //System.out.println("DIST = "+dist(playerX, playerY,enemyX, enemyY));
      if(dist(playerX, playerY,enemyX, enemyY) <= 200){
        Shot shot = enemy.shoot(player);
        if (shot != null) {
          shotsEnemy.add(shot);
        }
      }
      
      Shot shotToRemoveEnemy = null;
      int aux = 0;
      for(Shot shot: shotsEnemy) {
        if (!shot.update(elapsedTime)) {
          shotToRemoveEnemy = shot;
          //if (shotToRemoveEnemy != null) {
          //  player.checkCollisionShot(shotToRemoveEnemy);
          //  //System.out.println("Morri");
          //  shots.remove(shotToRemoveEnemy);
          //}
        }
        //System.out.println("INDICE = " + aux);
        aux++;
      }
      
      if (shotToRemoveEnemy != null) {
        player.checkCollisionShot(shotToRemoveEnemy);
        //System.out.println("LIFE = " + player.checkLife());
        shots.remove(shotToRemoveEnemy);
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
