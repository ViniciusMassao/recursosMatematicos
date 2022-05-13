float startTime = 0;
Player player = new Player(500, 700);
ArrayList<Enemy> enemies = new ArrayList<>();
Enemy enemy_seek = new Enemy(0, 768,true, 80);
Enemy enemy_escape = new Enemy(500, 500,false, 50);

void setup() {
  size(1024, 768);
  startTime = millis();
  enemies.add(enemy_seek);
  enemies.add(enemy_escape);
}

void draw() {
  float elapsedTime = (millis() - startTime)/1000.0f;
  startTime = millis();
  
  clear();
  if(player.update(elapsedTime)){
    player.render(); 
  }
  
  for(Enemy enemy: enemies){
    if(enemy.update(elapsedTime, player)){
      enemy.render();
    } 
  }
}

void keyPressed() {
  player.keyPressed();
}

void keyReleased() {
  player.keyReleased();
}
