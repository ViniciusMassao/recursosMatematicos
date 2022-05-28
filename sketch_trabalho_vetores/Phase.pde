public class Phase implements ScreenInterface {
  
  private int level = 0;
  private boolean exit = false;
  private Player player = new Player(500, 700);
  private ArrayList<Enemy> enemies = new ArrayList<>();
  private Enemy enemy_seek = new Enemy(200, 100, true, 80);
  private Enemy enemy_escape = new Enemy(500, 500, false, 80);
  private ArrayList<Shot> shots = new ArrayList<>();
  private ArrayList<Shot> enemyShots = new ArrayList<>();
  
  Phase(int level) {
    this.level = level;
    enemies.add(enemy_seek);
    enemies.add(enemy_escape);
  }
  
  boolean update(){
    if(!enemy_escape.alive()) exit = true;
    if(!player.alive()) exit = true;
    return exit;
  }
  
  void render(float elapsedTime){
    if(player.update(elapsedTime)){
      player.render(); 
    }
    
    // tiro do player
    Shot shotToRemove = null;
    for(Shot shot: shots) {
      if (!shot.update(elapsedTime, enemy_escape.getPos())) {
        shotToRemove = shot;
      }
    }
    if (shotToRemove != null) {
      shots.remove(shotToRemove);
    }
      
    for(Shot shot: shots) {
      enemy_escape.checkColision(shot);
      shot.render();
    }
    
    // tiro do inimigo
    if(enemy_seek.engageShotDist(player)){
      Shot shot = enemy_seek.shoot(player);
      if(shot != null){
        enemyShots.add(shot);
      }
    }
    
    Shot enemyShotToRemove = null;
    for(Shot shot: enemyShots) {
      if (!shot.update(elapsedTime, player.getPos())) {
        enemyShotToRemove = shot;
      }
    }
    
    if (enemyShotToRemove != null) {
      enemyShots.remove(enemyShotToRemove);
    }
      
    for(Shot shot: enemyShots) {
      player.checkColision(shot);
      shot.render();
    }
    
    for(Enemy enemy: enemies){
      if(enemy.update(elapsedTime, player, enemy_seek)){
        enemy.render();
      } 
    }
  }
  
  void keyPress() {
    player.keyPressed();
  }
  
  void keyRelease() {
    player.keyReleased();
  }
  
  void mousePress(){
    Shot shot = player.shoot(enemy_escape);
    if (shot != null) {
      shots.add(shot);
    } 
  }

}
