Tower tower = new Tower();
Enemy enemy = new Enemy();
Bullet bullet = new Bullet(enemy);

void setup() {
  size(500,500);
  noStroke();
  fill(255);
  rectMode(CENTER);
  frameRate(30);
}

void draw(){
  background(0);
  tower.display();
  if(enemy.health > 0){
    enemy.display();
  }
  if(bullet.pierce > 0){
    bullet.display();
  }
  
}