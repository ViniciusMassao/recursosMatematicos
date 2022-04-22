float x = 300;
float y = 300;
float d = 150;
boolean pressed = false;
float startTime = 0;
Circle c1;
ArrayList<Circle> enemies = new ArrayList<>();

void setup() {
  size(1024, 768);
  fill(255, 255, 255);
  c1 = new Circle(150, 500, 40, 200, PI/6);
  enemies.add(new Circle(550, 300, 30, -250, PI/5));
  enemies.add(new Circle(400, 700, 35, 230, PI/3));
  startTime = millis();
}

void draw() {
  float elapsedTime = (millis() - startTime) / 1000.0f;
  startTime = millis();
  clear();
  update(elapsedTime);
  c1.render();
  for (Circle c : enemies) {
    c.render();
  }
}

void update(float elapsedTime) {
  c1.update(elapsedTime);
  for (Circle c : enemies) {
    c.update(elapsedTime);
  }
  Circle enemy = c1.verifyCollision(enemies);
  if (enemy != null) {
    enemy.hit(true);
    c1.hit(true);
  } 
  else {
    c1.hit(false);
    for (Circle c : enemies) {
      c.hit(false);
    }
  }
}
